package oop_v2_FM_Employee;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/C_UpdateServlet")
public class C_UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NumberFormatException {

        String leaveIdStr = request.getParameter("leave_id");
        String employee_id = request.getParameter("employee_id");
        String leave_type = request.getParameter("leave_type");
        String startDateStr = request.getParameter("start_date");
        String endDateStr = request.getParameter("end_date");
        String reason = request.getParameter("reason");

        int leave_id = 0;
        
        Date start_date = null;
        Date end_date = null;

        try {

            if (leaveIdStr != null && !leaveIdStr.isEmpty()) {
                leave_id = Integer.parseInt(leaveIdStr);
            	}
            
            if (startDateStr != null && !startDateStr.isEmpty()) {
                start_date = Date.valueOf(startDateStr);
            		}
            
            if (endDateStr != null && !endDateStr.isEmpty()) {
                end_date = Date.valueOf(endDateStr);
            }
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid data format for Leave ID or Date.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("wrong.jsp");
            dispatcher.forward(request, response);
            return;
        }

        boolean isUpdated = C_EmployeeController.updatedata(leave_id, employee_id, leave_type, start_date, end_date, reason);

        if (isUpdated) {
            
            List<C_EmployeeModel> employeeDetails = C_EmployeeController.getAllEmployee(employee_id);
            request.setAttribute("employeedetails", employeeDetails);

            String alertMessage = "Data update successful!";
            request.setAttribute("successMessage", alertMessage);
            RequestDispatcher dispatcher = request.getRequestDispatcher("C_EmployeeHome.jsp");
            dispatcher.forward(request, response);
        } else {
            
            request.setAttribute("errorMessage", "Data update failed.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("C_wrong.jsp");
            dispatcher.forward(request, response);
        }
    }
}
