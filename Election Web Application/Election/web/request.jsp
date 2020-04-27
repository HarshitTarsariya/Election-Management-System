<%-- 
    Document   : request
    Created on : Feb 29, 2020, 9:11:02 PM
    Author     : Harshit
--%>

<%@page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,bean.DatabaseConnector"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Card Request</title>
        <link rel="stylesheet" type="text/css" href="css/admin.css">
    </head>
    <body>
        
        <table colspan="3">
            <tr><th><a href='admin.jsp'>Home</a></th></tr>
        <%
            Connection con = DatabaseConnector.getConnected();
            Statement ss = con.createStatement();
            ResultSet rs = ss.executeQuery("select * from  idstatus");
            
            
            while(rs.next())
            {%>
            
                <%
                    if(!rs.getString("aprovdis").equals("null"))
                        continue;
                %>
            <tr>
                <td><%=rs.getString("userid")%></td><td><a href='verifier.jsp?userid=<%=rs.getString("userid")%>'>Proofs</a></td>
            </tr>
            <%}
        %>
        </table>
    </body>
</html>
<%@include file = "footer.html" %>
