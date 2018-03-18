<%-- 
    Document   : resumeupload
    Created on : Jun 11, 2017, 4:07:15 PM
    Author     : bhagavan
--%><%@page import="java.sql.*"%>
<%@page import="java.io.InputStream"%>
        <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
    %>
<%
    try{
        
       String name = request.getParameter("name");
       String mobile = request.getParameter("mobile");
       InputStream file = null;
       
       Part image = request.getPart("image");
        if (image != null) {
            // prints out some information for debugging
            System.out.println(image.getName());
            System.out.println(image.getSize());
            System.out.println(image.getContentType());
             
            // obtains input stream of the upload file
            file = image.getInputStream();
        }
        
       Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
        
       String sql = "insert into demo (name,mobile,image) values (?, ?, ?)";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, mobile);
           
            
             
            if (file != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(3, file);
            }
            
            int row = statement.executeUpdate();
            if (row > 0) {
               
                response.sendRedirect("index1.jsp");
            }
       
    } catch (Exception e) {e.printStackTrace();}
%>