package oop_v2_FM_Employee;

public class DeductionSalary extends Salary{
		private Double Tax;
		private Double Insurance;
		private Double Loan;
		private int Other;
		
		public DeductionSalary(String empID, Double basicSalary, Double oTRate, Double deductionRate, Double tax,
				Double insurance, Double loan, int other) {
			super(empID, basicSalary, oTRate, deductionRate);
			Tax = tax;
			Insurance = insurance;
			Loan = loan;
			Other = other;
		}

		public Double getTax() {
			return Tax;
		}

		public Double getInsurance() {
			return Insurance;
		}

		public Double getLoan() {
			return Loan;
		}

		public int getOther() {
			return Other;
		}

		public void setTax(Double tax) {
			Tax = tax;
		}

		public void setInsurance(Double insurance) {
			Insurance = insurance;
		}

		public void setLoan(Double loan) {
			Loan = loan;
		}

		public void setOther(int other) {
			Other = other;
		}
		
		public double CalculateDeduction() {
			double OtherDeduction = Other * getDeductionRate()* getBasicSalary();
			
			double TotalDeduction = Tax +Insurance + Loan + Other;
			return TotalDeduction;
			
		}
		
}
