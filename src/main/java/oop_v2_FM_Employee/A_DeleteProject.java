package oop_v2_FM_Employee;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/A_DeleteProject")
public class A_DeleteProject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String projectID = request.getParameter("pid");
		boolean isTrue;
		
		isTrue = A_ProjectDBUtil.deleteProject(projectID);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("A_success.jsp");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("A_unsuccess.jsp");
			dis2.forward(request, response);
		}
	
		
	}

}
