package oop_v2_FM_Employee;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/C_DeleteLeaveServlet")
public class C_DeleteLeaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int leave_id = 0;
		String leaveIdStr=request.getParameter("leave_id");
		
		if (leaveIdStr != null && !leaveIdStr.isEmpty()) {
            leave_id = Integer.parseInt(leaveIdStr);
        	}
		boolean isTrue;
		
		System.out.println(leave_id);
		
		isTrue=C_EmployeeController.deletedata(leave_id);
		
		if(isTrue==true) {
			String alertMessage="Data Delete Successful";
			response.getWriter().println("<script>alert('"+alertMessage+"');"+"window.location.href='C_EmployeeHome.jsp';</script>");	
		}
		else {
			List<C_EmployeeModel> employeeDetails=C_EmployeeController.getAllEmployee(leaveIdStr);
			request.setAttribute("employeeDetails", employeeDetails);
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("C_wrong.jsp");
			dispatcher.forward(request, response);
		}
	}


}
