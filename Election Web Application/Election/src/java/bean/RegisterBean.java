package bean;

import java.text.*;  
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;  
import static jdk.nashorn.tools.ShellFunctions.input;

public class RegisterBean
{
   String userid="",fname,lname,email,password,gender,mobile,bdate,address;
   LocalDate birthdate;
   
    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getGender() {
        return gender;
    }

    public String getMobile() {
        return mobile;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    public String getUserid()
    {
        Date date = Calendar.getInstance().getTime();  
        DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");  
        String strDate = dateFormat.format(date);

        userid=fname+strDate.charAt(2)+strDate.charAt(3)+strDate.charAt(6)+strDate.charAt(9)+strDate.charAt(12)+strDate.charAt(15)+strDate.charAt(18);
        
        return userid;
    }
    public String getEncryptedPassword()
    {
        password=encryptor.getEncryption(password);
        return password;
    }
    public void setUserid(String userid)
    {
        this.userid=userid;
    }
    public String getSimpleUserid()
    {
        return userid;
    }

    public void setBirthdate(String birthdate) {
        
        this.bdate = birthdate;
    }

    public String getBirthdate() {
       return bdate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    
    
   
}