package oop_v2_FM_Employee;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/A_AllProjectDetails")
public class A_AllProjectDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	    	
	    	
	    	List<A_Project> projDetails = A_ProjectDBUtil.getAllEmployeeDetails();
			request.setAttribute("projDetails", projDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("A_ManegerHome.jsp");
			dis.forward(request, response);
	    }
	    
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    	doGet(request, response);
	    	
	    }
		
	}


