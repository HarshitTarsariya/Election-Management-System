package bean;

import java.sql.*;
import java.time.LocalDate;


public class RegisterDAO
{
    public static boolean registerUser(RegisterBean bean)
    {
        boolean status = false;
        try
        {
            Connection con = DatabaseConnector.getConnected();
            
            PreparedStatement ps = con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1,bean.getUserid());
            ps.setString(2,bean.getFname());
            ps.setString(3,bean.getLname());
            ps.setString(4,bean.getEmail());
            ps.setString(5,bean.getMobile());
            ps.setString(6,bean.getGender());
            ps.setString(7,bean. getEncryptedPassword());
            ps.setString(8,"null");
            ps.setObject(9,bean.getBirthdate());
            ps.setString(10,bean.getAddress());



            int i=ps.executeUpdate(); 

            status=true;
        }
        catch(Exception e)
        {
            System.out.println("Register DAO error    "+e);
        }
        return status;
    }
}