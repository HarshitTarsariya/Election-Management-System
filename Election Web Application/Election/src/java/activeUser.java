
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

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
public class activeUser implements HttpSessionListener {
    ServletContext ctx=null;  
    static int active=-1;
    @Override

    public void sessionCreated(HttpSessionEvent se) {
        active++;
        ctx=se.getSession().getServletContext();
        ctx.setAttribute("activeusers",active);
        //System.out.println("created");
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        active-=1;
        ctx=se.getSession().getServletContext();
        ctx.removeAttribute("activeusers");
        ctx.setAttribute("activeusers",active);
        //System.out.println("destroyed");
    }
}
