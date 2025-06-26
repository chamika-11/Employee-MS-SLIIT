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
            background-color: #121212;
            color: #ffffff;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background-color: #121212;
            color: #FFFF00;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
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
            padding-top: 70px;
            min-height: calc(100vh - 70px);
        }

        .sidebar {
            width: 250px;
            background-color: #1E2328;
            color: white;
            padding: 20px;
            position: fixed;
            top: 70px;
            left: 0;
            height: calc(100vh - 70px);
            overflow-y: auto;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
        }

        .sidebar a {
            color: #1e90ff;
            text-decoration: none;
            padding: 12px 15px;
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #1e90ff;
            color: #1E2328;
            transform: translateX(5px);
        }

        .main-content {
            flex: 1;
            padding: 20px;
            padding-left: 270px;
            background-color: #2a2f36;
        }

        .input-container {
            background-color: #2a2f36;
            padding: 20px;
            border-radius: 8px;
            color: white;
            width: 100%;
        }

        .input-container h2 {
            margin-bottom: 20px;
        }

        .table-container {
            margin-top: 20px;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #33373b;
        }

        th, td {
            padding: 10px;
            border: 1px solid #4b4f55;
            text-align: left;
        }

        th {
            background-color: #4b4f55;
            color: #1e90ff;
        }

        td {
            color: #fff;
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
            color: #1E2328;
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
            color: #1e90ff;
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
            background: #1e90ff;
            color: #1E2328;
        }

        .calendar-date.current {
            background-color: #1e90ff;
            color: #1E2328;
        }

        /* For input and buttons */
        form input[type="text"], form input[type="submit"] {
            padding: 8px;
            margin: 8px 0;
        }

        form button {
            padding: 8px 16px;
            background-color: #1e90ff;
            border: none;
            cursor: pointer;
        }
        form {
        margin-top: 20px;
    }

    form label {
        display: block;
        margin-bottom: 5px;
        color: #1e90ff;
    }

    form input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #4b4f55;
        border-radius: 4px;
        background-color: #33373b;
        color: #ffffff;
        font-size: 16px;
    }

    form input[type="text"]:focus {
        outline: none;
        border-color: #1e90ff;
        box-shadow: 0 0 0 2px rgba(30, 144, 255, 0.2);
    }
    form input[type="submit"], form button {
        padding: 10px 20px;
        background-color: #1e90ff;
        color: #ffffff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }

    form input[type="submit"]:hover, form button:hover {
        background-color: #1a7ad9;
    }
    </style>
</head>
<body>
    <div class="header">
        <div class="company-name">
            <h1>Manager Dashboard</h1>
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
            <a href="A_ManagerHome.jsp"> Dashboard</a>
            <a href="User1.jsp"> Personal Info</a>
          
        </div>

        <div class="main-content">
            <div class="input-container">
                <h2>Project Details</h2>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>projectID</th>
                                <th>projectName</th>
                                <th>description</th>
                                <th>clientName</th>
                                <th>deadline</th>
                                <th>status</th>
                                <th>username</th>
                                <th>password</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="proj" items="${projDetails}">
                                <tr>
                                    <td>${proj.projectID}</td>
                                    <td>${proj.projectName}</td>
                                    <td>${proj.description}</td>
                                    <td>${proj.clientName}</td>
                                    <td>${proj.deadline}</td>
                                    <td>${proj.status}</td>
                                    <td>${proj.username}</td>
                                    <td>${proj.password}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <h2>View Project</h2>
                <form action="A_GetAllProject" method="post">
                    <label for="projectID">Project ID:</label>
                    <input type="text" name="projectID">
                    <input type="submit" name="submit" value="View Project">
                </form>

                <form action="A_ProjectInsert.jsp" method="post">
                    <button type="submit">Add New Project</button>
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
                    <div class="calendar-grid">
                        <div class="calendar-day">S</div>
                        <div class="calendar-day">M</div>
                        <div class="calendar-day">T</div>
                        <div class="calendar-day">W</div>
                        <div class="calendar-day">T</div>
                        <div class="calendar-day">F</div>
                        <div class="calendar-day">S</div>
                        <!-- Days will be populated by JavaScript -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>