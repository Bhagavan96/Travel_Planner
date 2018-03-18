<%-- 
    Document   : login
    Created on : Jun 14, 2017, 3:22:38 PM
    Author     : bhagavan
--%><%@page import="java.sql.*"%>
<%
    
  String email=request.getParameter("email");
  String password=request.getParameter("password");
  
  try{
      Class.forName("com.mysql.jdbc.Driver");
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
      
      Statement stmt=con.createStatement();
      ResultSet rs= stmt.executeQuery("select email,password,fname,mobile,lname from regis");
     
      int flag=0;
      while(rs.next())
      {
         
          if(email.equals(rs.getString(1)) && password.equals(rs.getString(2)))
          {
              session=request.getSession();
              session.setAttribute("email",email);
              %>
              <script lang="javascript">
//              alert("Login Successful");
              <%
                session.setAttribute("email",rs.getString(1));  
                session.setAttribute("mobile",rs.getString(4));  
                session.setAttribute("user",rs.getString(3)); 
                session.setAttribute("password",rs.getString(2));  
                session.setAttribute("lname",rs.getString(5)); 
                session.setAttribute("username",rs.getString(3)); 
              %>
              window.location.href="dashboard.jsp";
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
              window.location.href="index.jsp";
              </script>
          <%
      }
      
  }
  catch(Exception e)
  {
      System.out.println(e);
  }
  
%>