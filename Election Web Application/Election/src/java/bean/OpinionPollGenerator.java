
package bean;

import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.lang.*;

/**
 *
 * @author Mauneel Sorathia
 */
public class OpinionPollGenerator {
    private static HashMap<Integer,String> que;
    private static ArrayList<Integer> pollid;
    private static HashMap<Integer, HashMap<Integer,String>> options;
    private static Connection con;

    public static HashMap<Integer, String> getQue() {
        return que;
    }

    public static ArrayList<Integer> getPollid() {
        return pollid;
    }

    public static HashMap<Integer, HashMap<Integer, String>> getOptions() {
        return options;
    }

    public static void setQue(HashMap<Integer,String> que) {
        OpinionPollGenerator.que = que;
    }

    public static void setPollid(ArrayList<Integer> pollid) {
        OpinionPollGenerator.pollid = pollid;
    }

    public static void setCon(Connection con) {
        OpinionPollGenerator.con = con;
    }


    public OpinionPollGenerator() {
    }
    public static void setOptions(String userid){
        que=new HashMap<Integer,String>();
        pollid= new ArrayList<Integer>();
        options= new HashMap<Integer, HashMap<Integer,String>>();
        PreparedStatement pst;
        PreparedStatement pst2;
        PreparedStatement pst4;
        //System.out.println("OptionsFLAG---------------------------------");
        try {
            pst4 = con.prepareStatement("select pollid from user_poll where userid=?");
            pst4.setString(1,userid);
            pst = con.prepareStatement("select * from polls");
            ResultSet rs = pst.executeQuery();
            ResultSet rs2;
            pst2 = con.prepareStatement("select * from poll_options where pollid=?");
            int pid, opid;
            String ques,opt;
            while(rs.next()){
                pid = rs.getInt("pollid");
                ResultSet rs3 = pst4.executeQuery();
               // System.out.println("Inside 1 loop ----------------");
                ArrayList<Integer> falsePoll = new ArrayList<Integer>();
                while(rs3.next())
                {
                    falsePoll.add(rs3.getInt("pollid"));
                }
//                System.out.println("userid----"+userid);
//                System.out.println("pollid----"+pid);
//                System.out.println(falsePoll);
//                
                if(!(falsePoll.contains(pid))){
                    ques = rs.getString("question");
                    pollid.add(pid);
                    que.put(pid,ques);
                    pst2.setInt(1,pid);
                    rs2 = pst2.executeQuery();
                    HashMap<Integer, String> op = new HashMap<Integer, String>();
                    while(rs2.next()){
                        op.put(rs2.getInt("optionid"),rs2.getString("value"));
                        System.out.println(rs2.getString("value"));
                    }
                    options.put(pid,op);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OpinionPollGenerator.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    public static double countResult(int opt ,String userid, int pollid)
    {
        double result = 0;
        try {
//            System.out.println("Inside Count result  "+pollid);
//            System.out.println("Inside Count result  "+opt  );
            String option;
            PreparedStatement pst3;
            pst3 = con.prepareStatement("select votes from poll_options where optionid=?");
            
            pst3.setInt(1, opt);
            ResultSet rs = pst3.executeQuery();
            System.out.println("Query 1");
            rs.next();
            int votes = rs.getInt("votes");
            pst3 = con.prepareStatement("update poll_options set votes=? where optionid=?");
            pst3.setInt(1,votes+1);
            pst3.setInt(2, opt);
            pst3.executeUpdate();
            System.out.println("Query 2");
            pst3 = con.prepareStatement("insert into user_poll values(?,?)");
            pst3.setInt(1,pollid);
            pst3.setString(2,userid);
            pst3.executeUpdate();
            System.out.println("Query 3");
            
        } catch (SQLException ex) {
            System.out.println(ex+"-----------------------------");
            Logger.getLogger(OpinionPollGenerator.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
