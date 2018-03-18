<%-- 
    Document   : login1
    Created on : Jun 5, 2017, 9:04:52 PM
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
  String username=request.getParameter("username");
  String password=request.getParameter("password");
  
  try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
      
      Statement stmt=con.createStatement();
      ResultSet rs= stmt.executeQuery("select username,password from admlogin");
     
      int flag=0;
      while(rs.next())
      {
         
          if(username.equals(rs.getString(1)) && password.equals(rs.getString(2)))
          {
              %>
              <script lang="javascript">
              alert("Login Successful");
              <%
                session.setAttribute("user",rs.getString(1));  
              %>
              window.location.href="admdashboard.jsp";
              </script>
              <%
              //out.println("Login Successful");
              flag=1;
          }
          
      }
      if(flag!=1)
      {
          %>
              <script lang="javascript">
              alert("Invalid username or password");
              window.location.href="login.jsp";
              </script>
          <%
      }
      
  }
  catch(Exception e)
  {
      System.out.println(e);
  }
  
%>
