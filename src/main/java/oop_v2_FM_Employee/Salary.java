package oop_v2_FM_Employee;

public  class Salary {
    private String EmpID;
    private Double BasicSalary;
    private Double OTRate;
    private Double DeductionRate;
    
 // Constructor
	public Salary(String empID, Double basicSalary, Double oTRate, Double deductionRate) {
		
		this.EmpID = empID;
		this.BasicSalary = basicSalary;
		this.OTRate = oTRate;
		this.DeductionRate = deductionRate;
	}

	public String getEmpID() {
		return EmpID;
	}

	public Double getBasicSalary() {
		return BasicSalary;
	}

	public Double getOTRate() {
		return OTRate;
	}

	public Double getDeductionRate() {
		return DeductionRate;
	}

	public void setEmpID(String empID) {
		EmpID = empID;
	}

	public void setBasicSalary(Double basicSalary) {
		BasicSalary = basicSalary;
	}

	public void setOTRate(Double oTRate) {
		OTRate = oTRate;
	}

	public void setDeductionRate(Double deductionRate) {
		DeductionRate = deductionRate;
	}
    
 
	
	
 
}
