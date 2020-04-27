<%-- 
    Document   : download
    Created on : Feb 29, 2020, 9:07:02 PM
    Author     : Harshit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>

<% 
    session = request.getSession(true);
    if(session==null || (String)session.getAttribute("userid")==null)
        response.sendRedirect("login.jsp");
    if("true".equals((String)session.getAttribute("id")))
        response.sendRedirect("home.jsp");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Download</title>
        <style>
            footer{
                position:fixed;
            }
        </style>
    </head>
    <body>
        <h1 align="center" >
            Your Request for card is applied.</br>
            After Verified by our admin we will put download link on your Home Page..
        </h1>
        
    </body>
</html>
<%@ include file = "footer.html" %>