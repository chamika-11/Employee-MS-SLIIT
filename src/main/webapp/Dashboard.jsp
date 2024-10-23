<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %> 
    
    
<%@ page import="oop_v2_FM_Employee.employee" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Financial Manager Dashboard</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f2f5;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background-color: #2c3e50;
            color: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .header .company-name h1 {
            font-size: 24px;
            font-weight: 600;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            background-color: #34495e;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
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
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: 3fr 1fr;
            gap: 20px;
            width: 100%;
        }

        .stats-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-bottom: 20px;
        }

        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .stat-card h3 {
            color: #7f8c8d;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .stat-card .value {
            font-size: 24px;
            font-weight: bold;
            color: #2c3e50;
        }

        .chart-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .calendar-section {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .calendar {
            width: 100%;
        }

        .calendar-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .calendar-header button {
            background: none;
            border: none;
            font-size: 18px;
            cursor: pointer;
            color: #2c3e50;
        }

        .calendar-grid {
            display: grid;
            grid-template-columns: repeat(7, 1fr);
            gap: 5px;
        }

        .calendar-day {
            text-align: center;
            padding: 5px;
            font-weight: bold;
            color: #7f8c8d;
        }

        .calendar-date {
            text-align: center;
            padding: 8px;
            cursor: pointer;
            border-radius: 50%;
        }

        .calendar-date:hover {
            background: #f0f2f5;
        }

        .calendar-date.current {
            background: #2c3e50;
            color: white;
        }

        .recent-activities {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            margin-top: 20px;
        }

        .activity-item {
            padding: 10px 0;
            border-bottom: 1px solid #ecf0f1;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .activity-dot {
            width: 10px;
            height: 10px;
            background-color: #3498db;
            border-radius: 50%;
        }

        .footer {
            text-align: center;
            padding: 20px;
            background-color: #2c3e50;
            color: white;
        }

        .employee-table {
            width: 100%;
            margin-top: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .employee-table table {
            width: 100%;
            border-collapse: collapse;
        }

        .employee-table th {
            background-color: #f8f9fa;
            padding: 12px;
            text-align: left;
            color: #2c3e50;
        }

        .employee-table td {
            padding: 12px;
            border-top: 1px solid #ecf0f1;
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: 500;
        }

        .status-paid {
            background-color: #e8f5e9;
            color: #2e7d32;
        }

        .status-pending {
            background-color: #fff3e0;
            color: #ef6c00;
        }
        
          .btn {
            padding: 12px 25px;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            background-color: #3498db;
            color: white;
        }
        
        
        input {
			  width: 100%;
			  padding: 10px;
			  margin: 10px 0;
			  border: 1px solid #ccc;
			  border-radius: 4px;
			  font-size: 16px;
			  box-sizing: border-box;
			}
			
			input:focus {
			  border-color: #4CAF50;
			  outline: none;
			  box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
			}
        .enter{
        	margin-bottom: 20px;
        }
         .enter input,
        .enter select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
            
        }

        .enter input:focus,
        .enter select:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
        }
        
    </style>
