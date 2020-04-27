/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
/**
 *
 * @author Harshit
 */
public class fileuploader extends HttpServlet {
    boolean flag=false;
    int name=0;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
       
        String temp = request.getParameter("msg");
        
        String filename = (String) session.getAttribute("userid");
        
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
                if(request.getParameter("msg").equals("news"))
                {
                    flag=true;
                    temp="News";
                    name++;
                    filename=Integer.toString(name);
                    session.setAttribute("filename",filename);
                }

                try {
                    List items = upload.parseRequest(new ServletRequestContext(request));
                    
                    Iterator iterator = items.iterator();
                    while (iterator.hasNext()) {
                        FileItem item = (FileItem) iterator.next();
                        File pa = new File("C:\\Users\\Harshit\\Documents\\NetBeansProjects\\Election\\web\\images\\"+temp); //change path before \\Election and place path where project is placed
                        
                        File uploadedFile = new File(pa + "/" + filename+".jpeg");
                        item.write(uploadedFile);
                    }
                }
                catch (IOException io) {
                   System.out.println("Error in fileupload " + io);
                }
                
            session.setAttribute(request.getParameter("msg"), "done");
            if(flag==true)
            {
                response.sendRedirect("addnews.jsp");
                flag=false;
            }
            else
                response.sendRedirect("voterid.jsp");
    }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(fileuploader.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(fileuploader.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
     public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
