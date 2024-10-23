package oop_v2_FM_Employee;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Updatesalaryservlet")
public class Updatesalaryservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
   /* public Updatesalaryservlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}*/

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//doGet(request, response);
		
		String EmpID = request.getParameter("EmpID");
		Double BasicSalary = Double.parseDouble(request.getParameter("BasicSalary"));
		Double OTRate = Double.parseDouble(request.getParameter("OTRate"));
		Double DeductionRate = Double.parseDouble(request.getParameter("DeductionRate"));
		
		
		
		boolean isTrue;
		
		isTrue = SalaryDB.updatesalary(EmpID, BasicSalary, OTRate,DeductionRate);
		
		if(isTrue == true) {
			List<Salary> SalaryDetails = SalaryDB.getSalaryDetails(EmpID);
			request.setAttribute("SalaryDetails",SalaryDetails);
			
			int employeeCount = SalaryDB.getEmployeeCount();
			request.setAttribute("employeeCount", employeeCount);
			
			RequestDispatcher dis = request.getRequestDispatcher("Dashboard.jsp");
			dis.forward(request, response);
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("Unsuccess.jsp");
			dis2.forward(request, response);
		}
		
		
		
	}

}
