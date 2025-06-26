package oop_v2_FM_Employee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ProjectInsert")
public class ProjectInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String projectID = request.getParameter("pid");
		String projectName = request.getParameter("name");
		String description = request.getParameter("description");
		String clientName = request.getParameter("client");
		String deadline = request.getParameter("deadline");
		String status = request.getParameter("status");
		String username = request.getParameter("uid");
		String password = request.getParameter("psw");
		
		boolean isTrue;
		
		isTrue = ProjectDBUtil.insertproject(projectID, projectName, description, clientName, deadline, status, username, password);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("success.jsp");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
		
	}

}
