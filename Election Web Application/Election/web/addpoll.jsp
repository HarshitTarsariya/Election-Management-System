<%-- 
    Document   : addpoll
    Created on : Mar 2, 2020, 12:20:32 AM
    Author     : Harshit
--%>

<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
    if(request.getParameter("addpollsubmit")!=null)
    {
        String query1="insert into polls(question) values(?)",question=request.getParameter("question"),options=request.getParameter("options");
        String query2="select pollid from polls where question=?";
        String query3="insert into poll_options(value,pollid,votes) value(?,?,?)";
        
        StringTokenizer st=new StringTokenizer(options,",");
        int count=st.countTokens();
        
        Connection con=(Connection)this.getServletContext().getAttribute("dbconnection");
        
        PreparedStatement ps=con.prepareStatement(query1);
        ps.setString(1,question);
        ps.executeUpdate();
        
        ps=con.prepareStatement(query2);
        ps.setString(1,question);
        ResultSet rs=ps.executeQuery();
        rs.next();
        int pollid=rs.getInt("pollid");
        
        
        ps=con.prepareStatement(query3);
        
        for(int i=0;i<count;i++)
        {
            ps.setInt(2,pollid);
            ps.setString(1, st.nextToken());
            ps.setInt(3,0);
            ps.executeUpdate();
        }
        response.sendRedirect("changepolls.jsp");
    }
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Poll</title>
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
        <form action="#" method="POST">
        <table col="2">
            <tr>
                <th><a href="admin.jsp">Home</a></th>
            </tr>
            <tr>
                <td>Enter Question for Poll to add:</td><td><textarea  name="question" rows="20" cols="50" required></textarea></td>
            </tr>
            <tr>
                <td>Add Poll options as comma seperated:</td><td><textarea name="options" rows="20" cols="50" required></textarea></td>
            </tr>
           
        </table>
             <p style="alignment-adjust: center" ></p><input type="submit" name="addpollsubmit" value="add" width="10%" />
        </form>
    </body>
</html>
<%@ include file = "footer.html" %>