<%-- 
    Document   : addevents
    Created on : Feb 28, 2020, 8:21:21 PM
    Author     : Harshit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Events</title>
        <link rel="stylesheet" type="text/css" href="css/admin.css">
    </head>
    <body>
        <table>
            <form action="sessionaddforevents?events=insert" method="POST">
            <tr>
                <td><a href="admin.jsp">Home</a></td>
            </tr>
            <tr>
                <td>Enter Events Details with Date if required:</td><td><textarea name='eventdetails' rows="20" cols="50"></textarea></td>
            </tr>
        </table>
                <p style="alignment-adjust: center" ></p><input type="submit" name="submit" value="add" width="10%" />
            </form>
    </body>
</html>
<%@ include file = "footer.html" %>