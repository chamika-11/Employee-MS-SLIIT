<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %> 
<%@ page import="oop_v2_FM_Employee.employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management System</title>
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
            background-color: #1E2328;
            color: #ffffff;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background-color: #1E2328;
            color: #FFFF00;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
            background-color: #FFFF00;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #1E2328;
            font-weight: bold;
        }

        .container {
            display: flex;
            min-height: calc(100vh - 70px);
        }

        .sidebar {
            width: 250px;
            background-color: #1E2328;
            color: white;
            padding: 20px;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            overflow-y: auto;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
        }

        .sidebar a {
            color: #FFFF00;
            text-decoration: none;
            padding: 12px 15px;
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #FFFF00;
            color: #1E2328;
            transform: translateX(5px);
        }

        .main-content {
            flex: 1;
            padding: 20px;
            padding-right: 370px; /* Added right padding to make room for right section */
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .announcement-section {
            background-color: #2C3036;
            border-radius: 10px;
            padding: 20px;
            width: 100%;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .announcement-section h2 {
            font-size: 22px;
            margin-bottom: 10px;
            color: #FFFF00;
        }

        .announcement {
            background-color: #3A3F47;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 15px;
            color: #ffffff;
        }

        .announcement p {
            margin: 0;
            font-size: 16px;
        }

        .right-section {
            position: fixed;
            top: 70px;
            right: 0;
            width: 335px;
            padding: 20px;
            height: calc(100vh - 70px);
            overflow-y: auto;
            background: #ffffff;
            box-shadow: -2px 0 5px rgba(0, 0, 0, 0.2);
        }

        .calendar-section {
            background: #ffffff;
            padding: 18px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
            color: #FFFF00;
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
            color: #000000;
        }

        .calendar-date {
            text-align: center;
            padding: 8px;
            cursor: pointer;
            border-radius: 50%;
            color: #000000;
            background-color: #f0f2f5;
        }

        .calendar-date:hover {
            background: #FFFF00;
            color: #1E2328;
        }

        .calendar-date.current {
            background-color: #FFFF00;
            color: #1E2328;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="company-name">
            <h1>IFS</h1>
        </div>
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
    <div class="container">
        <div class="sidebar">
            <a href="C_EmployeeHome.jsp">Dashboard</a>
            <a href="C_User2.jsp"> Personal Info</a>
            <a href="C_LeaveApplicationForm.jsp"> Apply For Leave</a>
            <a href="C_ViewApplicationForm.jsp"> View Leave</a>
            <a href="C_Feedback.jsp">Give Feedback</a>
        </div>

        <div class="main-content">
            <!-- Notification and Announcement Section -->
            <div class="announcement-section">
                <h2>Notifications & Announcements</h2>
                <div class="announcement">
                    <p><strong>System Maintenance:</strong> The system will undergo scheduled maintenance on <strong>October 25, 2024</strong> from 10:00 PM to 12:00 AM.</p>
                </div>
                <div class="announcement">
                    <p><strong>New Features:</strong> We’ve added new payroll features that will make salary management easier. Check out the <strong>Reports</strong> section for more details.</p>
                </div>
                <div class="announcement">
                    <p><strong>Holiday Announcement:</strong> The office will be closed on <strong>November 1, 2024</strong> in observance of a public holiday.</p>
                </div>
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

    <script>
        let currentDate = moment();

        function renderCalendar() {
            const monthStart = moment(currentDate).startOf('month');
            const monthEnd = moment(currentDate).endOf('month');
            const startDate = moment(monthStart).startOf('
