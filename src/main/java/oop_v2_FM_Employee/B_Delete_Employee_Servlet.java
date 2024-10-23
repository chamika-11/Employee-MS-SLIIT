package oop_v2_FM_Employee;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/B_Delete_Employee_Servlet")
public class B_Delete_Employee_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String empID = request.getParameter("empID");
		String username = request.getParameter("username");
		boolean isTrue;
		
		isTrue = B_Emp_DbUtil.deleteEmployee(empID);
		
		if (isTrue == true) {
			List<B_Employee> empDetails = B_Emp_DbUtil.getAllEmployeeDetails();
			request.setAttribute("empDetails", empDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("B_Admin_Interface.jsp");
			dis.forward(request, response);
		}
		else {
			
			List<B_Employee> empDetails = B_Emp_DbUtil.getEmployeeDetails(username);
			request.setAttribute("cusDetails", empDetails);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("B_Unsuccess.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
	}

}
