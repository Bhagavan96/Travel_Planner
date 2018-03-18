<%-- 
    Document   : uploadfile
    Created on : May 18, 2017, 11:57:41 AM
    Author     : bhagavan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload File</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="resumeupload.jsp" method="post" enctype="multipart/form-data" >
            <table>
                <tr> <td> Name </td> <td> <input type="text" name="name"> </td> </tr>
                <tr> <td> Mobile </td> <td> <input type="text" name="mobile"> </td> </tr>
                <tr> <td> Upload File </td> <td> <input type="file" name="image"> </td> </tr>
                <tr> <td> </td> <td> <input type="submit" value="submit"> </td> </tr>
            </table>
        </form>
    </body>
</html>