</head>
<body>
    <div class="header">
        <div class="company-name">
            <h1>Employee Management System</h1>
        </div>
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
            <h3>Navigation</h3>
            <a href="Dashboard.jsp">Dashboard</a>
            <c:forEach var="emp" items="${sessionScope.empDetails}">
            <a href="<c:url value="User.jsp">
		      		<c:param name="EmpID" value="${EmpID }" />
		      		<c:param name="EmpName" value="${EmpName}"/>
		      		<c:param name="DOB" value="${DOB}"/>
		      		<c:param name="Gender" value="${Gender}"/>
		      		<c:param name="Email" value="${Email}"/>
		      		<c:param name="Contact" value="${Contact}"/>
		      		<c:param name="Department" value="${Department}"/>
		      		<c:param name="Position" value="${Position}"/>
		      	    <c:param name="Address_L1" value="${Address_L1}"/>
		      		<c:param name="Address_L2" value="${Address_L2}"/>
		      		<c:param name="Username" value="${Username}"/>
		      		<c:param name="Password" value="${Password}"/>
		      		</c:url>">
            
             Personal Info</a>
            </c:forEach>
            
            <a href="Salaryinsert.jsp"> Add Salary</a>
            <a href="SalaryServlet"> View Salary</a>
            
        </div>
        <div class="main-content">
            <div class="dashboard-grid">
                <div class="left-section">
                    <div class="stats-container">
                        <div class="stat-card">
                            <h3>Total Employees</h3>
                            <div class="value"> ${employeeCount}</div>
                           
                        </div>
                        
                    </div>
                    
                    
                    <div class="recent-activities">
					    <h3>Calculate Monthly Bonus</h3><br><br>
					    
					    <form action="monthlypayrollservlet" method="post">
					        <input type="text" name="EmpID" placeholder="Enter employee ID" class="enter"><br>
					        <input type="submit" value="Enter" class="btn">
					    </form>
					    
					    <br><br>
					    
					      <h3>Calculate Monthly Deduction</h3><br><br>
					    
					    <form action="monthlydeductionservlet" method="post">
					        <input type="text" name="EmpID" placeholder="Enter employee ID" class="enter"><br>
					        <input type="submit" value="Enter" class="btn">
					    </form>
					</div>

                   
                </div>
                
                <div class="right-section">
                    <div class="calendar-section">
                        <div class="calendar">
                            <div class="calendar-header">
                                <button id="prevMonth">&lt;</button>
                                <h3 id="currentMonth">October 2024</h3>
                                <button id="nextMonth">&gt;</button>
                            </div>
                            <div class="calendar-grid" id="calendarDays">
                                <div class="calendar-day">S</div>
                                <div class="calendar-day">M</div>
                                <div class="calendar-day">T</div>
                                <div class="calendar-day">W</div>
                                <div class="calendar-day">T</div>
                                <div class="calendar-day">F</div>
                                <div class="calendar-day">S</div>
                            </div>
                            <div class="calendar-grid" id="calendarDates"></div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    
    <div class="footer">
       
    </div>

    <script>
        // Calendar functionality
        let currentDate = moment();

        function renderCalendar() {
            const monthStart = moment(currentDate).startOf('month');
            const monthEnd = moment(currentDate).endOf('month');
            const startDate = moment(monthStart).startOf('week');
            const endDate = moment(monthEnd).endOf('week');

            document.getElementById('currentMonth').textContent = currentDate.format('MMMM YYYY');
            
            const calendarDates = document.getElementById('calendarDates');
            calendarDates.innerHTML = '';

            let date = moment(startDate);
            while (date.isBefore(endDate)) {
                const dateDiv = document.createElement('div');
                dateDiv.className = 'calendar-date';
                if (date.isSame(moment(), 'day')) {
                    dateDiv.classList.add('current');
                }
                dateDiv.textContent = date.date();
                calendarDates.appendChild(dateDiv);
                date.add(1, 'day');
            }
        }

        document.getElementById('prevMonth').addEventListener('click', () => {
            currentDate.subtract(1, 'month');
            renderCalendar();
        });

        document.getElementById('nextMonth').addEventListener('click', () => {
            currentDate.add(1, 'month');
            renderCalendar();
        });

        // Initialize Chart.js
        const ctx = document.getElementById('salaryChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Engineering', 'Marketing', 'Sales', 'HR', 'Finance', 'Operations'],
                datasets: [{
                    label: 'Average Salary by Department',
                    data: [75000, 65000, 70000, 55000, 80000, 60000],
                    backgroundColor: '#34495e',
                    borderColor: '#2c3e50',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            callback: function(value) {
                                return '$' + value.toLocaleString();
                            }
                        }
                    }
                }
            }
        });

        // Initial render
        renderCalendar();
    </script>
</body>
</html>

Version 2 of 2