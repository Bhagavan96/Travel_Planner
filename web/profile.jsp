<%-- 
    Document   : profile
    Created on : May 18, 2017, 11:52:24 PM
    Author     : bhagavan
--%>

<%@page import="java.sql.*"%>
        <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
    %>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "");

        Statement stmt = con.createStatement();
        String nme = (String) session.getAttribute("user");
        ResultSet rs = stmt.executeQuery("select * from regis where fname='" + nme + "'");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <style>
            body{
                font-size: 20px; 
                //background-image: url("bck1.jpg");
                background-color: #141414;
            }
            .topnav {
                background-color: #990000;
                color: white;
                overflow: hidden;
                font-family: inherit;
            }
            .topnav a {
                float: left;
                display: block;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }
            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }
            .topnav a.active {
                background-color:green;
                color: white;
            }
            .log{
                float:right;
                float:end;
            }
            .wel{
                float: right;
                text-align: center;
                margin-top: 13px;
                padding: auto;
                display:block;
            }
            img{
                margin-left: 500px;
                margin-bottom: 10px;
            }
            table{
                color: white;
                font-family: cursive;
                text-align: center;
                border-color: white;
            }
            h2{
                text-align: center;
                color: white;
                margin-top: 50px;
                text-height: 10px;
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
                margin-left: 670px;
            }

            input::placeholder{
                color:#990000;
            }
            p{
                text-align: center;
                color: white;
            }
            .pro{
                margin-top: 30px;
                border-style: solid;
                border-color: #990000;
            }
            .up{
               
                border-style: solid;
                border-color: #990000;
            }
        </style>
    </head>
    <body>
        <img src="logo3.JPG" alt="Logo" style="width:400px;height:150px;">
        <div class="topnav" id="myTopnav">
            <% try{
                nme = (String) session.getAttribute("user");
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
        <div class="pro">
            <h2> Profile </h2>
            <form>
                <table border="2" width=100%>
                    <tr> <th> Last Name </th> 

                        <th> First Name </th> 

                        <th> Email</th> </td> 

                        <th> Password </th> 

                        <th> Mobile </th>  

                        <th> Gender </th> 

                        <%
                                if (!rs.next()) {
                                    out.println("Sorry, could not find your profile at the moment. ");
                                } else {
                                    out.println("<tr><td>" + rs.getString("fname") + "</td><td>" + rs.getString("lname") + "</td><td>" + rs.getString("email") + "</td><td>" + rs.getString("password") + "</td><td>" + rs.getString("mobile") + "</td><td>" + rs.getString("gender") + "</td></tr>");
                                }
                            } catch (Exception e) {
                                System.out.println(e);
                            }
                        %>
                </table>
            </form>
        </div>
        <div class="up">
            <h2> Update your profile</h2>
            <p> If you want to make any changes to your profile. Please click on link below</p>
            <form action="update.jsp" method="post">
                <input type="submit" class="button" value="Update Profile">
            </form>
        </div>
    </body>
</html>


