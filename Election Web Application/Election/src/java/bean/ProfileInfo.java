
package bean;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mauneel Sorathia
 */
public class ProfileInfo {
    private static String userid, fname,mobileno,lname,gender,email;
    private static Connection con;
    public ProfileInfo() {
    }

    public ProfileInfo(Connection con,String userid, String fname, String lname,String mobile,String gender, String email) {
        this.userid = userid;
        this.con = con;
        this.fname = fname;
        this.mobileno = mobile;
        this.lname = lname;
        this.gender = gender;
        this.email = email;
    }
    public void setInfo(){
        try {
            PreparedStatement pst = con.prepareStatement("select firstname, lastname, gender, email, mobileno from users where userid=?");
            pst.setString(1,userid);
            ResultSet rs = pst.executeQuery();
            rs.next();
            System.out.println(userid);
            ProfileInfo.fname = rs.getString("firstname");
            System.out.println("After the rs is initialized");
            ProfileInfo.lname = rs.getString("lastname");
            ProfileInfo.gender = rs.getString("gender");
            ProfileInfo.email = rs.getString("email");
            ProfileInfo.mobileno = rs.getString("mobileno");
        } catch (SQLException ex) {
            System.out.println("--------------"+ex+"-------------");
            Logger.getLogger(ProfileInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static boolean updateInfo()
    {
        boolean status=false;
        try {
            PreparedStatement pst = con.prepareStatement("update users set firstname=?,lastname=?,gender=?,email=?,mobileno=? where userid=?");
            pst.setString(1, fname);
            pst.setString(2,lname);
            pst.setString(3,gender);
            pst.setString(4,email);
            pst.setString(5,mobileno);
            pst.setString(6,userid);
            int executeUpdate = pst.executeUpdate();
            status = true;
        } catch (SQLException ex) {
            Logger.getLogger(ProfileInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }
    public static void setCon(Connection con) {
        ProfileInfo.con = con;
    }

    public static Connection getCon() {
        return con;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public void setMobileno(String mobile) {
        this.mobileno = mobile;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFname() {
        return fname;
    }

    public String getMobileno() {
        return mobileno;
    }

    public String getLname() {
        return lname;
    }

    public String getGender() {
        return gender;
    }

    public String getEmail() {
        return email;
    }
    public void setUserid(String userid){
        this.userid = userid;
    }
    public static String getUserid() {
        return userid;
    }
    
}
