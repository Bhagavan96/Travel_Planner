<%-- 
    Document   : dashboard
    Created on : May 18, 2017, 4:51:44 PM
    Author     : bhagavan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DashBoard</title>
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
                margin-top: 0px;
                margin-left: 500px;;
                //margin-bottom: 10px;
            }
           
            .button,.b1,.b2{
                background-color: #990000;
                padding: 15px 32px;
                text-align: center;
                border: none;
                font-size: 20px;
                text-decoration: none;
                color: white;
                display: inline-block;
                border-radius: 4px;
                margin-left: 120px;
            }

            .book,.profile,.orders{
                border-style: groove;
                height: 200px;
                border-radius: 5px;
                padding: 20px;
                font-family: cursive;
            }
            table{
                color: white;    
                margin-top: 100px;
                
            }


        </style>
    </head>
    <body>
            <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
    %>
        <div class="im">
            <img src="logo3.JPG" alt="Logo" style="width:400px;height:150px;">
        </div>
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
                         <a href="wallet1.jsp"> wallet</a>
                         <a href="index.jsp"> Login</a>
                     </div>
                     <%
                 }
                 %>  
            </div>
        </div>
        <table class="col" width=100% height=100%><tr>
                <td width=33%>
                    <div class="book">
                        <p> We provides economical and efficient taxi service in Hyderabad.
                            Point to Point Travel within Hyderabad, Fixed - route, Airport Transfer.</p>
                        <form action="distance1.jsp">
                            <input type="submit" class="button" value="Book a Cab">
                        </form>
                    </div>
                </td>
                <td width=33%>
                    <div class="profile">
                        <p> To view your profile information. You can make changes to the profile. <br>
                        </p><br> <br>
                        <form action="profile.jsp">
                            <input type="submit" class="b1" value="View your Profile">
                        </form>
                    </div>
                </td>
                <td width=33%>
                    <div class="orders">
                        <p> To view your booked history and payments done through this account. <br>
                        </p><br> <br>
                        <form action="orders.jsp">
                            <input type="submit" class="b2" value="Your Orders">
                        </form>
                    </div>
                </td>
            </tr></table>

    </body>
</html>
