package oop_v2_FM_Employee;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class SalaryDB {
	
	public static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	
	//validateLogin
	public static List<employee> validatelogin(String username,String password ){
		
		ArrayList<employee> emp = new ArrayList();
		
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			
			String sql ="select * from employee where Username='"+username+"'and Password = '"+password+"'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				String EmpID = rs.getString(1);
				String EmpName = rs.getString(2);
				Date DOB = rs.getDate(3);
				String Gender = rs.getString(4);
				String Email = rs.getString(5);
				int Contact = rs.getInt(6);
				String Department = rs.getString(7);
				String Position = rs.getString(8);
				String Address_L1 = rs.getString(9);
				String Address_L2 = rs.getString(10);
				String Username = rs.getString(11);
				String Password = rs.getString(12);
				
				
				
				employee em = new employee(EmpID,EmpName,DOB,Gender,Email,Contact,Department,Position,Address_L1,Address_L2,Username,Password);
				emp.add(em);
			}
			
		}catch(Exception e) {
			  e.printStackTrace();
		}
		return emp;
		
	}
	

    /*public static List<Salary> validate(String userId) {

        ArrayList<Salary> Salarylist = new ArrayList<>();

       
        // Validate
        try {
            
            con = DBConnect.getConnection();
            stmt = con.createStatement();
			String sql = "select * from salary where EmpID='"+userId+"'";
			rs = stmt.executeQuery(sql);
		      

			if (rs.next()) {
				String EmpID = rs.getString(1);
				String EmpName = rs.getString(2);
				Double BasicSalary = rs.getDouble(3);
				Double Bonus = rs.getDouble(4);
				int OThours = rs.getInt(5);
				Double TotalSalary = rs.getDouble(6);
	
				Salary Sal = new Salary(EmpID,EmpName,BasicSalary,Bonus,TotalSalary,OThours);
				Salarylist.add(Sal);
			} 
            
            
           
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        System.out.println(" "+Salarylist);

        return Salarylist;
    }*/
	
	
	//get details by id
	public static List<Salary> getDetailsByID(String EmpId){
		ArrayList<Salary> SalaryList2 = new ArrayList();
		
		try {
			con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql ="SELECT * from basicsalaryn where EmpID '"+EmpId+"'";
            rs=stmt.executeQuery(sql);
            

			while(rs.next()) {
				String EmpID = rs.getString(1);
				Double BasicSalary = rs.getDouble(2);
				Double OTRate = rs.getDouble(3);
				Double DeductionRate = rs.getDouble(4);
				
				Salary SalObj = new Salary(EmpID,BasicSalary,OTRate,DeductionRate);
				SalaryList2.add(SalObj);
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		
		}
		
		return SalaryList2;
		
		
	}
    
	
	//View record
	
	public static List<Salary> getEmployeeDetailsList(){
		
		ArrayList<Salary> SalaryList = new ArrayList();
		
		try {
			con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql ="SELECT * from basicsalary";
            rs=stmt.executeQuery(sql);
            

			while(rs.next()) {
				String EmpID = rs.getString(1);
				Double BasicSalary = rs.getDouble(2);
				Double OTRate = rs.getDouble(3);
				Double DeductionRate = rs.getDouble(4);
				
				Salary SalObj = new Salary(EmpID,BasicSalary,OTRate,DeductionRate);
				SalaryList.add(SalObj);
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		
		}
		
		return SalaryList;
	}
    
    //Insert
    public static boolean insertsalary(String EmpID, Double BasicSalary, Double OTRate,Double DeductionRate)
    
    {
    	boolean isSuccess =false;
    	
         
         try {
        	 
        	 con = DBConnect.getConnection();
             stmt = con.createStatement();
 			String sql = "insert into basicsalary values('"+EmpID+"','"+BasicSalary+"','"+OTRate+"','"+DeductionRate+"')";
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
    	
    	//Update
    	public static boolean updatesalary(String EmpID,Double BasicSalary, Double OTRate,Double DeductionRate)
        
    	{
    		  try {
    	        	 
    	        	 con = DBConnect.getConnection();
    	             stmt = con.createStatement();
    	 			String sql = "update basicsalary set BasicSalary='"+BasicSalary+"',OTRate='"+OTRate+"',DeductionRate='"+DeductionRate+"'"
    	 					+ "where EmpID='"+EmpID+"'";
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
    	
    	
    	
    	//Delete
	public static boolean deletesalary(String EmpID)
        
    	{
    		  try {
    	        	 
    	        	 con = DBConnect.getConnection();
    	             stmt = con.createStatement();
    	 			String sql = "delete from basicsalary where EmpID='"+EmpID+"'";
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
    	
    	//Read
	public static List<Salary> getSalaryDetails(String EmpId){
		ArrayList<Salary> Sal2 = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "select * from basicsalary where EmpID='"+EmpId+"'";
             rs = stmt.executeQuery(sql);
            
            while(rs.next()) {
            	String EmpID = rs.getString(1);
				Double BasicSalary = rs.getDouble(2);
				Double OTRate = rs.getDouble(3);
				Double DeductionRate= rs.getDouble(4);
	
				Salary Sal = new Salary(EmpID,BasicSalary,OTRate,DeductionRate);
				Sal2.add(Sal);
            }
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return Sal2;
	}
    	
    	
	//Update Login
	public static boolean updatelogin(String EmpID, String EmpName,Date DOB,String Gender,String Email,int Contact,String Department,String Position,String Address_L1,
			String Address_L2,String Username, String Password)
    
	{
		  try {
	        	 
	        	 con = DBConnect.getConnection();
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
    	
    	
    	//Read login
	public static List<employee> getLoginDetails(String EmpId){
		ArrayList<employee> emp2 = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "select * from employee where EmpID='"+EmpId+"'";
             rs = stmt.executeQuery(sql);
            
             while(rs.next()) {
            	String EmpID = rs.getString(1);
				String EmpName = rs.getString(2);
				Date DOB = rs.getDate(3);
				String Gender = rs.getString(4);
				String Email = rs.getString(5);
				int Contact = rs.getInt(6);
				String Department = rs.getString(7);
				String Position = rs.getString(8);
				String Address_L1 = rs.getString(9);
				String Address_L2 = rs.getString(10);
				String Username = rs.getString(11);
				String Password = rs.getString(12);
				
				
				
				employee em2 = new employee(EmpID,EmpName,DOB,Gender,Email,Contact,Department,Position,Address_L1,Address_L2,Username,Password);
 				emp2.add(em2);
             }
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return emp2;
	}
	
	//View more read
	public static List<employee> getotherdetails(String EmpId){
		ArrayList<employee> Emp3 = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "select * from employee where EmpID='"+EmpId+"'";
             rs = stmt.executeQuery(sql);
            
             while(rs.next()) {
            	String EmpID = rs.getString(1);
				String EmpName = rs.getString(2);
				Date DOB = rs.getDate(3);
				String Gender = rs.getString(4);
				String Email = rs.getString(5);
				int Contact = rs.getInt(6);
				String Department = rs.getString(7);
				String Position = rs.getString(8);
				String Address_L1 = rs.getString(9);
				String Address_L2 = rs.getString(10);
				String Username = rs.getString(11);
				String Password = rs.getString(12);
				
				
				
				employee em3 = new employee(EmpID,EmpName,DOB,Gender,Email,Contact,Department,Position,Address_L1,Address_L2,Username,Password);
 				Emp3.add(em3);
             }
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return Emp3;
	}
    	
    	
	
	//Payroll process
	 public static payroll getpayrollDetails(String EmpID) {
	        payroll pay = null;
	        PreparedStatement pstmt = null;
	        
	        try {
	            con = DBConnect.getConnection();
	            String sql = "SELECT e.EmpID, e.Department, e.Position, bs.BasicSalary FROM employee e JOIN basicsalary bs ON e.EmpID = bs.EmpID WHERE e.EmpID = ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, EmpID);
	            rs = pstmt.executeQuery();
	            
	            if (rs.next()) {
	                String department = rs.getString("Department");
	                String position = rs.getString("Position");
	                Double basicSalary = rs.getDouble("BasicSalary");
	                
	                pay = new payroll(EmpID, department, position, basicSalary);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (rs != null) rs.close();
	                if (pstmt != null) pstmt.close();
	                if (con != null) con.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        
	        return pay;
	    }
	
	
	
	//Count employee 
	
	public static int getEmployeeCount() {
		int employeeCount = 0;
		
		try {
			con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT COUNT(EmpID)  From employee" ;
             rs = stmt.executeQuery(sql);
            
            if(rs.next()) {
            employeeCount = rs.getInt(1);	
             }
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return employeeCount;
		
	}
	
	
	//Get OTRate
	public static double getOTRate(String EmpID) {
        double OTRate = 0.0;
        PreparedStatement pstmt = null;
        
        try {
            con = DBConnect.getConnection();
            String sql = "SELECT OTRate FROM basicsalary WHERE EmpID = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, EmpID);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                OTRate = rs.getDouble("OTRate");
            } else {
                System.out.println("No OTRate found for EmpID: " + EmpID);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error in getOTRate: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return OTRate;
    }

	
	//calculate and insert
    public static boolean calculateBonus(String EmpID, double HAllowance, double TAllowance, double PBonus, int OThours) {
        boolean isSuccess = false;
        PreparedStatement pstmt = null;
        
        try {
            con = DBConnect.getConnection();
            
            double OTRate = getOTRate(EmpID);
            double OTpay = OThours * OTRate;
            double TotalBonus = HAllowance + TAllowance + PBonus + OTpay;
            
            String sql = "INSERT INTO bonussalary (EmpID, HAllowance, TAllowance, PBonus, OThours, BonusSalary) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, EmpID);
            pstmt.setDouble(2, HAllowance);
            pstmt.setDouble(3, TAllowance);
            pstmt.setDouble(4, PBonus);
            pstmt.setInt(5, OThours);
            pstmt.setDouble(6, TotalBonus);
            
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                isSuccess = true;
                System.out.println("Bonus calculation successful for EmpID: " + EmpID);
            } else {
                System.out.println("No rows affected. Insertion failed for EmpID: " + EmpID);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error in calculateBonus: " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return isSuccess;
    }


    
    //Deduction Rate
    public static double getDeduction(String empID) {
        double basicSalary = 0.0;
        double deductionRate = 0.0;
        PreparedStatement pstmt = null;
        
        try {
            con = DBConnect.getConnection();
            String sql = "SELECT BasicSalary, DeductionRate FROM basicsalary WHERE EmpID = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, empID);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
               basicSalary = rs.getDouble("BasicSalary");
               deductionRate = rs.getDouble("DeductionRate");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return basicSalary * deductionRate;
    }
    
    
    //calculate and insert
    public static boolean calculateDeduction(String empID, double tax, double insurance, double loan, int other) {
        boolean isSuccess = false;
        PreparedStatement pstmt = null;
        
        try {
            con = DBConnect.getConnection();
            
            double deductionRate = getDeduction(empID);
            double deductionPay = other * deductionRate;
            double totalDeduction = tax + insurance + loan + deductionPay;
            
            String sql = "INSERT INTO deduction (EmpID, Tax, Insurance, Loan, Other, DeductionSalary) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, empID);
            pstmt.setDouble(2, tax);
            pstmt.setDouble(3, insurance);
            pstmt.setDouble(4, loan);
            pstmt.setInt(5, other);
            pstmt.setDouble(6, totalDeduction);
            
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return isSuccess;
    }

    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    	
    	
    	
    	
    	
    	
    	
    }
    

