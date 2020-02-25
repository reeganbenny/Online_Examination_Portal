function validateForm() {
  
     try
     {

        var fn=document.getElementById('fname').value;
        var ln=document.getElementById('lname').value;
        var hn=document.getElementById('hname').value;
        var dis=document.getElementById('dist').value;
        var city=document.getElementById('city').value;
        var state=document.getElementById('state').value;
        var pin=document.getElementById('pin').value;
        var mob=document.getElementById('mob').value;
        var email=document.getElementById('emailid').value;
        var col=document.getElementById('col').value;
        var deg=document.getElementById('deg').value;
        var upass=document.getElementById('upass').value;
        var cpass=document.getElementById('cpass').value;
        var emailval=document.getElementById('emailval').value;
        var echeck =/^[a-z]+[a-z0-9._%+-]+@[a-z]+[a-z0-9]+.[a-z]+$/;
        var emailcheck="Already registered with same email id!!!!";
        if(fn === '')
        {
            alert('Field Required');
            document.getElementById('fname').style.borderColor = "red";
            document.getElementById('fname').focus();
            return false;
        }
        else if(/^[0-9]+$/.test(fn))
        {

            alert('First Name contains numbers');
            document.getElementById('fname').style.borderColor = "red";
            document.getElementById('fname').focus();
            return false;

        }
        if(ln === "")
        {
            alert('Field Required');
            document.getElementById('lname').style.borderColor = "red";
            document.getElementById('lname').focus();
            return false;
        }
         else if(/^[0-9]+$/.test(ln))
        {

            alert('Last Name contains numbers');
            document.getElementById('lname').style.borderColor = "red";
            document.getElementById('lname').focus();
            return false;
        }
        if(hn === "")
        {
            alert('Field Required');
            document.getElementById('hname').style.borderColor = "red";
            document.getElementById('hname').focus();
            return false;
        }
        if(dis === "")
        {
            alert('Field Required ');
            document.getElementById('dist').style.borderColor = "red";
            document.getElementById('dist').focus();
            return false;
        }
     else if(/^[0-9]+$/.test(dis))
    {
         
        alert('District contains numbers');
        document.getElementById('dist').style.borderColor = "red";
        document.getElementById('dist').focus();
        return false;
    
    }
    if(city === "")
    {
        alert('Field Rquired ');
        document.getElementById('city').style.borderColor = "red";
        document.getElementById('city').focus();
        return false;
    }
     else if(/^[0-9]+$/.test(dis))
    {
         
        alert('City contains numbers');
        document.getElementById('city').style.borderColor = "red";
        document.getElementById('city').focus();
        return false;
    
    }
    
    
    if(state === "")
    {
        alert('Field Rquired ');
        document.getElementById('state').style.borderColor = "red";
        document.getElementById('state').focus();
        return false;
    }
     else if(/^[0-9]+$/.test(dis))
    {
        alert('State contains numbers');
        document.getElementById('state').style.borderColor = "red";
        document.getElementById('state').focus();
        return false;
    
    }
    
    if(pin === "")
    {
        alert('Field Required');
        document.getElementById('pin').style.borderColor="red";
        document.getElementById('pin').focus();
        return false;
    }
    else if(isNaN(pin))
    {
        alert('Inavlid PIN');
        document.getElementById('pin').style.borderColor="red";
        document.getElementById('pin').focus();
        return false;
    }
    if(mob === "")
    {
        alert('Field Required');
        document.getElementById('mob').style.borderColor="red";
        document.getElementById('mob').focus();
        return false;
    }
    else if (!(/^\d{10}$/.test(mob)))
    {
 
        alert("Invalid number; must be ten digits");
        document.getElementById('mob').style.borderColor="red";
        document.getElementById('mob').focus();
        return false;
    }

    if(deg === "")
    {
        alert('Field Required');
        document.getElementById('deg').style.borderColor="red";
        document.getElementById('deg').focus();
        return false;
    }
       if(col === "")
    {
        alert('Field Required');
        document.getElementById('col').style.borderColor="red";
        document.getElementById('col').focus();
        return false;
    }
     if(email === "")
    {
        alert('Field Required');
        document.getElementById('emailid').style.borderColor="red";
        document.getElementById('emailid').focus();
        return false;
    }
    else if (!echeck.test(email))
    {
 
        alert("Invalid email address....");
        document.getElementById('emailid').style.borderColor="red";
        document.getElementById('emailid').focus();
        return false;
    }
    else if(emailval.includes(emailcheck))
    {
   
       alert("Email already registered....");
        document.getElementById('emailid').style.borderColor="red";
        document.getElementById('emailid').focus();
        return false;
    }
   

  
    
    if(upass === "")
    {
        alert('Field Required');
        document.getElementById('upass').style.borderColor="red";
        document.getElementById('upass').focus();
        return false;
    }
    else if (!(/^[A-za-z0-9]\w{4,10}$/.test(upass)))
    {
 
        alert("password contains minimum 4 and maximum 10 character");
        document.getElementById('upass').style.borderColor="red";
        document.getElementById('upass').focus();
        return false;
    } 
    if(cpass === "")
    {
        alert('Field Required');
        document.getElementById('cpass').style.borderColor="red";
        document.getElementById('cpass').focus();
        return false;
    }
    else if(upass !== cpass)
    {
        alert('Password didnot match');
        document.getElementById('cpass').style.borderColor="red";
        document.getElementById('cpass').focus();
        return false;
    }
     }
     catch(e)
     {
         alert('error in regvalidation');
     }
    
    return true;
}