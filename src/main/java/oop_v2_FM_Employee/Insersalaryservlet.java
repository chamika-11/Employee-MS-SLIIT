package oop_v2_FM_Employee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Insersalaryservlet")
public class Insersalaryservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String EmpID = request.getParameter("EmpID");
		Double BasicSalary = Double.parseDouble(request.getParameter("BasicSalary"));
		Double OTRate = Double.parseDouble(request.getParameter("OTRate"));
		Double DeductionRate = Double.parseDouble(request.getParameter("DeductionRate"));
		
		
		
		boolean isTrue;
		
		isTrue = SalaryDB.insertsalary(EmpID,BasicSalary,OTRate,DeductionRate);
		
		if(isTrue == true) {
			String alertMessage ="Salary Insert Successful";
			response.getWriter().println("<script>alert('"+alertMessage+"');  window.location.href='Salary'</script>");
			int employeeCount = SalaryDB.getEmployeeCount();
			request.setAttribute("employeeCount", employeeCount);
			RequestDispatcher dis = request.getRequestDispatcher("Dashboard.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("Unsuccess.jsp");
			dis2.forward(request, response);
		}


	}

}

