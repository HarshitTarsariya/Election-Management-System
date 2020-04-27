<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate ");
    if (request.getParameter("submit") != null) {
        String userid = request.getParameter("userid"), password = request.getParameter("password");
        String confirm = (String) session.getAttribute("userid");
        if (confirm != null) {
            out.print("<h1 align='center'>You Are Already Logged IN</h1>");
        } else if("".equals(userid) || "".equals(password)){
             response.sendRedirect("login.jsp?INVALID=INVALID");
        }
        else{
    
%>
<%@page import="bean.LoginDAO" %>
<jsp:useBean id="obj" class="bean.LoginBean"/>
<jsp:setProperty property="userid" name="obj"/>
<jsp:setProperty property="password" name="obj"/>    
<%
            boolean status = LoginDAO.validate(obj);
            if (status == true) {
                session = request.getSession();
                session.setAttribute("userid", userid);
                response.sendRedirect("home.jsp");
            } else {
                response.sendRedirect("login.jsp?INVALID=INVALID");
            }
        }
    }
%> 