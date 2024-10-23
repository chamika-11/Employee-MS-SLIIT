package oop_v2_FM_Employee;

public class payroll {
	private String EmpID;
	private String Department;
	private String Position;
	private Double BasicSalary;
	
	
	
	public payroll(String empID, String department, String position, Double basicSalary) {
		EmpID = empID;
		Department = department;
		Position = position;
		BasicSalary = basicSalary;
	}
	
	
	public String getEmpID() {
		return EmpID;
	}
	public String getDepartment() {
		return Department;
	}
	public String getPosition() {
		return Position;
	}
	public Double getBasicSalary() {
		return BasicSalary;
	}
	public void setEmpID(String empID) {
		EmpID = empID;
	}
	public void setDepartment(String department) {
		Department = department;
	}
	public void setPosition(String position) {
		Position = position;
	}
	public void setBasicSalary(Double basicSalary) {
		BasicSalary = basicSalary;
	}
	
	

}
