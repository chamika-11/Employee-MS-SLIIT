package oop_v2_FM_Employee;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Viewmoreservlet")
public class Viewmoreservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String EmpID = request.getParameter("EmpID");
			
	
			try {
				List<employee> EmpDetails = SalaryDB.getLoginDetails(EmpID);
				request.setAttribute("EmpDetails",EmpDetails);
			}
			catch(Exception e) {
				e.printStackTrace();
			}
				
				RequestDispatcher dis = request.getRequestDispatcher("Viewmore.jsp");
				dis.forward(request, response);

	}
}
