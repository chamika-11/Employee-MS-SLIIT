package oop_v2_FM_Employee;

import java.sql.Connection;
import java.sql.Date;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class B_Emp_DbUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	public static boolean scan(String EmpID) {
		
		
		boolean isSuccess = false;
		try {

		con = B_DB_Connection.getConnection();
		stmt = con.createStatement();
		
		String sql = "select * from employee where EmpID='"+EmpID+"'";
		 rs = stmt.executeQuery(sql) ;
		
		
		if (rs.next()) {
			isSuccess = true;
		} else {
			isSuccess = false;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
		
	return isSuccess;
	}
	
	
	
	
	
	

		public static boolean validate (String username, String password) { //call method to validate 

			boolean isSuccess = false;
			try {

			Class.forName("com.mysql.jdbc.Driver");


			con = B_DB_Connection.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from employee where Username='"+username+"' and Password='"+password+"'";
			 rs = stmt.executeQuery(sql) ;
			
			
			if (rs.next()) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;

		
		
	}

	
			public static boolean InsertEmployee(String empID, String empName, Date date, String gender, String email,
	                int contact, String department, String position, String address_L1,
	                String address_L2, String username, String password) {
	
			boolean isSuccess = false;
	
			try {
				//load MySQL JDBC Driver
				Class.forName("com.mysql.jdbc.Driver");
				
				// Establish the connection

				con = B_DB_Connection.getConnection();
				
				
				//prepare SQL query using PreparedStatement 
				String sql = "INSERT INTO employee (EmpID, EmpName, DOB, Gender, Email, Contact, Department, " +
				"Position, Address_L1, Address_L2, Username, Password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; //to avoid SQL injection and handle data types
				
				//create a PreparedStatement
							PreparedStatement pstmt = con.prepareStatement(sql);
							
							// Set the values to the query
							pstmt.setString(1, empID);              
							pstmt.setString(2, empName);            
							pstmt.setDate(3, date);                  
							pstmt.setString(4, gender);             
							pstmt.setString(5, email);              
							pstmt.setInt(6, contact);               
							pstmt.setString(7, department);         
							pstmt.setString(8, position);         
							pstmt.setString(9, address_L1);         
							pstmt.setString(10, address_L2);        
							pstmt.setString(11, username);           
							pstmt.setString(12, password);         
							
				//Execute the query
				int rowsAffected = pstmt.executeUpdate();
				
				
				if (rowsAffected > 0) {
				isSuccess = true;
				}
				
				
				con.close();
			} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			}
			
			return isSuccess;
}
	

		
		
		
		public static boolean updateemployee(String EmpID, String EmpName,Date DOB,String Gender,String Email,int Contact,String Department,String Position,String Address_L1,
				String Address_L2,String Username, String Password)
	    
		{
		
			boolean isSuccess = false;
			
			  try {
		        	 
				  Class.forName("com.mysql.jdbc.Driver");

					con = B_DB_Connection.getConnection();
					stmt = con.createStatement();
					
		             String sql = "UPDATE employee SET EmpName='"+EmpName+"', DOB='"+DOB+"', Gender='"+Gender+"', Email='"+Email+"', Contact='"+Contact+"', Department='"+Department+"', Position='"+Position+"', " 
		                     + "Address_L1='"+Address_L1+"', Address_L2='"+Address_L2+"', Username='"+Username+"', Password='"+Password+"' WHERE EmpID='"+EmpID+"'";

		 			int rs = stmt.executeUpdate(sql);
		 			
		 			if(rs>0) {
		 				isSuccess = true;
		 			}else {
		 				isSuccess = false;
		 			}
		        	 
		        	 
		         }
		         catch(Exception e) {
		        	 e.printStackTrace();
		         }
			
			
			return isSuccess;
		}

		
		
		public static List<B_Employee> getUpdatedEmployeeDetails(String empId) {
         ArrayList<B_Employee> emp = new ArrayList<>(); //creating an ArrayList to store B_Employee objects
	
			try {
		
			Class.forName("com.mysql.jdbc.Driver");
		

			con = B_DB_Connection.getConnection();
			stmt = con.createStatement();
			
			
			String sql = "select * from employee where EmpId='"+empId+"'";	    		
			rs = stmt.executeQuery(sql) ;
			
			while(rs.next()) {
			
				
				 String EmpID= rs.getString(1);
				 String EmpName= rs.getString(2);
				 Date DOB= rs.getDate(3);
				 String Gender= rs.getString(4);
				 String Email= rs.getString(5);
				 int Contact=  rs.getInt(6);
				 String Department= rs.getString(7);
				 String Position= rs.getString(8);
				 String Address_L1= rs.getString(9);
				 String Address_L2= rs.getString(10);
				 String Username= rs.getString(11);
				 String Password= rs.getString(12);
				
				
				
				 B_Employee c = new B_Employee( EmpID,  EmpName,  DOB,  Gender,  Email,  Contact, Department,  Position,  Address_L1,  Address_L2,  Username, Password);
				emp.add(c);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}	
		return emp;	
		}

		
		
		
		
		

public static List<B_Employee> getEmployeeDetails(String EmpID) {
	

	
	ArrayList<B_Employee> emp = new ArrayList<>();

		try {
	
		Class.forName("com.mysql.jdbc.Driver");
	

		con = B_DB_Connection.getConnection();
		stmt = con.createStatement();
		
		
		String sql = "select * from employee where EmpID='"+EmpID+"'";	    		
		rs = stmt.executeQuery(sql) ;
		
		while(rs.next()) {
		
			
			 String empID= rs.getString(1);
			 String EmpName= rs.getString(2);
			 Date DOB= rs.getDate(3);
			 String Gender= rs.getString(4);
			 String Email= rs.getString(5);
			 int Contact=  rs.getInt(6);
			 String Department= rs.getString(7);
			 String Position= rs.getString(8);
			 String Address_L1= rs.getString(9);
			 String Address_L2= rs.getString(10);
			 String Username= rs.getString(11);
			 String Password= rs.getString(12);
			
			
			
			 B_Employee c = new B_Employee( empID,  EmpName,  DOB,  Gender,  Email,  Contact, Department,  Position,  Address_L1,  Address_L2,  Username, Password);
			emp.add(c);
		}
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}	
	return emp;	
}


public static List<B_Employee> getAllEmployeeDetails() {
	

	
	ArrayList<B_Employee> emp = new ArrayList<>();
	
	try {
	
		Class.forName("com.mysql.jdbc.Driver");
	

		con = B_DB_Connection.getConnection();
		stmt = con.createStatement();
		
		
		String sql = "select * from employee" ;	    		
		rs = stmt.executeQuery(sql) ;
		
		while(rs.next()) {
		
			
			 String EmpID= rs.getString(1);
			 String EmpName= rs.getString(2);
			 Date DOB= rs.getDate(3);
			 String Gender= rs.getString(4);
			 String Email= rs.getString(5);
			 int Contact=  rs.getInt(6);
			 String Department= rs.getString(7);
			 String Position= rs.getString(8);
			 String Address_L1= rs.getString(9);
			 String Address_L2= rs.getString(10);
			 String Username= rs.getString(11);
			 String Password= rs.getString(12);
			
			
			
			 B_Employee c = new B_Employee( EmpID,  EmpName,  DOB,  Gender,  Email,  Contact, Department,  Position,  Address_L1,  Address_L2,  Username, Password);
			emp.add(c);
		}
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}	
	return emp;	
}





public static boolean deleteEmployee(String empID) {
	

			boolean isSuccess = false;
			try {

			Class.forName("com.mysql.jdbc.Driver");


			con = B_DB_Connection.getConnection();
			stmt = con.createStatement();
				String sql = "delete from employee where EmpID='"+empID+"'";
				int r = stmt.executeUpdate(sql);
				
				if (r > 0) {
					isSuccess = true;
				}
				else {
					isSuccess = false;
				}
				
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
			return isSuccess;
		}


}
