<%-- 
    Document   : removepoll
    Created on : Mar 2, 2020, 1:30:14 AM
    Author     : Harshit
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Connection con=(Connection)this.getServletContext().getAttribute("dbconnection");
%>

<%
    if(request.getParameter("pollid")!=null)
    {
        PreparedStatement st1=con.prepareStatement("delete from polls where pollid=?");
        st1.setInt(1,Integer.parseInt(request.getParameter("pollid")));
        st1.executeUpdate();
        response.sendRedirect("changepolls.jsp");
    }
%>
 
<%
    PreparedStatement st=con.prepareStatement("select * from polls");
    ResultSet rs=st.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove Poll</title>
        <link rel="stylesheet" type="text/css" href="css/admin.css">
    </head>
    <body>
        <table cols="3">
            <tr><td><a href='admin.jsp'>Home</a></td></tr>
            <%
            
            if(rs.next()==false)
            {%>
            <tr><td>All Polls are Deleted</td></tr>   
            <%}
            else
            {
            rs.previous();
            while(rs.next())
            {%>
            <tr>
                <td><%=rs.getInt("pollid")%></td><td><%=rs.getString("question")%></td><td><a href='removepoll.jsp?pollid=<%= rs.getInt("pollid")%>' >Remove</a></td>
            </tr>
            <%}
            }%>    
        </table>
    </body>
</html>
<%@ include file = "footer.html" %>