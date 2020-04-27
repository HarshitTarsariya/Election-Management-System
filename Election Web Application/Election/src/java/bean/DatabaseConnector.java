package bean;
import java.sql.*;


public class DatabaseConnector
{
    private static Connection con = null;
    
    static String driver="com.mysql.jdbc.Driver";  
    
    static String connection_url="jdbc:mysql://localhost:3306/electionmanagementsystem";  
    static String dusername="electionmanagementsystem";  
    static String dpassword="root";
    
    static
    {
        try
        {
            Class.forName(driver);
            con = DriverManager.getConnection(connection_url,dusername,dpassword);
        }
        catch(Exception e)
        {
           System.out.println("Error with DatabaseConnector.java   "+e);
        }
    }
    
    public static Connection getConnected()
    {
            return con;
    }
}