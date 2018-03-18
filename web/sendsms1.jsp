<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URLConnection"%>
        <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
    %>
<%// Replace with your username
    String n=request.getParameter("number");
    String m=request.getParameter("MSG");
String user = "";

// Replace with your API KEY (We have sent API KEY on activation email, also available on panel)
String apikey = "";

// Replace with the destination mobile Number to which you want to send sms
String mobile = n;

// Replace if you have your own Sender ID, else donot change
String senderid = "MYTEXT";

// Replace with your Message content
String message = m;

// For Plain Text, use "txt" ; for Unicode symbols or regional Languages like hindi/tamil/kannada use "uni"
String type="txt";

//Prepare Url
URLConnection myURLConnection=null;
URL myURL=null;
BufferedReader reader=null;

//encoding message 
String encoded_message=URLEncoder.encode(message);

//Send SMS API
String mainUrl="http://smshorizon.co.in/api/sendsms.php?";

//Prepare parameter string 
StringBuilder sbPostData= new StringBuilder(mainUrl);
sbPostData.append("user="+user); 
sbPostData.append("&apikey="+apikey);
sbPostData.append("&message="+encoded_message);
sbPostData.append("&mobile="+mobile);
sbPostData.append("&senderid="+senderid);
sbPostData.append("&type="+type);


//final string
mainUrl = sbPostData.toString();
%>
<%

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