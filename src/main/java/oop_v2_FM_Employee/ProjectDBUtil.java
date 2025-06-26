package oop_v2_FM_Employee;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class ProjectDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static List<Project> validate(String username, String password) {
		
		ArrayList<Project> project = new ArrayList<>();
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from Project where username ='"+username+"' and password= '"+password+"'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				String projectID = rs.getString(1);
				String projectName = rs.getString(2);
				String description = rs.getString(3);
				String clientName = rs.getString(4);
				String deadline = rs.getString(5);
				String status = rs.getString(6);
				String userU = rs.getString(7);
				String passU = rs.getString(8);
				
				Project p = new Project(projectID, projectName, description, clientName, deadline, status, userU, passU);
				project.add(p);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return project;
		
	}
	
	
	public static List<Project> getAllEmployeeDetails() {
		

		
		ArrayList<Project> proj = new ArrayList<>();
		
		try {
		
			Class.forName("com.mysql.jdbc.Driver");
		

			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from Project";
			rs = stmt.executeQuery(sql);
			
			
			
			
			while (rs.next()) {
				String projectID = rs.getString(1);
				String projectName = rs.getString(2);
				String description = rs.getString(3);
				String clientName = rs.getString(4);
				String deadline = rs.getString(5);
				String status = rs.getString(6);
				String username = rs.getString(7);
				String password = rs.getString(8);
				Project p = new Project(projectID, projectName, description, clientName, deadline, status, username, password);
				proj.add(p);	
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}	
		return proj;	
	}
	
	
	public static boolean insertproject(String projectID, String projectName, String description,  String clientName, String deadline, String status, String username, String password) {
		
		boolean isSuccess = false;
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "insert into project values ('"+projectID+"', '"+projectName+"', '"+description+"', '"+clientName+"', '"+deadline+"', '"+status+"', '"+username+"', '"+password+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
		
	}
	
	public static boolean updateproject(String projectID, String projectName, String description, String clientName, String deadline, String status, String username, String password) {
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "update project set projectName='"+projectName+"', description='"+description+"', clientName='"+clientName+"', deadline='"+deadline+"', status='"+status+"', username='"+username+"', password='"+password+"' where projectID='"+projectID+"'";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
				
			}else {
				isSuccess = false;
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	//GetAllProject
	public static List<Project> getProjectDetails(String PID) {
		
		ArrayList<Project> pro = new ArrayList<>();
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from project where projectID= '"+PID+"'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String projectID = rs.getString(1);
				String projectName = rs.getString(2);
				String description = rs.getString(3);
				String clientName = rs.getString(4);
				String deadline = rs.getString(5);
				String status = rs.getString(6);
				String username = rs.getString(7);
				String password = rs.getString(8);
				Project p = new Project(projectID, projectName, description, clientName, deadline, status, username, password);
				pro.add(p);	
			}
		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return pro;
		
	}
	
	//Delete
	
	public static boolean deleteProject(String projectID) {
		
		try {
			
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "delete from project where projectID='"+projectID+"'";
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
