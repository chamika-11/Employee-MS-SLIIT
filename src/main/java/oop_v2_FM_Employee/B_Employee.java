package oop_v2_FM_Employee;

import java.sql.Date;

public class B_Employee {
	private String empID;
	private String empName;
	private Date dOB;
	private String gender;
	private String email;
	private int contact;
	private String department;
	private String position;
	private String address_L1;
	private String address_L2;
	private String username;
	private String password;
	
	public B_Employee(String EmpID, String EmpName, Date DOB, String Gender, String Email, int Contact,String Department, String Position, String Address_L1, String Address_L2, String Username,String Password) {
		this.empID = EmpID;
		this.empName = EmpName;
		this.dOB = DOB;
		this.gender = Gender;
		this.email = Email;
		this.contact = Contact;
		this.department = Department;
		this.position = Position;
		this.address_L1 = Address_L1;
		this.address_L2 = Address_L2;
		this.username = Username;
		this.password = Password;
	}

	public String getEmpID() {
		return empID;
	}

	public String getEmpName() {
		return empName;
	}

	public Date getdOB() {
		return dOB;
	}

	public String getGender() {
		return gender;
	}

	public String getEmail() {
		return email;
	}

	public int getContact() {
		return contact;
	}

	public String getDepartment() {
		return department;
	}

	public String getPosition() {
		return position;
	}

	public String getAddress_L1() {
		return address_L1;
	}

	public String getAddress_L2() {
		return address_L2;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	
	
	
	

	
	

}
