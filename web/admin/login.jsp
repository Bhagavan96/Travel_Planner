<%-- 
    Document   : login
    Created on : Jun 21, 2017, 3:36:54 PM
    Author     : bhagavan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Admin Login</title>
        <script type=text/javascript>
            function validateform()
            {
                var f1_name = document.getElementById('cnameid').value;
                var name_pattern = /^[A-Za-z]{2,30}$/i;
                if (name_pattern.test(f1_name)) {
                } else {
                    alert("Only Characters allowed");
                    document.getElementById('cnameid').focus();
                    return false;
                }

                var m_name = document.getElementById('mailid').value;
                var mail_pattern = /^\w+([\.-]?\ w+)*@\w+([\.-]?\ w+)*(\.\w{2,3})+$/i;
                if (mail_pattern.test(m_name)) {
                } else {
                    alert("enter validate mail id");
                    document.getElementById('mailid').focus();
                    return false;
                }

                var ph_name = document.getElementById('mobileid').value;
                var mobile_pattern = /^[7|8|9]{1}[0-9]{9}$/i;
                if (mobile_pattern.test(ph_name)) {
                } else {
                    alert("10 digits allowed");
                    document.getElementById('mobileid').focus();
                    return false;
                }
                //alert("Registered successfully");        
                return true;
            }
        </script>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header" style="margin-left: 570px;">
                    <a class="navbar-brand" href="home.jsp">Cab Router</a>
                </div>
            </div>
        </nav>

        <div class="container" style="margin-left: 200px;" >
            <h2>Admin Login</h2>
            <form action="login1.jsp" method="post">

                <div class="form-group">
                    <input type="text" style="width: 40%" class="form-control" id="userid" placeholder="Enter User Name" name="username" required>
                </div>

                <div class="form-group">
                    <input type="password" style="width: 40%" class="form-control" id="pwdid" placeholder="Enter password" name="password" required>
                </div>

                <input type="submit" class="btn btn-default" value="Login">
            </form>
        </div>
    </body>
      <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
    %>
</html>