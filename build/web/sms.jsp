<%-- 
    Document   : sms
    Created on : Jun 2, 2017, 2:04:20 PM
    Author     : bhagavan
--%>

<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
        <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
    %>
<%
    URLConnection myURLConnection=null;
URL myURL=null;
BufferedReader reader=null;

    String mainUrl="http://smshorizon.co.in/api/sendsms.php?user=smsHorizon_UserName&apikey=API_Key&mobile=9xxxxxxxx0&message=xxyy&senderid=MYTEXT&type=txt";
    
    StringBuilder sbPostData= new StringBuilder(mainUrl);
    mainUrl = sbPostData.toString();

    try
{
    //prepare connection
    myURL = new URL(mainUrl);
    myURLConnection = myURL.openConnection();
    myURLConnection.connect();
    reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
    //reading response 
    String response1;
    while ((response1 = reader.readLine()) != null) 
    //print response 
    System.out.println(response1);
    
    //finally close connection
    reader.close();
} 
catch (IOException e) 
{ 
	e.printStackTrace();
} 
%>