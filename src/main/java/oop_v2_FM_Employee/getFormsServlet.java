package oop_v2_FM_Employee;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/getFormsServlet")
public class getFormsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the empID from the query parameters
        String empID = request.getParameter("employee_id");
        doPost(request,response);
    }
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String empID=request.getParameter("employee_id");
		
		List<EmployeeModel> allEmployee = EmployeeController.getAllEmployee(empID);
		request.setAttribute("allEmployee", allEmployee);
		
		
		System.out.println(allEmployee);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ViewLeaveForm.jsp");
		dispatcher.forward(request,response);
	}

}
