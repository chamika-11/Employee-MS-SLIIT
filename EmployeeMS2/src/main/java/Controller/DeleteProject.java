package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/DeleteProject")
public class DeleteProject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String projectID = request.getParameter("pid");
		boolean isTrue;
		
		isTrue = ProjectDBUtil.deleteProject(projectID);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("success.jsp");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
			dis2.forward(request, response);
		}
	
		
	}

}
