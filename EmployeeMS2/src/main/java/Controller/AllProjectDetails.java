package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AllProjectDetails")
public class AllProjectDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	    	
	    	
	    	List<Project> projDetails = ProjectDBUtil.getAllEmployeeDetails();
			request.setAttribute("projDetails", projDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("ManegerHome.jsp");
			dis.forward(request, response);
	    }
	    
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    	doGet(request, response);
	    	
	    }
		
	}


