/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Harshit
 */
public class addremove extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            Connection con = DatabaseConnector.getConnected();
            HttpSession session=request.getSession(true);
            PreparedStatement st;
            String query;
            if((String)session.getAttribute("events")!=null && request.getParameter("events").equals("insert"))
            {
                query="insert into events values(NULL,?)";
                st=con.prepareStatement(query);
                st.setString(1,(String)session.getAttribute("events"));
                int i=st.executeUpdate();
                session.removeAttribute("events");
                response.sendRedirect("changeevents.jsp");
            }
            else if((String)session.getAttribute("events")!=null && request.getParameter("events").equals("remove"))
            {
                query="delete from events where id=?";
                st=con.prepareStatement(query);
                //System.out.println(query);
                st.setInt(1,Integer.parseInt((String)session.getAttribute("events")));
                int i=st.executeUpdate();
                session.removeAttribute("events");
                response.sendRedirect("changeevents.jsp");
            }
            else
            {
                String image=(String)session.getAttribute("filename")+".jpeg",newses=request.getParameter("newses");

                query="insert into homedata values(?,?,?)";

                st=con.prepareStatement(query);
                st.setInt(1,Integer.parseInt((String)session.getAttribute("filename")));
                st.setString(2,image);
                st.setString(3,newses);

                int i=st.executeUpdate();

                response.sendRedirect("changenews.jsp");
            }
        }
        catch(Exception e)
        {
            System.out.println("Error in adding "+e);
        }
    }   
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(addremove.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(addremove.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
