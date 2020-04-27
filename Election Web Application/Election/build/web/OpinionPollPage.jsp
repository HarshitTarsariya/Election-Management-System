<%-- 
    Document   : OpinionPollPage
    Created on : 1 Mar, 2020, 12:05:04 AM
    Author     : Mauneel Sorathia
--%>
<% 
    session = request.getSession(true);
    if(session==null || (String)session.getAttribute("userid")==null)
        response.sendRedirect("login.jsp");
%>
<%@ include file = "header.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@page import="bean.OpinionPollGenerator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("OpinionPollSubmit")!=null){
        OpinionPollGenerator.countResult(Integer.parseInt(request.getParameter("op")), (String)session.getAttribute("userid"), Integer.parseInt(request.getParameter("pollid")));
        RequestDispatcher rd = request.getRequestDispatcher("PollResult.jsp");
        rd.forward(request, response);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Opinion Poll Page</title>
        
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
            footer{
                position: fixed;
            }
        </style>
    </head>
    <body>
        <h2 align='center'>Vote Now!</h2>
        <hr>
        <jsp:useBean id="obj" class="bean.OpinionPollGenerator"/>
        <form action="#" method="POST">
            <%
                obj.setCon((Connection)this.getServletContext().getAttribute("dbconnection"));
                obj.setOptions(((String)session.getAttribute("userid")));
                HashMap<Integer,String> que = obj.getQue();
                ArrayList<Integer> pollid = obj.getPollid();
                HashMap<Integer, HashMap<Integer, String>> options = obj.getOptions();
                System.out.println(pollid.size());
                if(pollid.size()!=0){
                for(Integer i : pollid)
                {
                    String ques = que.get(i);
                    HashMap<Integer, String> op = options.get(i);
            %>
            <table align='center'>
                <tr>
                    <td><p><%=ques%></p></td>
                </tr>
                <tr>
                    <%
                        for (Integer name : op.keySet())  
                        { 
                            String opt = op.get(name);
                    %>
                            <input type="hidden" name="pollid" value="<%=i%>"/>
                            <td><input type="radio" name="op" value="<%=name%>" /><%=opt%></td>
                    <%
                        }
                    %>
                </tr>
            </table>
            <hr>
            <table align='center'>
            
                <tr><td>
                    <input type="submit" name="OpinionPollSubmit" value="Vote" class="button"/>&nbsp;
                    <input type="reset" name="reset" value="Clear" class ="button" >
                    </td></tr>
            </table>
            <%
                }
                }
                else{
            %>
                <h3 align='center'>You have voted in all Polls, come again soon for more :)</h3>
            <%
                }
            %>
        </form>
    </body>
</html>
<%@ include file = "footer.html" %>