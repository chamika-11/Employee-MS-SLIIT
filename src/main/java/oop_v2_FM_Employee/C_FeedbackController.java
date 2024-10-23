package oop_v2_FM_Employee;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import oop_v2_FM_Employee.C_DBConnection;


public class C_FeedbackController {
	private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
    
    
  //Feedback insert
    public static boolean insertFeedData(String feedback) {
    	boolean isSuccess=false;
    	
    	try {
    		con=C_DBConnection.getConnection();
    		stmt=con.createStatement();
    		
    		String sql="INSERT INTO feedback values(0,'"+feedback+"')";
    		
    		int rs=stmt.executeUpdate(sql);
    		if(rs>0) {
    			isSuccess=true;
    		}
    		else {
    			isSuccess=false;
    		}
    		
    	}
    		catch(Exception e) {
    				e.printStackTrace();
    		}
    		return isSuccess;
    	}
    
    //Feedback view
    public static List<C_FeedbackModel> getAllFeedback(int feedID){
    	ArrayList<C_FeedbackModel> feed=new ArrayList<>();
    	
    	try {
    		con=C_DBConnection.getConnection();
    		stmt=con.createStatement();
    		String sql="SELECT * FROM feedback where feedback_id = '"+feedID+"'";
        	
        	rs=stmt.executeQuery(sql);
        	
        	while(rs.next()) {
        		int feedback_id=rs.getInt(1);
        		String feedback=rs.getString(2);
        		Date feedback_date=rs.getDate(3);
        		
        		
        		C_FeedbackModel feedb=new C_FeedbackModel(feedback_id,feedback,feedback_date);
        		feed.add(feedb);
        	}
        	
        }
        catch(Exception e) {
        	e.printStackTrace();
        }
    	return feed;
        }
    	
}
