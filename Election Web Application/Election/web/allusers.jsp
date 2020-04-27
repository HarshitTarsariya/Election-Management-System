<%-- 
    Document   : allusers
    Created on : Feb 27, 2020, 6:34:00 PM
    Author     : Harshit
--%>

<%@page language="java" pageEncoding="UTF-8"%> 
<%@ page import="java.util.*"%>
<%@ page import="bean.*"%>
<%
    ArrayList<RegisterBean> userlist=(ArrayList<RegisterBean>)session.getAttribute("userlist");
%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All user details</title>
        <link rel="stylesheet" type="text/css" href="css/admin.css">
    </head>
    <body>
        
        <table colspan="6" >
            <tr><td><a href="admin.jsp">Home</a></td></tr>
            <tr>
                <th>Userid</th><th>FirstName</th><th>LastName</th><th>Mobile no</th><th>Email</th><th>Gender</th>
            </tr>
            <%
                for(int i=0;i<userlist.size();i++)
                {%>
                    <tr>
                         <td><%=userlist.get(i).getSimpleUserid()%></td><td><%=userlist.get(i).getFname()%></td> <td><%=userlist.get(i).getLname()%></td> <td><%=userlist.get(i).getMobile()%></td> <td><%=userlist.get(i).getEmail()%></td> <td><%=userlist.get(i).getGender()%></td>
                    </tr>
                <%}
            %>
            <tr>
                <th>Total users:<%=userlist.size()%></th><th>Total Active users:<%=(int)application.getAttribute("activeusers")%></th>
            </tr>
            
        </table>
    </body>
</html>
<%@ include file = "footer.html" %>