<%-- 
    Document   : fetchdet
    Created on : Jun 9, 2017, 1:40:23 PM
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
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
        
        Statement stmt=con.createStatement();
        ResultSet rs= stmt.executeQuery("select * from reg");
        %>
        <table border="2" width="500px">
            <tr> <th> Name </th> <th> Email</th> <th> Password </th> <th> Mobile </th> </tr>
        <%
        while(rs.next())
        {
          out.println("<tr><td>"+rs.getString("name")+"</td<td>"+rs.getString("email")+"</td><td>"+rs.getString("password")+"</td><td>"+rs.getString("mobile")+"</td></tr>");          
        }
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
    %>
        </table>
        
        