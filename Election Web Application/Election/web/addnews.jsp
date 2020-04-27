<%-- 
    Document   : addnews
    Created on : Feb 27, 2020, 8:45:39 PM
    Author     : Harshit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String news = "";
    if (session.getAttribute("news") != null) {
        news = "Done";
        session.removeAttribute("news");
        session.setAttribute("addnews", "addnews");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add News</title>
       <link rel="stylesheet" type="text/css" href="css/admin.css">
    </head>
    <body>
        <table colspan="2">
            <tr>
                <th><a href="admin.jsp">Home</a></th>
            </tr>
            <tr>
            <form action="fileuploader?msg=news" method="post" enctype="multipart/form-data">  
                <th>Add Snippet Photo of news:</th><td><input type="file"  name="snippet" required><input type="submit" value="upload" required/><%=news%></td>
            </form>
        </tr>
            <form action="addremove" method="POST">  
                <tr>
                    <th>Enter the News:</th><td><textarea  row="10" col="70"  name="newses" required></textarea></td>
                </tr>
            
        </table>
                <p style="alignment-adjust: center" ></p><input type="submit" value="Add" width="10%" />
            </form>
                
    </body>
</html>
<%@ include file = "footer.html" %>