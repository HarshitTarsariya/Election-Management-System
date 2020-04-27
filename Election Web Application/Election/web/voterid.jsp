<%-- 
    Document   : voterid
    Created on : Feb 25, 2020, 9:42:51 PM
    Author     : Harshit
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%
    session = request.getSession(true);
    if (session == null || (String) session.getAttribute("userid") == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%@page language="java" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*,bean.DatabaseConnector,java.sql.Date"%>
<%@ include file = "header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voter-id</title>
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

        <%
            Connection con = DatabaseConnector.getConnected();
            Statement ss = con.createStatement();
            ResultSet rs = ss.executeQuery("select * from users where userid='" + session.getAttribute("userid") + "'");
            rs.next();
            String certi = "", passport="",fname = rs.getString("firstname"), lname = rs.getString("lastname"), email = rs.getString("email"), mobileno = rs.getString("mobileno"), gender = rs.getString("gender"), adhar = "",address=rs.getString("address");
            
//            java.sql.Date dob=rs.getDate("birthdate");
             
            
            if (session.getAttribute("adharcard") != null) {
                adhar = "Done";
            }
            if (session.getAttribute("birthcertificate") != null) {
                certi = "Done";
            }
            if (session.getAttribute("passportphoto") != null) {
                passport = "Done";
                session.removeAttribute("birthcertificate");
                session.removeAttribute("adharcard");
                session.removeAttribute("passportphoto");
            }
        %>
    </head>
    <body>
        <h3 class="txt1" align="center" style="font-size:30px">Details as per the Registration..</h3>
        <table colspan="2" class="txt1" align="center">
            <tr>
                <td><th>FirstName:</th></td><td><%=fname%></td>
            </tr>
            <tr>
                <td><th>LastName:</th></td><td><%=lname%></td>
            </tr>
            <tr>
                <td><th>Email-id:</th></td><td><%=email%></td>
            </tr>
            <tr>
                <td><th>Gender:</th></td><td><%=gender%></td>
            </tr>
            <tr>
                <td><th>Mobile:</th></td><td><%= mobileno%></td>
            </tr>
            <tr>
                <!--<td><th>Date of Birth:</th></td><td></td>-->
            </tr>
            <tr>
                <td><th>Address:</th></td><td><%= address%></td>
            </tr>
            
             <tr>
            <form action="fileuploader?msg=adharcard" method="post" enctype="multipart/form-data">  
                <td><th>Add Valid AdharCard Photo:</th></td><td><input type="file"  name="adharcard" required><input type="submit" value="upload"/><%=adhar%></td>
            </form>
            </tr>
            <tr>
            <form action="fileuploader?msg=birthcertificate" method="post" enctype="multipart/form-data">  
             <td><th>Add Valid Birthcertificate Photo:</th></td><td><input type="file"  name="birthcertificate" required><input type="submit" value="upload"/><%=certi%></td>
            </form>
            </tr>
            <form action="fileuploader?msg=passportphoto" method="post" enctype="multipart/form-data">  
            <td><th>Add Valid Passport sized Photo:</th></td><td><input type="file"  name="passportphoto" required><input type="submit" value="upload"/><%=passport%></td>
            </form>
            </tr>
        </table>
           
            <p style="alignment-adjust: center" ><input type="button" onclick="location.href='generator';" value="Generate" width="10%" /></p>
            
            <h3 style="text-align: center;color: red">If any Query Mail us before Submitting</h3>
    </body>
</html>
<%@ include file = "footer.html" %>