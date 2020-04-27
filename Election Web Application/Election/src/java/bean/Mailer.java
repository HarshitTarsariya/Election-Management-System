package bean;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Harshit
 */
public class Mailer {
    static boolean status1=false;
    public static void send(String to,String userid){

        final String user="";//change accordingly
        final String pass="";//change accordingly
        String subject="Registration on EMS by Students";
        String msg="Welcome to EMS , Your UserId is "+userid;

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getDefaultInstance(props,
         new javax.mail.Authenticator() {
          protected PasswordAuthentication getPasswordAuthentication() {
           return new PasswordAuthentication(user,pass);
           }
        });

        try {
         MimeMessage message = new MimeMessage(session);
         message.setFrom(new InternetAddress(user));
            System.out.println(new InternetAddress(user));
         message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
         message.setSubject(subject);
         message.setText(msg);
         
         Transport.send(message);
         status1=true;
         
        // System.out.println("Done");

         } catch (MessagingException e) {
                //throw new RuntimeException(e);
             status1=false;
         }
        //return status1;
    }
}
