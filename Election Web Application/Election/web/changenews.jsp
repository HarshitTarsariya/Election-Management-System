<%-- 
    Document   : changenews
    Created on : Feb 27, 2020, 8:38:02 PM
    Author     : Harshit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ChangeNews</title>
        <link rel="stylesheet" type="text/css" href="css/admin.css">
    </head>
    <body>
        <table colspan="1" >
            <tr>
                <th><a href="admin.jsp" >Home</a></th>
            </tr>
            <tr>
                <td><a href="addnews.jsp"> Add News </a></td>
            </tr>
            <tr>
                <td><a href="removenews.jsp"> Remove News </a></td>
            </tr>
            
        </table>
    </body>
</html>
<%@ include file = "footer.html" %>