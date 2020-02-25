//package net.codejava.upload;
package java.com;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)	// upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {
	
	// database connection settings
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// gets values of text fields
		String logicid = request.getParameter("qid");
		String loginid = request.getParameter("lid");
		
		InputStream inputStream = null;	// input stream of the upload file
		
		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("logicanswer");
		if (filePart != null) {
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			
			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		
		
		Connection conn = null;	// connection to the database
		int flag = 0;	// message will be sent back to client
		
		try {
			// connects to the database
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
     conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cf","root","root");
     
			// constructs SQL statement
			String sql = "INSERT INTO logicalanswer (logicid, loginid, answer) values (?, ?, ?)";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, logicid);
			statement.setString(2, loginid);
			
			if (inputStream != null) {
				// fetches input stream of the upload file for the blob column
                                System.out.println("Haiii");
				statement.setBlob(3, inputStream);
			}

			// sends the statement to the database server
			int row = statement.executeUpdate();
			if (row > 0) {
				flag=1;
                                
			}
		} catch (Exception ex) {
			
			ex.printStackTrace();
                
		} finally {
			if (conn != null) {
				// closes the database connection
				try {
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
                                        getServletContext().getRequestDispatcher("/logic.jsp?status=false").forward(request, response);
				}
			}
			// sets the message in request scope
		
			
			// forwards to the message page
                        if(flag==1)
                        {
//                           / request.removeAttribute("logicExam");
			getServletContext().getRequestDispatcher("/logicExamComplet.jsp").forward(request, response);
                        }
		}
	
                }
                else
                {
                    getServletContext().getRequestDispatcher("/logicQuestion.jsp?status=false").forward(request, response);
                }
        }
}