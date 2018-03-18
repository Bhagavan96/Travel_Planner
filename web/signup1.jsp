<%-- 
    Document   : signup1
    Created on : May 19, 2017, 9:35:11 AM
    Author     : bhagavan
--%>
<%@page import="java.sql.*"%>

<%
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    String mobile=request.getParameter("mobile");
    String gender=request.getParameter("gender");
    
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
       
        Statement stmt1=con.createStatement();
        ResultSet j=stmt1.executeQuery("select * from regis where email='"+email+"'");
        if(!j.next())
        {
            Statement stmt=con.createStatement();

            int i=stmt.executeUpdate("insert into regis(fname,lname,email,password,mobile,gender) values('"+fname+"','"+lname+"','"+email+"','"+password+"','"+mobile+"','"+gender+"')");
            if(i>0)
            {
                %>
                <script lang="javascript">
                    alert("You account has been registered successfully");
                window.location.href="index.jsp";
                </script>
                <%
            }
            else
            {%>
                <script lang="javascript">
                    alert("Not Registered");
                window.location.href="index.jsp";
                </script>
                <%
            }
        }
        else
        {
            %>
           <script lang="javascript">
                    alert("User already exists..Try Another username");
                 window.location.href="signup.jsp";
                </script>
            <%
        }
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
    %>
