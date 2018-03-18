<%-- 
    Document   : logout
    Created on : Jun 20, 2017, 6:10:50 PM
    Author     : bhagavan
--%>

        <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
    %>

</script>
<%
     if (session.getAttribute("username") == null) {

        response.sendRedirect("welcome.html"); // No logged-in user found, so redirect to login page.
    } else {
         session.invalidate();
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0);
//        chain.doFilter(req, regis); 
        response.sendRedirect("index.jsp");
    }
    %>