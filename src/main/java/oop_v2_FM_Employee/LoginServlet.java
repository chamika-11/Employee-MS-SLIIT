package oop_v2_FM_Employee;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
        HttpSession session = request.getSession();
		
		try {
			List<Employee> empDetails = SalaryDB.validatelogin(username,password);
			if (empDetails != null && !empDetails.isEmpty()) {
	            Employee emp = empDetails.get(0); 
	            String Position = emp.getPosition();
			session.setAttribute("empDetails",empDetails);
			
			if (Position.equalsIgnoreCase("Finance_Manager")) {
				int employeeCount = SalaryDB.getEmployeeCount();
				request.setAttribute("employeeCount", employeeCount);
				RequestDispatcher log = request.getRequestDispatcher("Dashboard.jsp");
				log.forward(request, response);
            } else if (Position.equalsIgnoreCase("Admin")) {
            	RequestDispatcher dis = request.getRequestDispatcher("B_Login_Srevlet");
        		dis.forward(request, response);
            } else if (Position.equalsIgnoreCase("Employee")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("C_EmployeeHome.jsp");
                dispatcher.forward(request, response);
            }  else if (Position.equalsIgnoreCase("Manager")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("AllProjectDetails");
                dispatcher.forward(request, response);
            }
            
            else {
            	request.setAttribute("errorMessage", "The EmpID you entered is incorrect");
            	RequestDispatcher dispatcher = request.getRequestDispatcher("GeneralDashboard.jsp");
            	dispatcher.forward(request, response);

            }
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		

	
		
	}
		
	}


