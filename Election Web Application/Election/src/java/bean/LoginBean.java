package bean;

public class LoginBean
{
    String userid,password;

    public String getUserid() {
        return userid;
    }

    public String getPassword() {
        return password;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getEncryptedPassword()
    {
        password=encryptor.getEncryption(password);
        return password;
    }
 }