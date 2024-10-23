package oop_v2_FM_Employee;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class B_All_Employee_Details_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	
    	List<B_Employee> empDetails = B_Emp_DbUtil.getAllEmployeeDetails();
		request.setAttribute("empDetails", empDetails);
		
		RequestDispatcher dis = request.getRequestDispatcher("B_Admin_Interface.jsp");
		dis.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	doGet(request, response);
    	
    }
    

}
