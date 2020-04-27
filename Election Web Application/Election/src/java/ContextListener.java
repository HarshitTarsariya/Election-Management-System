import bean.*;
import java.sql.Connection;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Web application lifecycle listener.
 *
 * @author Harshit
 */
public class ContextListener implements ServletContextListener {
    
    Connection con;
    @Override
    public void contextInitialized(ServletContextEvent sce) {
       con=DatabaseConnector.getConnected();
       sce.getServletContext().setAttribute("dbconnection",con);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
}
