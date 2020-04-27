<%-- 
    Document   : removenews
    Created on : Feb 28, 2020, 6:04:51 PM
    Author     : Harshit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove news</title>
        <link rel="stylesheet" type="text/css" href="css/admin.css">
    </head>
    <body>
        <%@ page import="java.sql.*,bean.DatabaseConnector"%>
        <table colspan="4">
            <tr><th><a href='admin.jsp'>Home</a></th></tr>
        <%
            Connection con = DatabaseConnector.getConnected();
            Statement ss = con.createStatement();
            ResultSet rs = ss.executeQuery("select * from  homedata");
            while(rs.next())
            {%>
            <tr>
                <td><%=rs.getInt("newsid")%></td><td><%=rs.getString("image")%></td><td><%=rs.getString("news")%></td><td><a href='newsremover?msg=<%=rs.getInt("newsid")%>'>Remove</a></td>
            </tr>
            <%}
        %>
        </table>
    </body>
</html>
<%@ include file = "footer.html" %>