<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<%

String connectionURL = "jdbc:mysql://localhost:3306/cf";
if(request.getParameter("qid")!=null && (request.getParameter("qid")!="") && request.getParameter("lid")!=null && request.getParameter("lid")!="")
{
	int lid =  Integer.parseInt(request.getParameter("lid"));
        int qid =  Integer.parseInt(request.getParameter("qid"));
	String filename = "Answer"+lid+""+qid+".txt";
	Connection con=null;
	try{      
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		con=DriverManager.getConnection(connectionURL,"root","");      
		Statement st1=con.createStatement();
		String strQuery = "select answer from logicalanswer where logicid="+qid+" and loginid="+lid;
		
		ResultSet rs1 = st1.executeQuery(strQuery);
	
		String fileLen="";
		if(rs1.next()){
			fileLen = rs1.getString(1);
	   	}  
               
		 	st1.close();
                        response.reset();
			response.setContentType("text/plain");
			response.setHeader("Content-disposition","attachment; filename=" +filename);
                        			out.println(fileLen);
                     
	}
	catch (Exception e){
		out.print(e.getMessage());
	}
}
%>
