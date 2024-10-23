<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="oop_v2_FM_Employee.Salary" %>
<%@ page import="oop_v2_FM_Employee.payroll" %>
 <%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %> 
    
    
<%@ page import="oop_v2_FM_Employee.employee" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Deduction Salary - Financial Management System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f0f2f5;
        }

        .header {
            background-color: #2c3e50;
            padding: 15px 30px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .header h1 {
            font-size: 24px;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .container {
            display: flex;
            min-height: calc(100vh - 70px);
        }

        .sidebar {
            width: 250px;
            background: #2c3e50;
            color: white;
            padding: 20px;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 12px 15px;
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #34495e;
            transform: translateX(5px);
        }

        .main-content {
            flex: 1;
            padding: 30px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .page-title {
            margin-bottom: 30px;
            color: #2c3e50;
        }

        .salary-form {
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .form-section {
            margin-bottom: 30px;
        }

        .form-section-title {
            color: #2c3e50;
            font-size: 18px;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #f0f2f5;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #2c3e50;
            font-weight: 500;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
        }

        .calculation-summary {
            background: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-top: 30px;
        }

        .summary-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .summary-item {
            text-align: center;
            padding: 15px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }

        .summary-item label {
            color: #7f8c8d;
            font-size: 14px;
            margin-bottom: 5px;
            display: block;
        }

        .summary-item .value {
            color: #2c3e50;
            font-size: 20px;
            font-weight: bold;
        }

        .action-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }

        .btn {
            padding: 12px 25px;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
        }

        .btn-primary {
            background-color: #3498db;
            color: white;
        }

        .btn-secondary {
            background-color: #95a5a6;
            color: white;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .employee-search {
            position: relative;
        }

        .employee-search-results {
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            background: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-top: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            z-index: 1000;
            display: none;
        }

        .employee-search.active .employee-search-results {
            display: block;
        }

        .employee-item {
            padding: 10px 15px;
            border-bottom: 1px solid #eee;
            cursor: pointer;
        }

        .employee-item:hover {
            background: #f8f9fa;
        }

        .employee-item:last-child {
            border-bottom: none;
        }

        .footer {
            background: #2c3e50;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: auto;
        }

        .alert {
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .alert-info {
            background-color: #e1f0fa;
            color: #2c5282;
            border: 1px solid #bee3f8;
        }
    </style>
</head>
<body>

    <%
    	//String EmpID = request.getParameter("EmpID");
    	//Double BasicSalary = Double.parseDouble(request.getParameter("BasicSalary"));
    	//String Department = request.getParameter("Department");
    	//String Position = request.getParameter("Position");

    
    %>
    <div class="header">
        <h1>Add Deduction Salary </h1>
        <div class="user-info">
    <div class="user-details">
        <%
            
            List<employee> empDetails = (List<employee>) session.getAttribute("empDetails");
            
          
            if (empDetails != null && !empDetails.isEmpty()) {
                employee emp = empDetails.get(0); 
        %>
                <p><%= emp.getEmpName() %> (<%= emp.getEmpID() %>)</p>
        <%
            } else {
        %>
                <p>No user info available</p>
        <%
            }
        %>
    </div>
</div>
    </div>

    <div class="container">
       <div class="sidebar">
            <a href="Dashboard.jsp"> Dashboard</a>
            <a href="User.jsp"> Personal Info</a>
            <a href="Salaryinsert.jsp" style="background: #34495e;"> Add Salary</a>
            <a href="SalaryRead.jsp"> View Salary</a>
            
        </div>

        <div class="main-content">
            <h2 class="page-title">Add New Salary Record</h2>

            <div class="alert alert-info">
                <span>ℹ️</span>
                <div>
                    <strong>Note:</strong> Please ensure all salary information is accurate before submission.
                    Changes will require approval from HR department.
                </div>
            </div>

            <form class="salary-form" action="calculatedeductionservlet" method="post">
	              <div class="form-section">
				    <h3 class="form-section-title">Employee Information</h3>
				    <div class="form-grid">
				        <div class="form-group employee-search">
				            <label>Employee ID</label>
				            <input type="text" name="EmpID" value="${payDetails.empID}" readonly />
				        </div>
				        <div class="form-group">
				            <label>Department</label>
				            <input type="text" name="Department" value="${payDetails.department}" readonly />
				        </div>
				        <div class="form-group">
				            <label>Position</label>
				            <input type="text" name="Position" value="${payDetails.position}" readonly />
				        </div>
				        <div class="form-group">
				            <label>Basic Salary</label>
				            <input type="text" name="BasicSalary" value="${payDetails.basicSalary}" readonly />
				        </div>
				        <div class="form-group">
				            <label>Month</label>
				            <input type="month" />
				        </div>
				    </div>
				</div>

				<c:if test="${not empty errorMessage}">
				    <div class="error-message">
				        ${errorMessage}
				    </div>
				</c:if>

					               <div class="form-section">
					        <h3 class="form-section-title">Deductions</h3>
					        <div class="form-grid">
					            <div class="form-group">
					                <label>Tax Deduction</label>
					                <input type="number" name="Tax" placeholder="Enter tax deduction" required step="0.01" />
					            </div>
					            <div class="form-group">
					                <label>Insurance Premium</label>
					                <input type="number" name="Insurance" placeholder="Enter insurance premium" required step="0.01" />
					            </div>
					            <div class="form-group">
					                <label>Loan Repayment</label>
					                <input type="number" name="Loan" placeholder="Enter loan repayment amount" required step="0.01" />
					            </div>
					            <div class="form-group">
					                <label>Other Deductions</label>
					                <input type="number" name="Other" placeholder="Enter other deductions" required />
					            </div>
					        </div>
					        <div class="action-buttons">
					            <input type="submit" value="Calculate and Save" class="btn btn-primary">
					        </div>
					    </div>
					</form>

          
            </form>
        </div>
    </div>

    <div class="footer">
       
    </div>

   
</body>
</html>
