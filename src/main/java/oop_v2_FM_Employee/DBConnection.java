package oop_v2_FM_Employee;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static String url="jdbc:mysql://localhost:3306/bank";
	private static String user="root";
	private static String pass="Sithu1234#";
	
	private static Connection con;
	
	public static Connection getConnection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url,user,pass);
		}
		catch(Exception e) {
			System.out.println("Database not connected");
		}
		return con;
	}	
	
}
