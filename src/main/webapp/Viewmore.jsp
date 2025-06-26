<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="oop_v2_FM_Employee.Employee" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Employee Details - Financial Management System</title>
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
        }

        .profile-header {
            background: white;
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 30px;
            display: flex;
            gap: 30px;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .profile-avatar {
            width: 120px;
            height: 120px;
            background: #3498db;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 48px;
            color: white;
            font-weight: bold;
        }

        .profile-details h2 {
            color: #2c3e50;
            margin-bottom: 5px;
        }

        .profile-details p {
            color: #7f8c8d;
            margin-bottom: 3px;
        }

        .status-badge {
            display: inline-block;
            padding: 5px 15px;
            background: #e8f5e9;
            color: #2e7d32;
            border-radius: 15px;
            font-size: 14px;
            margin-top: 10px;
        }

        .tabs {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }

        .tab {
            padding: 10px 20px;
            cursor: pointer;
            border-bottom: 3px solid transparent;
            color: #7f8c8d;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .tab.active {
            color: #2c3e50;
            border-bottom-color: #3498db;
        }

        .info-section {
            background: white;
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .info-section h3 {
            color: #2c3e50;
            margin-bottom: 20px;
            font-size: 18px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 30px;
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

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
        }

        .form-group input[readonly] {
            background-color: #f8f9fa;
            cursor: not-allowed;
        }

        .action-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 30px;
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

        .quick-stats {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .stat-card h4 {
            color: #7f8c8d;
            margin-bottom: 10px;
            font-size: 14px;
        }

        .stat-card .value {
            color: #2c3e50;
            font-size: 24px;
            font-weight: bold;
        }

        .footer {
            background: #2c3e50;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: auto;
        }
    </style>
</head>
<body>


	
    <div class="header">
        <h1>Employee Management System</h1>
       <div class="user-info">
    <div class="user-details">
        <%
            
            List<Employee> empDetails = (List<Employee>) session.getAttribute("empDetails");
            
          
            if (empDetails != null && !empDetails.isEmpty()) {
                Employee emp = empDetails.get(0); 
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
            <a href="User.jsp" > Personal Info</a>
            
            <a href="Salaryinsert.jsp"> Add Salary</a>
            <a href="SalaryRead.jsp" style="background: #34495e;">View Salary</a>
          
        </div>

        
           <div class="main-content">
          
                

            <div class="tabs">
                <div class="tab active">Personal Details</div>
                
            </div>

            <div class="info-section">
                <h3>Personal Information</h3>
                <form>
             
                
                <%
	    // Get the SalaryDetails list from the request attribute
	    List<Employee> EmployeeDetails = (List<Employee>) request.getAttribute("EmpDetails");
	    
	    if (EmployeeDetails != null && !EmployeeDetails.isEmpty()) {
	    	
	    	
	        // Loop through the salaryDetails list
	        for (int i = 0; i < EmployeeDetails.size(); i++) {
	        	 Employee emp = EmployeeDetails.get(i); 
	        	
	%>
	
				<c:set var="EmpID" value="<%=emp.getEmpID() %>"/>
				<c:set var="EmpName" value="<%=emp.getEmpName() %>"/>
				<c:set var="DOB" value="<%=emp.getDOB() %>"/>
				<c:set var="Gender" value="<%=emp.getGender() %>"/>
				<c:set var="Email" value="<%=emp.getEmail() %>"/>
				<c:set var="Contact" value="<%=emp.getContact() %>"/>
				<c:set var="Department" value="<%=emp.getDepartment() %>"/>
				<c:set var="Position" value="<%=emp.getPosition() %>"/>
			    <c:set var="Address_L1" value="<%=emp.getAddress_L1() %>"/>
				<c:set var="Address_L2" value="<%=emp.getAddress_L2() %>"/>
				<c:set var="Username" value="<%=emp.getUsername() %>"/>
				<c:set var="Password" value="<%=emp.getPassword() %>"/>
				
				
				
                    <div class="info-grid">
                        <div class="form-group">
                            <label>Employee ID</label>
                            <input type="text" value="<%= emp.getEmpID() %>"  readonly/>
                        </div>
                        <div class="form-group">
                            <label>Employee Name</label>
                            <input type="text" value="<%= emp.getEmpName() %>" readonly />
                        </div>
                        <div class="form-group">
                            <label>Date of Birth</label>
                            <input type="date" value="<%= emp.getDOB() %>"  readonly/>
                        </div>
                        <div class="form-group">
                            <label>Gender</label>
                            <input type="text" value="<%= emp.getGender() %>" readonly />
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" value="<%= emp.getEmail() %>"  readonly/>
                        </div>
                        <div class="form-group">
                            <label>Phone Number</label>
                            <input type="tel" value="<%= emp.getContact() %>"  readonly/>
                        </div>
                        <div class="form-group">
                            <label>Department</label>
                            <input type="text" value="<%= emp.getDepartment() %>" readonly />
                        </div>
                        <div class="form-group">
                            <label>Position</label>
                            <input type="text" value="<%= emp.getPosition() %>" readonly />
                        </div>
                    </div>

                    <div class="info-section">
                        <h3>Address Information</h3>
                        <div class="info-grid">
                            <div class="form-group">
                                <label>Street Address</label>
                                <input type="text" value="<%= emp.getAddress_L1() %>" readonly />
                            </div>
                            <div class="form-group">
                                <label>City</label>
                                <input type="text" value="<%= emp.getAddress_L2() %>"  readonly/>
                            </div>
                        </div>
                    </div>
                     <div class="action-buttons">
                     		<form action="Dashboard.jsp"  method="post">
                    		<button type="submit" class="btn btn-primary">Back</button>
                    		</form>
                       </div>
		      		
		      		        <%
	        }
	    } else {
	%>
	        <tr>
	            <td colspan="2">No Employee details available.</td>
	        </tr>
	<%
	    }
	%>
				
                </form>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>.</p>
    </div>
</body>
</html>