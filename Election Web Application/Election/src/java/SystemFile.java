
import java.io.File;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Harshit
 */
class SystemFile {
    
    public void removePhoto(String filename)
    {
        try  
        {         
            File f= new File(filename);          
            if(f.delete())                        
            {  
                System.out.println("deleted");   //getting and printing the file name  
            }  
            else  
            {  
                System.out.println("failed");  
            }  
        }  
        catch(Exception e)  
        {  
            System.out.println("Error in newremover "+e); 
        } 
    }
 }
