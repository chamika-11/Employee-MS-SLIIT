<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Leave Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #1E2328;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        color: #e0e0e0;
    }
    .form-container {
        background-color: #2A2F36;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        width: 400px;
        padding: 20px;
        border-left: 4px solid #FFFF00;
    }
    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #FFFF00;
    }
    .form-group {
        margin-bottom: 15px;
    }
    label {
        display: block;
        margin-bottom: 5px;
        color: #FFFF00;
    }
    input[type="text"],
    input[type="date"],
    select {
        width: 100%;
        padding: 8px;
        border-radius: 5px;
        border: 1px solid #FFFF00;
        background-color: #1E2328;
        color: #e0e0e0;
        box-sizing: border-box;
    }
    select {
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        background-image: url('data:image/svg+xml;utf8,<svg fill="%23FFFF00" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/><path d="M0 0h24v24H0z" fill="none"/></svg>');
        background-repeat: no-repeat;
        background-position-x: 98%;
        background-position-y: 50%;
    }
    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #FFFF00;
        border: none;
        color: #1E2328;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }
    input[type="submit"]:hover {
        background-color: #E6E600;
    }
    input[type="date"]::-webkit-calendar-picker-indicator {
        filter: invert(1) brightness(2);
    }
    .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .button-group input[type="submit"],
        .button-group .back-button {
            width: 48%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .button-group input[type="submit"] {
            background-color: #FFFF00;
            color: #1E2328;
        }

        .button-group input[type="submit"]:hover {
            background-color: #E6E600;
        }

        .button-group .back-button {
            background-color: #4A4A4A;
            color: #FFFF00;
        }

        .button-group .back-button:hover {
            background-color: #3A3A3A;
        }
</style>
</head>
<body>
    <%
    String leaveIdStr = request.getParameter("leave_id");
    String leave_type = request.getParameter("leave_type");
    String startDateStr = request.getParameter("start_date");
    String endDateStr = request.getParameter("end_date");
    String reason = request.getParameter("reason");

    int leave_id = 0;
    Date start_date = null;
    Date end_date = null;

    if (leaveIdStr != null && !leaveIdStr.isEmpty()) {
        leave_id = Integer.parseInt(leaveIdStr);
    }
    if (startDateStr != null && !startDateStr.isEmpty()) {
        start_date = Date.valueOf(startDateStr);
    }
    if (endDateStr != null && !endDateStr.isEmpty()) {
        end_date = Date.valueOf(endDateStr);
    }
    %>

    <div class="form-container">
        <h2>Update Leave</h2>
        <form action="C_UpdateServlet" method="post">
            <input type="hidden" name="leave_id" value="<%= leave_id %>">

            <div class="form-group">
			    <label for="leave_type">Leave Type:</label>
			    <select id="leave_type" name="leave_type" required>
			        <option value="">Select Leave Type</option>
			        <option value="urgent" <%= "urgent".equals(leave_type) ? "selected" : "" %>>Urgent</option>
			        <option value="private_reason" <%= "private_reason".equals(leave_type) ? "selected" : "" %>>Private Reason</option>
			        <option value="sick_leave" <%= "sick_leave".equals(leave_type) ? "selected" : "" %>>Sick Leave</option>
			        <option value="vacation" <%= "vacation".equals(leave_type) ? "selected" : "" %>>Vacation</option>
			        <option value="family_emergency" <%= "family_emergency".equals(leave_type) ? "selected" : "" %>>Family Emergency</option>
			        <option value="maternity_paternity" <%= "maternity_paternity".equals(leave_type) ? "selected" : "" %>>Maternity/Paternity Leave</option>
			        <option value="bereavement" <%= "bereavement".equals(leave_type) ? "selected" : "" %>>Bereavement Leave</option>
			        <option value="medical" <%= "medical".equals(leave_type) ? "selected" : "" %>>Medical Appointment</option>
			        <option value="jury_duty" <%= "jury_duty".equals(leave_type) ? "selected" : "" %>>Jury Duty</option>
			        <option value="study_leave" <%= "study_leave".equals(leave_type) ? "selected" : "" %>>Study Leave</option>
			        <option value="unpaid_leave" <%= "unpaid_leave".equals(leave_type) ? "selected" : "" %>>Unpaid Leave</option>
			    </select>
			</div>
            
            <div class="form-group">
                <label for="start_date">Start Date:</label>
                <input type="date" id="start_date" name="start_date" value="<%= start_date != null ? start_date.toString() : "" %>" required>
            </div>
            
            <div class="form-group">
                <label for="end_date">End Date:</label>
                <input type="date" id="end_date" name="end_date" value="<%= end_date != null ? end_date.toString() : "" %>" required>
            </div>
            
            <div class="form-group">
                <label for="reason">Reason:</label>
                <input type="text" id="reason" name="reason" value="<%= reason != null ? reason : "" %>" required>
            </div>
            
            <div class="button-group">
                <input type="submit" name="submit" value="Update">
                <button type="button" class="back-button" onclick="goBack()">Back</button>
            </div>
        </form>
    </div>
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>