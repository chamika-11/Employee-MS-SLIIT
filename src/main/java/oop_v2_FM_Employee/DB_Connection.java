package oop_v2_FM_Employee;



import java.sql.Connection;
import java.sql.DriverManager;

public class DB_Connection {
	
	private static String url = "jdbc:mysql://localhost:3306/bank";
	private static String userName = "root";
	private static String password = "Sithu1234#";

	private static Connection con;

	
	
	public static Connection getConnection() {
	
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection(url, userName, password);
			
		}
		catch (Exception e) {
			System.out.println("Database connection is not success!!!");
		}
		
		return con;
	}

	
}
