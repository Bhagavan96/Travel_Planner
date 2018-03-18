<%-- 
    Document   : update
    Created on : May 23, 2017, 3:13:48 PM
    Author     : bhagavan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
        <style>
            body{
                font-size: 20px;
                color: #990000;
                background-image:url("back.jpg");
            }
            .topnav {
                background-color: #990000;
                color: white;
                overflow: hidden;
            }
            .topnav a {
                float: left;
                display: block;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 19px;
            }
            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }
            .topnav a.active {
                background-color: #4CAF50;
                color: white;
            }
            .log{
                float:right;
            }
            .wel{
                float:right;
                text-align: center;
                padding: auto;
                display:block;
                margin-top: 13px;
            }
            img{
                margin-left: 525px;
                margin-bottom: 10px;
            }
            input{
                font-family: cursive;
                font-size: 18px;
                width: 300px;
                padding: 12px 20px;
                margin: 8px 0;
                box-sizing: border-box;
                border-radius: 8px;
            }
            input[type=radio]{
                width:50px;
            }
            .bookcab{
                margin-left: 600px;
            }
            .text{
                font-family: fantasy;
            }
            .b1{
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
            h2{
                font-family: cursive;
                margin-left: 300px;
                color: white;
            }
            .myform{
                margin-left: 150px;
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
                return true;
            } 
        </script>
    </head>
    <body>
                <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
    %>
        <img src="logo3.JPG" alt="Logo" style="width:400px;height:150px;">
        <div class="topnav" id="myTopnav">
             <% try{
                String nme = (String) session.getAttribute("user");
            %>
             <%if(!(nme.equals("null"))){ %> <a href="dashboard.jsp"> Home</a> <% ;} 
                 else { %> <a href="index.jsp"> Home</a> <% ;} %>
            <a href="about.jsp"> About</a>
            <a href="contact.jsp"> Contact us</a> 
            <div class="wel"> <%if(!(nme.equals("null"))) out.print("Welcome " + nme);%> </div>
            <div class=log>
                <%if(!(nme.equals("null"))){ %> <a href="logout.jsp"> Logout</a> <% ;} 
                 else { %> <a href="index.jsp"> Login</a> <% ;} 
                 }
                 catch(Exception e)
                 {
                     %>
                     <a href="index.jsp"> Home</a>
                     <a href="about.jsp"> About</a>
                     <a href="contact.jsp"> Contact us</a> 
                     <div class=log>
                         <a href="index.jsp"> Login</a>
                     </div>
                     <%
                 }
                 %>  
            </div>
        </div>
             <h2> Update Your Account </h2>
        <form class="myform" onsubmit="return validateform()" action="update1.jsp" method="post">
            <table class="text">
                <tr> 
                    <td> <input type="text" name="fname" id="nameid" placeholder="First Name" value="<%= (String) session.getAttribute("user")%>" required> </td> 
                
                    <td> <input type="text" name="lname" placeholder="Last Name" value="<%= (String) session.getAttribute("lname")%>" required> </td> 
                </tr>
                
                <tr>
                    <td> <input type="text" name="email" id="mailid" placeholder="Email address" value="<%= (String) session.getAttribute("email")%>" required> </td>
                
                    <td><input type="password" name="password" id="pwdid" placeholder="Password" value="<%= (String) session.getAttribute("password")%>" required> </td>
                </tr>
                
                <tr>
                    <td><input type="password" name="confirmpassword" id="cpwdid" placeholder="Confirm Password" value="<%= (String) session.getAttribute("password")%>" required></td>
                
                    <td><input type="number" name="mobile" id="mobileid" placeholder="Mobile Number" value="<%= (String) session.getAttribute("mobile")%>" required> </td>
                </tr>
                
                <tr>
                    <td><input type="radio" value="male" name="gender" required> Male
                        <input type="radio" name="gender" value="female" required> Female</td>
                </tr>
                
                <tr>
                    <td> <input type="submit" class="b1" value="Update Account"> </td>
                </tr>
            </table>
        </form>

    </body>
</html>
