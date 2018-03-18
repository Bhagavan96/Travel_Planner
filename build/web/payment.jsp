<%-- 
    Document   : payment
    Created on : Jun 9, 2017, 4:47:21 PM
    Author     : bhagavan
--%>

<%@page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>

        <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
    %>
<%!
    public boolean empty(String s) {
        if (s == null || s.trim().equals("")) {
            return true;
        } else {
            return false;
        }
    }
%>
<%!
    public String hashCal(String type, String str) {
        byte[] hashseq = str.getBytes();
        StringBuffer hexString = new StringBuffer();
        try {
            MessageDigest algorithm = MessageDigest.getInstance(type);
            algorithm.reset();
            algorithm.update(hashseq);
            byte messageDigest[] = algorithm.digest();

            for (int i = 0; i < messageDigest.length; i++) {
                String hex = Integer.toHexString(0xFF & messageDigest[i]);
                if (hex.length() == 1) {
                    hexString.append("0");
                }
                hexString.append(hex);
            }

        } catch (NoSuchAlgorithmException nsae) {
        }

        return hexString.toString();

    }
%>
<%
    String merchant_key = "7H6cCy";
    String salt = "LBvXBhaX";
    String action1 = "";
    String base_url = "https://secure.payu.in";
    int error = 0;
    String udf2 = "";
    String hashString = "";

    Enumeration paramNames = request.getParameterNames();
    Map<String, String> params = new HashMap<String, String>();
    while (paramNames.hasMoreElements()) {
        String paramName = (String) paramNames.nextElement();

        String paramValue = request.getParameter(paramName);

        params.put(paramName, paramValue);
    }
    String txnid = "";
    if (empty(params.get("txnid"))) {
        Random rand = new Random();
        String rndm = Integer.toString(rand.nextInt()) + (System.currentTimeMillis() / 1000L);
        txnid = hashCal("SHA-256", rndm).substring(0, 20);
    } else {
        txnid = params.get("txnid");
    }
    udf2 = txnid;
    String txn = "abcd";
    String hash = "";
    String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
    if (empty(params.get("hash")) && params.size() > 0) {
        if (empty(params.get("key"))
                || empty(params.get("txnid"))
                || empty(params.get("amount"))) {
            error = 1;
        } else {
            String[] hashVarSeq = hashSequence.split("\\|");

            for (String part : hashVarSeq) {
                hashString = (empty(params.get(part))) ? hashString.concat("") : hashString.concat(params.get(part));
                hashString = hashString.concat("|");
            }
            hashString = hashString.concat(salt);

            hash = hashCal("SHA-512", hashString);
            action1 = base_url.concat("/_payment");
        }
    } else if (!empty(params.get("hash"))) {
        hash = params.get("hash");
        action1 = base_url.concat("/_payment");
    }

    //out.println("" + action1);

%>
<html>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/responsiveslides.css">

    <head>
        <style>
            .topnav {
                background-color: #990000;
                color: white;
                overflow: hidden;
                font-family: inherit;
            }
            .topnav a {
                float: left;
                display: block;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }
            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }
            .topnav a.active {
                background-color:green;
                color: white;
            }
            .log{
                float:right;
                float:end;
            }
            .wel{
                float: right;
                text-align: center;
                margin-top: 13px;
                padding: auto;
                display:block;
            }
            img{
                margin-top: 0px;
                margin-left: 500px;;
                //margin-bottom: 10px;
            }
            .b1{
                background-color: #990000;
                padding: 15px 32px;
                text-align: center;
                border: none;
                text-decoration: none;
                color: white;
                display: inline-block;
                border-radius: 4px;
                font-size: 16px;
            }

            input::placeholder{
                color:#990000;
            }
            input{
                font-family: cursive;
                font-size: 18px;
                width: 350px;
                padding: 12px 20px;
                margin: 8px 0;
                box-sizing: border-box;
                border-radius: 8px;
            }

            .left{
                margin-left: 100px;
                margin-top: 100px;
                float:left;
            }
            .right{
                float:right;
                margin-right: 350px;
            }
            h2{
                margin-top: 50px;
            }
            table{
                text-align: center;
            }
        </style>
    </head>
    <script>
        var hash = '<%= hash%>';
        function submitPayuForm() {

            if (hash == '')
                return;

            var payuForm = document.forms.payuForm;
            payuForm.submit();
        }
    </script>

    <body onload="submitPayuForm();">

        <div class="im">
            <img src="logo3.JPG" alt="Logo" style="width:400px;height:150px;">
        </div>
        <div class="topnav" id="myTopnav">
             <% try{
                String nme = (String) session.getAttribute("user");
            %>
             <%if(!(nme.equals("null"))){ %> <a href="dashboard.jsp"> Home</a> <% ;} 
                 else { %> <a href="index.jsp"> Home</a> <% ;} %>
            <a href="about.jsp"> About</a>
            <a href="contact.jsp"> Contact us</a> 
            <div class="wel"> <%if(!(nme.equals("null"))) out.print("Welcome " + nme);%> </div>
            <div class=log>
                <%if(!(nme.equals("null"))){ %> <a href="logout.jsp"> Logout</a> <% ;} 
                 else { %> <a href="index.jsp"> Login</a> <% ;} 
                 }
                 catch(Exception e)
                 {
                     %>
                     <a href="index.jsp"> Home</a>
                     <a href="about.jsp"> About</a>
                     <a href="contact.jsp"> Contact us</a> 
                     <div class=log>
                         <a href="index.jsp"> Login</a>
                     </div>
                     <%
                 }
                 %>  
            </div>
        </div>
        <div>
            <div class="left">
                <form action="<%= action1%>" method="post" name="payuForm">
                    <input type="hidden" name="key" value="<%= merchant_key%>" />
                    <input type="hidden" name="hash" value="<%= hash%>"/>
                    <input type="hidden" name="txnid" value="<%= txnid%>" />
                    <input type="hidden" name="udf2" value="<%= txnid%>" />
                    <input type="hidden" name="service_provider" value="payu_paisa" />
                    <%
                        String email = (String) session.getAttribute("email");

                        String mobile = (String) session.getAttribute("mobile");
                    %>
                    <table>
                        <tr>                
                            <td><input name="email" placeholder="Email address" value="<%= (String) session.getAttribute("email")%>" /></td>
                        </tr> 
                        <tr>                
                            <td><input name="mobile" placeholder="Mobile" value="<%= (String) session.getAttribute("mobile")%>" /></td>
                        </tr> 
                        <tr>                
                            <td><input type="number" name="amount" placeholder="Enter the Amount to be Added" value="<%= (empty(params.get("amount"))) ? "" : params.get("amount")%>" /></td>
                        </tr>    
                        <tr>
                        <input name="txnid" value="<%= (empty(params.get("txnid"))) ? "" : params.get("txnid")%>" />
                        </tr>
                        <tr>
                            <td colspan="2" hidden>Success URI: </td>
                            <td colspan="2" hidden><input name="surl" value="http://localhost:8080/Register/success.jsp" size="64" hidden/></td>
                        </tr>
                        <tr>
                            <td colspan="2" hidden>Failure URI: </td>
                            <td colspan="2" hidden><input name="furl" value="http://localhost:8080/Register/payment.jsp" size="64" hidden/></td>
                        </tr>

                        <tr>
                            <% if (empty(hash)) { %>
                            <td colspan="4"><input type="submit" class="b1" value="Pay Money" /></td>
                                <% }%>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>