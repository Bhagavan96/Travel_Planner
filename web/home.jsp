<%-- 
    Document   : home
    Created on : Jun 12, 2017, 2:13:45 PM
    Author     : bhagavan
--%>
<%@page import="javax.imageio.ImageReader"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>

<%
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    String mobile=request.getParameter("mobile");
    Part  part= request.getPart("image");
    InputStream is=part.getInputStream();
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
        Statement stmt=con.createStatement();
        int i=stmt.executeUpdate("insert into reg(name,email,password,mobile,image)values('"+name+"','"+email+"','"+password+"','"+mobile+"','"+is+"')"
                + "");
        if(i>0)
        {
            out.print("Registered Successfully");
        }
        else
        {
            out.print("Not Registered");
        }
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
%>