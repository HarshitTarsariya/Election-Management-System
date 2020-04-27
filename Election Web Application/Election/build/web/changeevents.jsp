<%-- 
    Document   : changeevents
    Created on : Feb 28, 2020, 8:15:16 PM
    Author     : Harshit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Events</title>
        <link rel="stylesheet" type="text/css" href="css/admin.css">
    </head>
    <body>
        <table>
            <tr>
                <th><a href='admin.jsp' >Home</a></th>
            </tr>
            <tr>
                <td><a href='addevents.jsp'>Add Events</a></td>
            </tr>
            <tr>
                <td><a href='removeevents.jsp'>Remove Events</a></td>
            </tr>
        </table>
    </body>
</html>
<%@ include file = "footer.html" %>