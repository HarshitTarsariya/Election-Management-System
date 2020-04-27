/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Harshit
 */
import bean.DatabaseConnector;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;
import java.util.Random;
        
public class Create_PDF {
    
    static Connection con;
    static PreparedStatement st;
    static String fname,lname,mobile,address,voterid="",bdate;
    public static void getData(String userid) throws SQLException
    { 
        String query="select * from users where userid=?";
       
        st=con.prepareStatement(query);
        st.setString(1,userid);
        
        ResultSet rs=st.executeQuery();rs.next();
        fname=rs.getString("firstname");
        lname=rs.getString("lastname");
        mobile=rs.getString("mobileno");
        address=rs.getString("address");
        bdate=rs.getString("birthdate");
    }
    
    public static void getvoterid(String userid)
    {
        Random rand = new Random(); 
        for(int i=userid.length()-1;i>userid.length()-8;i--)
            voterid+=userid.charAt(i);
        for(int i=1;i<=7;i++)
            voterid+=(rand.nextInt(9)%10+'0');
        System.out.println(voterid);
    }
    public static void setvoterid(String userid) throws SQLException
    {
        
        String query="UPDATE users set voterid=? where userid=?";
        st=con.prepareStatement(query);
        st.setString(1,voterid);
        st.setString(2,userid);
        int i=st.executeUpdate();
    }
    
    static void createPDF(String userid) throws SQLException
    {
        Path currentWorkingDir = Paths.get("").toAbsolutePath();
        System.out.println(currentWorkingDir.normalize().toString());
    	String FILE_NAME = "C:\\Users\\Harshit\\Documents\\NetBeansProjects\\Election\\web\\images\\voterid\\"+userid+".pdf"; //change path before \\Election and place path where project is placed
        Document document = new Document();
        
        con = DatabaseConnector.getConnected();
        getData(userid);
        getvoterid(userid);
        setvoterid(userid);
        
        try {
            PdfWriter.getInstance(document, new FileOutputStream(new File(FILE_NAME)));
            document.open();
            
            Paragraph p=new Paragraph();
            Paragraph p1 = new Paragraph();
            Paragraph p2 = new Paragraph();
            Paragraph p3 = new Paragraph();
            Paragraph p4 = new Paragraph();
            Paragraph p5 = new Paragraph();
            Paragraph p6 = new Paragraph();
            
            p1.add("National Election Commission of Students");
            p1.setAlignment(Element.ALIGN_CENTER);
            document.add(p1);
            
            Image image=Image.getInstance("C:\\Users\\Harshit\\Documents\\NetBeansProjects\\Election\\web\\images\\passportphoto\\"+userid+".jpeg");  //change path before \\Election and place path where project is placed
            image.scaleAbsolute(75,75);
            image.setAlignment(Element.ALIGN_CENTER);
            document.add(image);
       
            String temp="VoterId:"+voterid;
            p.add(temp);
            p.setAlignment(Element.ALIGN_CENTER);
            document.add(p);
            
            temp="First Name:"+fname;
            p2.add(temp); 
            p2.setAlignment(Paragraph.ALIGN_CENTER);
            document.add(p2);
            
            temp="Last Name:"+lname;
            p3.add(temp); 
            p3.setAlignment(Paragraph.ALIGN_CENTER);
            document.add(p3);
            
            temp="Mobile:"+mobile;
            p4.add(temp);
            p4.setAlignment(Paragraph.ALIGN_CENTER);
            document.add(p4);
            
            temp="Address:"+address;
            p5.add(temp);
            p5.setAlignment(Paragraph.ALIGN_CENTER);
            document.add(p5);
            
            Image image1=Image.getInstance("C:\\Users\\Harshit\\Documents\\NetBeansProjects\\Election\\web\\images\\passportphoto\\sign.jpeg");  //change path before \\Election and place path where project is placed
            image1.scaleAbsolute(75,75);
            image1.setAlignment(Element.ALIGN_CENTER);
            document.add(image1);
            
            temp="Election Commissionarate";
            p6.add(temp);
            p6.setAlignment(Paragraph.ALIGN_CENTER);
            document.add(p6);
            
            document.close();
            //System.out.println("Done");
        } catch (Exception e) {
            System.out.println("Error in create_pdf.java "+e);
        }
    }
}
