<%-- 
    Document   : verifier
    Created on : Mar 1, 2020, 11:54:10 AM
    Author     : Harshit
--%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proofs</title>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th, td {    
                padding: 25px;
                text-align: left;
                border-bottom: 1px solid #ddd;
                font-size: 25px;
            }
            tr:hover {background-color:#f5f5f5;}
            input {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                box-sizing: border-box;
            }
        </style>
    </head>
    <body>
        <table  colspan="2">
            <tr><td><a href="admin.jsp">Home</a></td></tr>
            <tr>
                <%  String path="./images/birthcertificate/";
                    path+=request.getParameter("userid");
                    path+=".jpeg";
                %>
                <th>Birth Certificate:</th><td><img src="<%= path %>"  width="60%" height="100%"/></td>
            </tr>
            <tr>
                <%  String path2="./images/adharcard/";
                    path2+=request.getParameter("userid");
                    path2+=".jpeg";
                %>
                <th>Adhar Card:</th><td><img src="<%= path2 %>"  width="60%" height="100%"/></td>
            </tr>
            <tr><td><a href="verifierplus?userid=<%=request.getParameter("userid")%>&status=approve">Approve</a></td><td><a href="verifierplus?userid=<%=request.getParameter("userid")%>&status=disapprove">DisApprove</a></td></tr>
        </table>
    </body>
</html>
<%@ include file = "footer.html" %>