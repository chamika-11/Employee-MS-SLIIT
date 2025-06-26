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

import oop_v2_FM_Employee.C_EmployeeController;


@WebServlet("/FeedInsertServlet")
public class FeedInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("inside the servlet");
		
		String feedID=request.getParameter("feedback");
		
		boolean isTrue;
		
		isTrue=C_FeedbackController.insertFeedData(feedID);
		System.out.println(isTrue);
		if(isTrue==true) {
			String alertMessage="Data Insert Successful";
			response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='C_EmployeeHome.jsp'</script>");
			}
		else {
			RequestDispatcher dis2=request.getRequestDispatcher("C_wrong.jsp");
			dis2.forward(request, response);
		}
	}


}
