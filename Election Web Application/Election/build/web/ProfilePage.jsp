<%-- 
    Document   : ProfilePage
    Created on : 29 Feb, 2020, 12:48:32 PM
    Author     : Mauneel Sorathia
--%>
<% 
    session = request.getSession(true);
    if(session==null || (String)session.getAttribute("userid")==null)
        response.sendRedirect("login.jsp");
%>


<%@ include file = "header.jsp" %>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String userid = (String)session.getAttribute("userid");
%>
<jsp:useBean id="obj" class="bean.ProfileInfo"/>
<jsp:setProperty  name="obj" property="userid"  value='<%=userid%>'/>
<%
    obj.setCon((Connection)this.getServletContext().getAttribute("dbconnection"));
    obj.setInfo();
%>
<!DOCTYPE html>
<%--
    String dp_directory = this.getServletContext().getInitParameter("dp_directory");
--%>
<%
    String disableFlag = "";
    String editFlag1 = "submit";
    String editFlag2 = "reset";
    if("Save".equals(request.getParameter("submit")))
    {
        if(request.getParameter("editFlag") == null){
            disableFlag="disabled";
            editFlag1="hidden";
            editFlag2="hidden";
        }
%>
            <jsp:setProperty  name="obj" property="fname"  param='fname'/>
            <jsp:setProperty  name="obj" property="lname"  param='lname'/>
            <jsp:setProperty  name="obj" property="email"  param='email'/>
            <jsp:setProperty  name="obj" property="mobileno"  param='mobileno'/>
            <jsp:setProperty  name="obj" property="gender"  param='gender'/>
<%
            boolean status = obj.updateInfo();
            System.out.println(obj.getFname());
            if(status)
                System.out.println("UPDATE PASS-----------");
    }
    else{
        System.out.println("inide else");
        if(request.getParameter("editFlag") == null){
            disableFlag="disabled";
            editFlag1="hidden";
            editFlag2="hidden";
        }
    }
%>
<script>
    <%%>
</script>
    
<html>
    <head>
        <title>Profile Page</title>
        <style>
            .button{
                    background-color: #4CAF50;
                    border: none;
                    color: white;
                    padding: 12px 30px;
                    text-align: center;
                    text-decoration: none;
                    display: inline-block;
                    font-size: 16px;
                    margin: 4px 2px;
                    cursor: pointer;
            }
            
            .img1 {
                    border-radius: 50%;
            }
            * {
              box-sizing: border-box;
            }

            .column1 {
              float: left;
              width: 33.33%;
              padding: 5px;
            }
            .column2 {
              float: left;
              width: 66.66%;
              padding: 5px;
            }

            /* Clearfix (clear floats) */
            .row::after {
              content: "";
              clear: both;
              display: table;
            }
            footer{
                position: fixed;
            }
        </style>
        
        <script>
        </script>
    </head>
    <body onload="foo()">

            <h2>UserID : <%=userid%><br/>
                <%--VoterID : <%--<%=(String)session.getAttribute(voterid)%>--%>
            </h2>
            <div class="row">
                <div class="column1">
                    <% if("male".equals(obj.getGender())){%>
                    <img class="img1" src="./profile_images/male.jpg" alt="Profile Picture" width="200" height="200"/><br/> <%}else{%>
                    <img class="img1" src="./profile_images/female.jpg" alt="Profile Picture" width="200" height="200"/>
                    <%}%>
                    Upload or Change Image : 
                    <input type="file" name="dp"/>
                </div>
                
                <form action="#" method="POST">
                    <button name="editFlag" value="true">Edit Profile</button><br/>
                    <div class="column2">
                        <table cellspacing="20" width="100%">
                            <tr>
                                <td>First Name : <br/>
                                    <input type="text" name="fname" placeholder=<%=obj.getFname()%> <%=disableFlag%>/></td>

                                <td>Last Name : <br/>
                                <input type="text" name="lname" placeholder=<%=obj.getLname()%> <%=disableFlag%>/><td>
                            </tr>
                            <tr>
                                <td>Email : <br/>
                                    <input type="email" name="email" placeholder=<%=obj.getEmail()%> <%=disableFlag%>/></td>

                                <td>Mobile No. : <br/>
                                <input type="number" name="mobileno" placeholder=<%=obj.getMobileno()%> minlength="10" maxlength="10" <%=disableFlag%>/><td>
                            </tr>
                            <tr>
                                <td>Gender : <br/>
                                    <%
                                        String gender = obj.getGender();
                                        String maleselected = "";
                                        String femaleselected = "";
                                        if("male".equals(gender))
                                            maleselected = "checked";
                                        else
                                            femaleselected = "checked";
                                    %>
                                    <input type="radio" name="gender" value="male" <%=maleselected%> <%=disableFlag%>/>Male&nbsp;
                                    <input type="radio" name="gender" value="female" <%=femaleselected%> <%=disableFlag%>/>Female</td>
                            </tr>
                            <tr>
                                <td><input type=<%=editFlag1%> class="button" name="submit" value="Save" ></td>
                                <td><input type=<%=editFlag2%> class="button" value="Reset"></td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>

    </body>
</html>
<%@ include file = "footer.html" %>