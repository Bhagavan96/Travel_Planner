<%-- 
    Document   : wallet
    Created on : Jun 11, 2017, 1:27:08 PM
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
    if(newamt<0)
    {
        %>
        <script lang="javascript">
        alert("Amount is not Valid!");
        (String) session.setAttribute("amount");
        window.location.href="wallet1.jsp";
        </script>
        <%
    }
    else
    {
    String mobile = request.getParameter("mobile");
    String email = (String) session.getAttribute("email");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "");

        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select amount from wallet where email='" + email + "'");
        while (rs.next()) {
            int oldamt = Integer.parseInt(rs.getString(1));

            int amt = oldamt - newamt;
            if (amt < 0) {
                
%>

<script lang="javascript">
    alert("Pay Reamining Balance of Rs.<%=(-amt)%> to complete the Transaction Process.");
    window.location.href = "payment.jsp";
</script>

<%
} else {
    amount = Integer.toString(amt);

    int i = stmt.executeUpdate("update wallet set amount='" + amount + "',email='" + email + "', mobile='" + mobile + "' where email='" + email + "'");

    if (i > 0) {
%>
<script lang="javascript">
    alert("Amount Updated");

    window.location.href = "success.jsp";
</script>
<%
                } else {
                    out.println("Not updated");
                }

            }
        }
    } catch (Exception e) {
        out.print(e);
    }
    }
%>