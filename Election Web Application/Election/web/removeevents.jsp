<%-- 
    Document   : removeevents
    Created on : Feb 28, 2020, 8:52:02 PM
    Author     : Harshit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove events</title>
        <link rel="stylesheet" type="text/css" href="css/admin.css">
    </head>
    <body>
        <%@ page import="java.sql.*,bean.DatabaseConnector"%>
        <table colspan="3">
            <tr><th><a href='admin.jsp'>Home</a></th></tr>
        <%
            Connection con = DatabaseConnector.getConnected();
            Statement ss = con.createStatement();
            ResultSet rs = ss.executeQuery("select * from  events");
            while(rs.next())
            {%>
            <tr>
                <td><%=rs.getInt("id")%></td><td><%=rs.getString("events")%></td><td><a href='sessionaddforevents?eventdetails=<%=rs.getInt("id")%>'>Remove</a></td>
            </tr>
            <%}
        %>
        </table>
    </body>
</html>
<%@include file = "footer.html" %>