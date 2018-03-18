<%-- 
    Document   : wallet2
    Created on : Jun 12, 2017, 1:02:50 PM
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
    String amount = request.getParameter("amount");
    int newamt = Integer.parseInt(amount);
    String mobile = request.getParameter("mobile");
    String txnid = request.getParameter("txnid");
    String email = (String) session.getAttribute("email");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "");

        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select amount,email,mobile,txnid from wallet where email='" + email + "'");
        while (rs.next()) {
            int oldamt = Integer.parseInt(rs.getString(1));
            int amt = oldamt + newamt;
            amount = Integer.toString(amt);
        }

        int i = stmt.executeUpdate("update wallet set amount='" + newamt + "',email='" + email + "', mobile='" + mobile + "', txnid='" + txnid + "' where email='" + email + "'");
        if (i > 0) {
%>
<script lang="javascript">
    alert("Amount Updated");
    <%
       session.setAttribute("amount", rs.getString(1));
       session.setAttribute("email", rs.getString(2));
       session.setAttribute("mobile", rs.getString(3));
       session.setAttribute("txnid", rs.getString(4));
    %>
    window.location.href = "success.jsp";
</script>
<%
        } else {
            out.println("Not updated");
        }
    } catch (Exception e) {
        out.print(e);
    }
%>