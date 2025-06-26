package oop_v2_FM_Employee;

import java.sql.Connection;
import java.sql.DriverManager;

public class A_DBConnect {
	
	private static String url = "jdbc:mysql://localhost:3306/bank";
	private static String username = "root";
	private static String password = "Sithu1234#";
	private static Connection con;
	
	public static Connection getConnection() {
		 
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, username, password);
			
		}
		catch (Exception e) {
			System.out.println("Database connection is unsuccesful!");
		}
		
		return con;
		
	}

}
