<%-- 
    Document   : complaint1
    Created on : Jun 24, 2017, 4:26:32 PM
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
    String a1=request.getParameter("a1");
    String b1=request.getParameter("b1");
    String c1=request.getParameter("c1");
    String d1=request.getParameter("d1");
    String e1=request.getParameter("e1");
    String email= (String) session.getAttribute("email");
    
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
       
        Statement stmt=con.createStatement();
        int i=stmt.executeUpdate("insert into feedback(a1,b1,c1,d1,e1,email) values('"+a1+"','"+b1+"','"+c1+"','"+d1+"','"+e1+"','"+email+"')");
        if(i>0)
        {
            %>
            <script lang="javascript">
                alert("Complaint/Feedback Submitted Successfully");
            window.location.href="dashboard.jsp";
            </script>
            <%
        }
        else
        {
            %>
            <script lang="javascript">
                alert("Not Submitted Successfully");
            window.location.href="complaint.jsp";
            </script>
            <%
        }
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
    %>