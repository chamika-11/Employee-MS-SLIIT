<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personal Info - Financial Management System</title>
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


<%
    	String EmpID = request.getParameter("EmpID");
    	String EmpName = request.getParameter("EmpName");
    	String DOB = request.getParameter("DOB");
    	String Gender = request.getParameter("Gender");
    	String Email = request.getParameter("Email");
    	String ContactParam = request.getParameter("Contact");
    	int Contact = (ContactParam != null && !ContactParam.isEmpty()) ? Integer.parseInt(ContactParam) : 0;
    	String Department = request.getParameter("Department");
    	String Position = request.getParameter("Position");
    	String Address_L1 = request.getParameter("Address_L1");
    	String Address_L2 = request.getParameter("Address_L2");
    	String Username = request.getParameter("Username");
    	String Password = request.getParameter("Password");
    	
        

    
    %>
    <div class="header">
        <h1>Employee Management System</h1>
        <div class="user-info">
            <span>Manager01 (E12345)</span>
            <div class="profile-avatar" style="width: 40px; height: 40px; font-size: 20px;">M</div>
        </div>
    </div>

    <div class="container">
        <div class="sidebar">
            <a href="dashboard.html">📊 Dashboard</a>
            <a href="personalinfo.html" style="background: #34495e;">👤 Personal Info</a>
            <a href="reports.html">📑 Reports</a>
            <a href="addsalary.html">💰 Add Salary</a>
            <a href="viewsalary.html">👥 View Salary</a>
            <a href="settings.html">⚙️ Settings</a>
        </div>

        <div class="main-content">
            <div class="profile-header">
                <div class="profile-avatar">M</div>
                <div class="profile-details">
                    <h2>Michael Anderson</h2>
                    <p>Financial Manager</p>
                    <p>Employee ID: E12345</p>
                    <p>Department: Finance</p>
                    <div class="status-badge">Active Employee</div>
                </div>
            </div>

            <div class="tabs">
                <div class="tab active">Personal Details</div>
                
            </div>

            <div class="info-section">
                <h3>Personal Information</h3>
                <form action="Updatelogin" method="post">
                    <div class="info-grid">
                        <div class="form-group">
                            <label for="EmpID">Employee ID</label>
                            <input type="text" name="EmpID" value="<%= EmpID %>" readonly>
                        </div>
                        <div class="form-group">
                                <label for="EmpName">Employee Name</label>
    							<input type="text" name="EmpName" value="<%= EmpName %>">
                        </div>
                        <div class="form-group">
                            <label for="DOB">Date of Birth</label>
                            <input type="text" name="DOB" value="<%= DOB%>">
                        </div>
                        <div class="form-group">
                            <label for="Gender">Gender</label>
                            <input type="text" name="Gender" value="<%=Gender %>" />
                        </div>
                        <div class="form-group">
                            <label for="Email">Email</label>
                            <input type="email" name="Email" value="<%=Email %>" />
                        </div>
                        <div class="form-group">
                            <label for="Contact">Phone Number</label>
                            <input type="text"  name="Contact" value="<%=Contact %>" />
                        </div>
                        <div class="form-group">
                            <label for="Department">Department</label>
                            <input type="text" name="Department" value="<%=Department %>" readonly />
                        </div>
                        <div class="form-group">
                            <label for="Position">Position</label>
                            <input type="text"  name="Position" value="<%=Position %>" readonly />
                        </div>
                        <div class="form-group">
                            <label for="Username">Username</label>
                            <input type="text"  name="Username" value="<%=Username%>" />
                        </div>
                        <div class="form-group">
                            <label for="Password">Password</label>
                            <input type="text"  name="Password" value="<%=Password %>" />
                        </div>
                    </div>

                    <div class="info-section">
                        <h3>Address Information</h3>
                        <div class="info-grid">
                            <div class="form-group">
                                <label for="Address_L1">Street Address</label>
                                <input type="text" name="Address_L1" value="<%=Address_L1 %>" />
                            </div>
                            <div class="form-group">
                                <label for="Address_L2">City</label>
                                <input type="text" name="Address_L2" value="<%=Address_L2 %>" />
                            </div>
                        </div>
                    </div>

                    <div class="action-buttons">
                         <input type="submit" name="submit" value="Save" class= "btn btn-primary">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2024 FinancePro Management System. All rights reserved.</p>
    </div>
</body>
</html>