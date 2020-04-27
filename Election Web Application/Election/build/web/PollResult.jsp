<%-- 
    Document   : OpinionResult
    Created on : 1 Mar, 2020, 11:39:38 PM
    Author     : Mauneel Sorathia
--%>
<%@ include file = "header.jsp" %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Page</title>
        <style>
            progress {
                    display:inline-block;
                    width:190px;
                    height:20px;
                    padding:15px 0 0 0;
                    margin:0;
                    background:none;
                    border: 0;
                    border-radius: 15px;
                    text-align: left;
                    position:relative;
                    font-family: Arial, Helvetica, sans-serif;
                    font-size: 0.8em;
            }
            progress::-webkit-progress-bar {
                    height:11px;
                    width:150px;
                    margin:0 auto;
                    background-color: #CCC;
                    border-radius: 15px;
                    box-shadow:0px 0px 6px #777 inset;
            }
            progress::-webkit-progress-value {
                    display:inline-block;
                    float:left;
                    height:11px;
                    margin:0px -10px 0 0;
                    background: #008000;
                    border-radius: 15px;
                    box-shadow:0px 0px 6px #777 inset;
            }
            progress:after {
                    margin:-26px 0 0 -7px;
                    padding:0;
                    display:inline-block;
                    float:left;
                    content: attr(value) '%';
            }
            footer{
                position: fixed;
            }

        </style>
    </head>
    <body>
        <h1 align='center'>Results : </h1>
        <hr>
<%
    String userid = (String)session.getAttribute("userid");
    Connection con = (Connection)this.getServletContext().getAttribute("dbconnection");
    PreparedStatement pst;
    ResultSet rs;
    int pid = Integer.parseInt(request.getParameter("pollid"));
    
    ArrayList<String> options = new ArrayList<String>();
    ArrayList<Double> result = new ArrayList<Double>();
    ArrayList<Integer> votes = new ArrayList<Integer>();
    pst = con.prepareStatement("select * from poll_options where pollid=?");
    int sum=0;
    pst.setInt(1, pid);
    rs = pst.executeQuery();
    while(rs.next()){
        int v = rs.getInt("votes");
        sum += v;
        votes.add(v);
        options.add(rs.getString("value"));  
    }
    
    int i=0;
    for(String s : options){
        int v = votes.get(i);
        if(v!=0){
            result.add(((double)(votes.get(i))/sum)*100);
            
        }
        else{
            result.add((double)0);
            
        }
        i++;
    }
    for(int j=0;j<options.size();j++){
        System.out.println(result.get(j)+"----------------------");
%>
        <div align='center'>
            <progress id="progressBar" max="100" value="<%=result.get(j).intValue()%>"></progress>&nbsp;&nbsp;<%=options.get(j)%><br/><br/>
            
        </div>
<%
    }
%>
        <br/><p align='center'><a href="OpinionPollPage.jsp"  > <- Back<a/></p>
    </body>
</html>
<%@ include file = "footer.html" %>