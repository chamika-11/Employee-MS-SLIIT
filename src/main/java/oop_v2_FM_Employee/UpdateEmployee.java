package oop_v2_FM_Employee;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Update_Employee")
public class UpdateEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String EmpId = request.getParameter("EmpID");
		String EmpName = request.getParameter("EmpName");
		Date DOB = Date.valueOf("2003-10-10");
		String Gender = request.getParameter("Gender");
		String Email = request.getParameter("Email");
		int Contact = Integer.parseInt(request.getParameter("Contact"));
		String Department = request.getParameter("Department");
		String Position = request.getParameter("Position");
		String Address_L1 = request.getParameter("Address_L1");
		String Address_L2 = request.getParameter("Address_L2");
		String Username = request.getParameter("Username");
		String Password = request.getParameter("Password");
		

		
		
		
		
		boolean isTrue;
		
		isTrue = Emp_DbUtil.updateEmployee(EmpId, EmpName, DOB, Gender, Email, Contact, Department, Position, Address_L1, Address_L2, Username, Password);
		
		if(isTrue == true) {
			List<Employee> empDetails = Emp_DbUtil.getAllEmployeeDetails();
			request.setAttribute("empDetails",empDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("AdminInterface.jsp");
			dis.forward(request, response);
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("Unsuccess.jsp");
			dis2.forward(request, response);
		}
		
	}

}
