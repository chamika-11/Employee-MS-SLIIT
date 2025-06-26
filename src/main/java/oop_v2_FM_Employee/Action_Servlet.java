package oop_v2_FM_Employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ActionServlet")
public class ActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();//create a PrintWriter object to send text output to the client
		response.setContentType("text/html");//set the content type of the response to HTML format
		
		String EmpID = request.getParameter("uid");
		boolean isTrue;
		
		isTrue = Emp_DbUtil.scan(EmpID);
		
		if (isTrue == true) {
			List<Employee> empDetails = Emp_DbUtil.getEmployeeDetails(EmpID); 
			//fetch the employee details from the database using the  Employee ID
			request.setAttribute("empDetails", empDetails);  
			//attach the fetched employee details to the request object, making it accessible in the JSP
			
			RequestDispatcher dis = request.getRequestDispatcher("ActionInterface.jsp");  
			//forward the request and response objects to the specified JSP page 

			dis.forward(request, response);
			//forwards the current request and response objects
		} else {
			out.println("<script type='text/javascript'>");
			out.println("alert('The EmpID you entered is incorrect');");
			out.println("history.back();");
			out.println("</script>");
		}
	}

}
