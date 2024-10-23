package oop_v2_FM_Employee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calculatedeductionservlet")
public class calculatedeductionservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		        String empID = request.getParameter("EmpID");
		        String taxStr = request.getParameter("Tax");
		        String insuranceStr = request.getParameter("Insurance");
		        String loanStr = request.getParameter("Loan");
		        String otherStr = request.getParameter("Other");

		        try {
		            if (empID == null || empID.isEmpty() || taxStr == null || insuranceStr == null || loanStr == null || otherStr == null) {
		                throw new IllegalArgumentException("All fields are required");
		            }

		            double tax = Double.parseDouble(taxStr);
		            double insurance = Double.parseDouble(insuranceStr);
		            double loan = Double.parseDouble(loanStr);
		            int other = Integer.parseInt(otherStr);

		            boolean isSuccess = SalaryDB.calculateDeduction(empID, tax, insurance, loan, other);

		            if (isSuccess) {
		            	int employeeCount = SalaryDB.getEmployeeCount();
						request.setAttribute("employeeCount", employeeCount);
		                request.setAttribute("message", "Deduction calculated and saved successfully");
		                RequestDispatcher dis = request.getRequestDispatcher("Dashboard.jsp");
		                dis.forward(request, response);
		            } else {
		                request.setAttribute("errorMessage", "Failed to calculate and save deduction");
		                RequestDispatcher dis = request.getRequestDispatcher("deduction.jsp");
		                dis.forward(request, response);
		            }
		        } catch (NumberFormatException e) {
		            request.setAttribute("errorMessage", "Invalid number format. Please enter valid numbers.");
		            RequestDispatcher dis = request.getRequestDispatcher("deduction.jsp");
		            dis.forward(request, response);
		        } catch (IllegalArgumentException e) {
		            request.setAttribute("errorMessage", e.getMessage());
		            RequestDispatcher dis = request.getRequestDispatcher("deduction.jsp");
		            dis.forward(request, response);
		        } catch (Exception e) {
		            e.printStackTrace();
		            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
		            RequestDispatcher dis = request.getRequestDispatcher("deduction.jsp");
		            dis.forward(request, response);
		        }
		    }
	}


