package bean;

import java.math.BigInteger; 
import java.security.MessageDigest; 
import java.security.NoSuchAlgorithmException;

public class encryptor
{
    public static String getEncryption(String pass)
    {
         try {
            MessageDigest md = MessageDigest.getInstance("SHA-224"); //getinstanceof SHA-224

            byte[] messageDigest = md.digest(pass.getBytes()); 
   
            BigInteger no = new BigInteger(1, messageDigest); 
   
            String hashtext = no.toString(16); 
   
            while (hashtext.length() < 32) { 
                hashtext = "0" + hashtext; 
            } 
            return hashtext; 
        } 
        catch (NoSuchAlgorithmException e) { 
            System.out.println("Error in Encryption");
            throw new RuntimeException(e); 
        } 
    }
}