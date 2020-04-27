<%-- 
    Document   : home
    Created on : Feb 2, 2020, 11:07:03 AM
    Author     : Harshit
--%>

<%@page language="java" pageEncoding="UTF-8"%>
<%--<%@page session="false"%>--%> 
<%@ include file = "header.jsp" %>
<%@page import="java.sql.*,bean.*,java.io.*" %>
<%@ page trimDirectiveWhitespaces="true" %>
 
<!DOCTYPE html>

<% 
    session = request.getSession(true);
    if(session==null || (String)session.getAttribute("userid")==null)
        response.sendRedirect("login.jsp");
%>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<%
    Connection con=DatabaseConnector.getConnected();
    Statement st = con.createStatement();
    st = con.createStatement();
%>
<html>
    <head>
        <meta name="viewport" content="width=device-width, user-scalable=no" />
        <link rel="stylesheet" type="text/css" href="css/home.css">
        <title>Welcome, <%= (String)session.getAttribute("userid")%></title>
    </head>
    <body>
        <div class="row" style="background-color: #CCCCFF">
            <div class="column side" >
                <div class="sidenav">
                  <!--// <a href="rating">About</a>-->
<!--                   <a href="opinionpoll">Clients</a>
                   <a href="#contact">Contact</a>-->
                   <%
                    ResultSet rs1=st.executeQuery("select aprovdis from idstatus where userid='"+(String)session.getAttribute("userid")+"'"); 
                    
                    if(rs1.next()!=false)
                    {
                       if("approve".equals(rs1.getString("aprovdis")))
                       {
                           session.setAttribute("id","true");
                            %>
                       <a href="FileDownloadServlet">Download ID-File</a>
                       <%}
                       else
                       {
                           session.setAttribute("id","false");
                       %>
                       <a href="voterid.jsp">Generate voter-id</a>
                       <%}
                    }
                    else
                    {
                        session.setAttribute("id","false");
                     %>
                    <a href="voterid.jsp">Generate voter-id</a>
                   <%}
                    %>
                    <a href='OpinionPollPage.jsp'>Opinion Polling</a>
               </div>
            </div>

            <div class="column middle">
              <%
                    ResultSet rs=st.executeQuery("select * from homedata");

                    while(rs.next())
                    {
                        int i=0;
                        Clob clob = rs.getClob("news");
                        String path="./images/News/";
                        path+=rs.getString("image");
                        
                        out.println("\n");
                        %>
                        <img src="<%= path %>" class="responsive" width="100%" height="500"/>
                        <%
                        out.println("\n");
                        out.println("<p class='txt1' style='color:black'>"+clob.getSubString(1 ,(int)clob.length())+"</p>");
                        out.println("\n");
                        %>
                        <i onclick="myFunction(this)" class="fa fa-thumbs-up"></i>
                        <script>
                            function myFunction(x) {
                              x.classList.toggle("fa-thumbs-down");
                            }
                        </script>
                        <hr style="color:black">
                        <%
                    }
             %>
            
            </div>
            
            <div class="column side" align="center">
               <% 
                    out.println("<p class='txt1' style='color:red'># EVENTS </p>");
                    rs=st.executeQuery("select * from events");
                    out.println("\n");
                    while(rs.next())
                    {
                        int i=0;
                        Clob clob = rs.getClob("events");
                        out.println("<p class='txt1' style='color:red'> *"+clob.getSubString(1 ,(int)clob.length())+"</p>");
                        out.println("\n");
                     %>
                        <hr style="color:black">
                    <%
                        out.println("\n");
                    }%>
               
        </div>
       
    </body>
</html>
 
