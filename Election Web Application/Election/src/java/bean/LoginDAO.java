package bean;

import java.sql.*;

public class LoginDAO
{
    public static boolean validate(LoginBean bean)
    {
        boolean status = false;
        
        try
        {
            Connection con = DatabaseConnector.getConnected();
            
            PreparedStatement ps = con.prepareStatement("select count(userid) as present from users where userid=? and password=?");
            
            ps.setString(1,bean.getUserid());
            ps.setString(2,bean.getEncryptedPassword());
            
            ResultSet rs = ps.executeQuery();
            rs.next();
            
            if(rs.getInt(1) != 0)
                status=true;
            
        }
        catch(SQLException sqle)
        {
            System.out.println("Error with LoginDAO.java   "+sqle);
            //status = false;
        }
        return status;
    }
}