<%-- 
    Document   : signup
    Created on : May 18, 2017, 12:35:34 PM
    Author     : bhagavan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign-up/Register</title>
        <style>
            body{
                background-image:url("back.jpg");
                //background-color: #141414;
                font-size: 20px;   
                color: white;
            }
            .topnav, .log {
                background-color: #990000;
                color: white;
                overflow: hidden;
            }
            .topnav a, .log a {
                float: left;
                display: block;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 19px;
                //font-family: cursive;
            }
            .topnav a:hover,.log a:hover {
                background-color: #ddd;
                color: black;
            }
            .topnav a:active {
                color: white;
                background-color: #ddd; 
            }
            .log{
                float:right;
            }
            .wel{
                float:right;
                text-align: center;
                padding: auto;
                display:block;
            }
            input{
                font-family: cursive;
                font-size: 18px;
                width: 300px;
                padding: 12px 20px;
                margin: 8px 0;
                box-sizing: border-box;
                border-radius: 4px;
            }
            input[type=radio]{
                width:50px;
            }
            img{
                margin-left: 520px;
            }
            .myform{
                //margin-top: 100px;
                margin-left: 150px;
            }
            h2{
                margin-left: 300px;
                margin-top: 50px;
                font-family: Calibri;
            }
            
            .text{
                font-family: fantasy;
            }
            .button{
                background-color: #990000;
                padding: 15px 32px;
                text-align: center;
                border: none;
                text-decoration: none;
                color: white;
                display: inline-block;
                border-radius: 4px;
                font-size: 16px;
            }
            
            input::placeholder{
                color:#990000;
            }
            
        </style>
        <script type=text/javascript>
            function validateform()  
            {  
                var f1_name=document.getElementById('nameid').value;
                var name_pattern=/^[A-Za-z]{2,30}$/i;
                if(name_pattern.test(f1_name)){
                }else{
                    alert("Only Characters allowed");
                    document.getElementById('nameid').focus();
                    return false;
                } 
                
                var m_name=document.getElementById('mailid').value;
                var mail_pattern=/^\w+([\.-]?\ w+)*@\w+([\.-]?\ w+)*(\.\w{2,3})+$/i;
                if(mail_pattern.test(m_name)){
                }else{
                    alert("enter validate mail id");
                    document.getElementById('mailid').focus();
                    return false;
                } 
                
                var p_name=document.getElementById('pwdid').value;
                var cp_name=document.getElementById('cpwdid').value;
                if(p_name == cp_name){
                }else{
                    alert("Passwords does not match");
                    document.getElementById('pwdid').focus();
                    return false;
                }
                
                var ph_name=document.getElementById('mobileid').value;
                var mobile_pattern=/^[7|8|9]{1}[0-9]{9}$/i;
                if(mobile_pattern.test(ph_name)){
                }else{
                    alert("10 digits allowed");
                    document.getElementById('mobileid').focus();
                    return false;
                }
               // alert("Registered successfully");        
                return true;
            } 
        </script>
    </head>
    <body>
        <img src="logo3.JPG" alt="Logo" style="width:400px;height:150px;">
        <div class="topnav" id="myTopnav"> 
            <a href="home.jsp"> Home</a>
            <a href="about.jsp"> About</a>
            <a href="contact.jsp"> Contact us</a> 
            
            <div class=log>
                <a href="index.jsp"> Login</a>
            </div>
        </div>
        
        <h2> Create a New Account </h2>
        <form class="myform" name="registerform" onsubmit="return validateform()" action="signup1.jsp" method="post">
            <table class="text">
                <tr> 
                    <td> <input type="text" name="fname" id="nameid" placeholder="First Name"  required> </td> 
                
                    <td> <input type="text" name="lname" placeholder="Last Name"  required> </td> 
                </tr>
                
                <tr>
                    <td> <input type="text" name="email" id="mailid" placeholder="Email address"  required> </td>
                
                    <td><input type="password" name="password" id="pwdid" placeholder="Password" required> </td>
                </tr>
                
                <tr>
                    <td><input type="password" name="confirmpassword" id="cpwdid" placeholder="Confirm Password" required></td>
                
                    <td><input type="number" name="mobile" id="mobileid" placeholder="Mobile Number" required> </td>
                </tr>
                
                <tr>
                    <td><input type="radio" value="male" name="gender" required> Male
                        <input type="radio" name="gender" value="female" required> Female</td>
                </tr>
                
                <tr>
                    <td> <input type="submit" class="button" value="Create Account"> </td>
                </tr>
            </table>
        </form>
    </body>

</html>
