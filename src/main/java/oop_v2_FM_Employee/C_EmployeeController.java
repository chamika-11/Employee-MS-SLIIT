package oop_v2_FM_Employee;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class C_EmployeeController {
	private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
    
    public static boolean inserdata(String employee_id,String leave_type,Date start_date,Date end_date,String reason,String approval_status) {
    	
    	boolean isSuccess=false;
    	
    	try {
    		System.out.println("inside the insertdata");
    		con=C_DBConnection.getConnection();
    		stmt=con.createStatement();
    		
    		String sql="INSERT INTO employeedetail values(0,'"+employee_id+"','"+leave_type+"','"+start_date+"','"+end_date+"','"+reason+"','"+approval_status+"')";
    		System.out.println(sql);
    		int rs=stmt.executeUpdate(sql);
    		if(rs>0) {
    			isSuccess=true;
    		}
    		else {
    			isSuccess=false;
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
		return isSuccess;
    }
    
    
  //GetEmployee
    public static List<C_EmployeeModel> getAllEmployee(String empID){
	
	ArrayList<C_EmployeeModel> employ = new ArrayList<>();
	try {
    	con=C_DBConnection.getConnection();
    	stmt=con.createStatement();
    	
    	String sql="SELECT * FROM employeedetail where employee_id = '"+empID+"'";
    	
    	rs=stmt.executeQuery(sql);
    	
    	while(rs.next()) {
    		int leave_id=rs.getInt(1);
    		String employee_id=rs.getString(2);
    		String leave_type=rs.getString(3);
    		Date start_date=rs.getDate(4);
    		Date end_date=rs.getDate(5);
    		String reason=rs.getString(6);
    		String approval_status=rs.getString(7);
    		
    		C_EmployeeModel empm=new C_EmployeeModel(leave_id,employee_id,leave_type,start_date,end_date,reason,approval_status);
    		employ.add(empm);
    	}
    	
    }
    catch(Exception e) {
    	e.printStackTrace();
    }
	return employ;
    }
   
    
  //Update
    public static boolean updatedata(int leave_id,String employee_id,String leave_type,Date start_date,Date end_date,String reason) {
    	try {
    		con=C_DBConnection.getConnection();
        	stmt=con.createStatement();
        	
        	String sql="UPDATE employeedetail set leave_type='"+leave_type+"',start_date='"+start_date+"',end_date='"+end_date+"',reason='"+reason+"'"
        			+"WHERE leave_id='"+leave_id+"'";
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
    
    
    //Delete
    public static boolean deletedata(int leave_id) {
    	boolean isSuccess=false;
    	try {
    		con=C_DBConnection.getConnection();
        	stmt=con.createStatement();
        	String sql="delete from employeedetail where leave_id='"+leave_id+"'";
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
    
    
    	
}
