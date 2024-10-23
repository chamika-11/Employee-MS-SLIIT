package oop_v2_FM_Employee;

public class BonusSalary extends Salary {
	private Double HAllowance;
	private Double TAllowance;
	private Double PBonus;
	private int OThours;
	
	public BonusSalary(String BEmpID, Double BBasicSalary, Double BOTRate,Double BDeductionRate,Double hAllowance, Double tAllowance, Double pBonus, int oThours) {
		super(BEmpID,BBasicSalary,BOTRate,BDeductionRate);
		HAllowance = hAllowance;
		TAllowance = tAllowance;
		PBonus = pBonus;
		OThours = oThours;
	}

	public Double getHAllowance() {
		return HAllowance;
	}

	public Double getTAllowance() {
		return TAllowance;
	}

	public Double getPBonus() {
		return PBonus;
	}

	public int getOThours() {
		return OThours;
	}

	public void setHAllowance(Double hAllowance) {
		HAllowance = hAllowance;
	}

	public void setTAllowance(Double tAllowance) {
		TAllowance = tAllowance;
	}

	public void setPBonus(Double pBonus) {
		PBonus = pBonus;
	}

	public void setOThours(int oThours) {
		OThours = oThours;
	}
	
	public double CalculateBonus() {
		double OTPay = OThours * getOTRate();
		
		double TotalBonus = HAllowance + TAllowance + PBonus + OTPay;
		return TotalBonus;
		
	}
	
	

}
