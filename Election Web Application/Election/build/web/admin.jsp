<%-- 
    Document   : admin
    Created on : Feb 27, 2020, 2:15:39 PM
    Author     : Harshit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome,Admin</title>
       <link rel="stylesheet" type="text/css" href="css/admin.css">
    </head>
    <body>
        <table>
            <tr>
                <td><a href="alluserlistcreate">All Users Details</a></td>
            </tr>
            <tr>
                <td><a href="request.jsp">Voter id card Request</a></td>
            </tr>
            <tr>
                <td><a href="changenews.jsp">Change News</a></td>
            </tr>
            <tr>
                <td><a href="changeevents.jsp">Change Events</a></td>
            </tr>
            <tr>
                <td><a href="changepolls.jsp">Change Poll</a></td>
            </tr>
        </table>
        
    </body>
</html>
<%@ include file = "footer.html" %>