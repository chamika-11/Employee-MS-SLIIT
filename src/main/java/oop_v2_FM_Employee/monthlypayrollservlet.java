package oop_v2_FM_Employee;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/monthlypayrollservlet")
public class monthlypayrollservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String EmpID = request.getParameter("EmpID");
		        
		        try {
		            payroll payDetails = SalaryDB.getpayrollDetails(EmpID);
		            if (payDetails != null) {
		                request.setAttribute("payDetails", payDetails);
		            } else {
		                request.setAttribute("errorMessage", "Employee not found");
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		            request.setAttribute("errorMessage", "An error occurred while retrieving employee details");
		        }
		        
		        RequestDispatcher dis = request.getRequestDispatcher("navigatepage.jsp");
		        dis.forward(request, response);
		    }
	}


