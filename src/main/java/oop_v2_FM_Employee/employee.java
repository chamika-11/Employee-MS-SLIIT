package oop_v2_FM_Employee;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class Employee {

	private String EmpID;
	private String EmpName;
	private Date DOB;
	private String Gender;
	private String Email;
	private int Contact;
	private String Department;
	private String Position;
	private String Address_L1;
	private String Address_L2;
	private String Username;
	private String Password;
	
	
	
	public Employee(String empID, String empName,Date dOB2, String gender,String email, int contact, String department, String position, String address_L1,
			String address_L2, String username, String password) {
		
		EmpID = empID;
		EmpName = empName;
		DOB = dOB2;
		Gender = gender;
		Email = email;
		Contact = contact;
		Department = department;
		Position = position;
		Address_L1 = address_L1;
		Address_L2 = address_L2;
		Username = username;
		Password = password;
		
	}


	public String getEmpID() {
		return EmpID;
	}


	public String getEmpName() {
		return EmpName;
	}

	
	public Date getDOB() {
		return DOB;
	}
	
	public String getGender() {
		return Gender;
	}
	
	public String getEmail() {
		return Email;
	}
	

	public int getContact() {
		return Contact;
	}
	
	public String getDepartment() {
		return Department;
	}
	
	public String getPosition() {
		return Position;
	}
	


	public String getAddress_L1() {
		return Address_L1;
	}


	public String getAddress_L2() {
		return Address_L2;
	}


	public String getUsername() {
		return Username;
	}


	public String getPassword() {
		return Password;
	}




	
	
	
	
	
}
