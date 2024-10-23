package oop_v2_FM_Employee;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/A_GetAllProject")
public class A_GetAllProject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String PID=request.getParameter("projectID");
		
		List <A_Project> allProject=A_ProjectDBUtil.getProjectDetails(PID);
		request.setAttribute("allProject", allProject);
		
		System.out.println(allProject);
		RequestDispatcher dispatcher=request.getRequestDispatcher("A_ProjectDetails.jsp");
		dispatcher.forward(request,response);
	}

}
