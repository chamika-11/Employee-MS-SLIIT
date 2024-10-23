package oop_v2_FM_Employee;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/calculatebonusservlet")
public class calculatebonusservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 try {
	            String EmpID = request.getParameter("EmpID"); // Changed from "EmpId" to "EmpID"
	            double HAllowance = Double.parseDouble(request.getParameter("HAllowance"));
	            double TAllowance = Double.parseDouble(request.getParameter("TAllowance"));
	            double PBonus = Double.parseDouble(request.getParameter("PBonus"));
	            int OThours = Integer.parseInt(request.getParameter("OThours"));

	            boolean isTrue = SalaryDB.calculateBonus(EmpID, HAllowance, TAllowance, PBonus, OThours);

	            if (isTrue) {
	            	int employeeCount = SalaryDB.getEmployeeCount();
					request.setAttribute("employeeCount", employeeCount);
	                RequestDispatcher dis = request.getRequestDispatcher("Dashboard.jsp");
	                dis.forward(request, response);
	            } else {
	                request.setAttribute("errorMessage", "Failed to calculate and save bonus");
	                RequestDispatcher dis2 = request.getRequestDispatcher("navigatepage.jsp");
	                dis2.forward(request, response);
	            }
	        } catch (NumberFormatException e) {
	            e.printStackTrace();
	            request.setAttribute("errorMessage", "Invalid number format. Please enter valid numbers.");
	            RequestDispatcher dis2 = request.getRequestDispatcher("navigatepage.jsp");
	            dis2.forward(request, response);
	        } catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("errorMessage", "An unexpected error occurred. Please try again.");
	            RequestDispatcher dis2 = request.getRequestDispatcher("navigatepage.jsp");
	            dis2.forward(request, response);
	        }
	    }
}

