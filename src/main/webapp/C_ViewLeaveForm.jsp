<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Leave Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #1E2328;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
        color: #e0e0e0;
    }
    .form-container {
        background-color: #2A2F36;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        width: 90%;
        max-width: 1200px;
        padding: 20px;
        border-left: 4px solid #FFFF00;
    }
    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #FFFF00;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        background-color: #1E2328;
    }
    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #FFFF00;
    }
    th {
        background-color: #FFFF00;
        color: #1E2328;
    }
    tr:hover {
        background-color: #3A3F48;
    }
    .button-group {
        display: flex;
        justify-content: space-between;
    }
    .button-group a {
        width: 48%;
    }
    .button-group button {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }
    .button-group button:first-child {
        background-color: #FFFF00;
        color: #1E2328;
    }
    .button-group button:first-child:hover {
        background-color: #E6E600;
    }
    .button-group button:last-child {
        background-color: #4A4A4A;
        color: #FFFF00;
    }
    .button-group button:last-child:hover {
        background-color: #3A3A3A;
    }
</style>
</head>
<body>
<%
			String EmpID = request.getParameter("EmpID");

%>

<div class="form-container">
    <h2>Leave Form</h2>

    <table>
        <tr>
            <th>Leave ID</th>
            <th>Employee ID</th>    
            <th>Leave Type</th>    
            <th>Start Date</th>    
            <th>End Date</th>    
            <th>Reason</th>
            <th>Approval Status</th>   
            <th>Action</th>         
        </tr>
        
        <c:forEach var="employ" items="${allEmployee}">
        <tr>
            <td>${employ.leave_id}</td>
            <td>${employ.employee_id}</td>
            <td>${employ.leave_type}</td>
            <td>${employ.start_date}</td>
            <td>${employ.end_date}</td>
            <td>${employ.reason}</td>
            <td>${employ.approval_status}</td>  
            
            <td class="button-group">
                <a href="C_UpdateLeaveForm.jsp?leave_id=${employ.leave_id}&leave_type=${employ.leave_type}&start_date=${employ.start_date}&end_date=${employ.end_date}&reason=${employ.reason}">
                    <button>Update</button>
                </a>
                <a href="C_DeleteLeaveServlet?leave_id=${employ.leave_id}">
                    <button>Delete</button>
                </a>
            </td>
        </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>