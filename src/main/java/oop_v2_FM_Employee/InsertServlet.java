package oop_v2_FM_Employee;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("inside the servlet");
		
		String empID=request.getParameter("employee_id");
		String leave_type=request.getParameter("leave_type");
		Date start_date = Date.valueOf(request.getParameter("start_date"));
		Date end_date = Date.valueOf(request.getParameter("end_date"));
		String reason=request.getParameter("reason");
		String approval_status=request.getParameter("approval_status");
		
		boolean isTrue;
		
		isTrue=C_EmployeeController.inserdata(empID, leave_type, start_date, end_date, reason,approval_status);
		System.out.println(isTrue);
		if(isTrue == true) {
		    String alertMessage = "Data Insert Successful";
		    String EmpID = request.getParameter("employee_id"); 
		    response.getWriter().println(
		        "<script>" +
		        "alert('" + alertMessage + "');" +
		        "window.location.href='C_getFormsServlet?employee_id=" + EmpID + "';" +
		        "</script>");
		    }
		else {
			RequestDispatcher dis2=request.getRequestDispatcher("C_wrong.jsp");
			dis2.forward(request, response);
		}
	}

}
