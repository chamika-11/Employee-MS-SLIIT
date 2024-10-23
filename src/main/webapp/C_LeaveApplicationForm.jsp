<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %> 
    
    
<%@ page import="oop_v2_FM_Employee.employee" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Leave Application Form</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #1E2328;
            color: white;
            padding-top: 70px;
        }

        .header {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    padding: 15px 30px;
		    background-color: #1E2328; 
		    color: #FFFF00;
		    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
		    position: fixed;
		    top: 0;
		    left: 0;
		    right: 0;
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
            min-height: calc(100vh - 70px);
        }

        .sidebar {
            width: 250px;
            background: #1E2328; 
            color: white;
            padding: 20px;
            height: 100vh;
            position: fixed;
            top: 0; 
    		left: 0; 
    		overflow-y: auto;
        }

        .sidebar a {
            color: #FFFF00;
            text-decoration: none;
            padding: 12px 15px;
            display: block;
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
            display: flex;
            width: calc(100% - 250px); 
   			margin-left: 250px;
            padding: 20px;
            box-sizing: border-box;
        }

        .form-container {
        width: 60%;
        padding: 20px;
        background-color: #333;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        margin-right: 20px;
    }
        
        h2 {
        text-align: center;
        color: #FFFF00;
        margin-bottom: 20px;
    }
        
        .form-group {
        margin-bottom: 20px;
    }

        label {
        font-weight: bold;
        display: block;
        margin-bottom: 8px;
        color: #FFFF00;
    }

        input[type="text"], 
    input[type="date"],
    select {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #1E2328;
        color: white;
        box-sizing: border-box;
    }

    input[type="date"]::-webkit-calendar-picker-indicator {
        filter: invert(100%);
    }

    input[type="submit"] {
        width: 100%;
        padding: 12px;
        background-color: #FFFF00;
        color: #1E2328;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
        margin-top: 10px;
    }

    input[type="submit"]:hover {
        background-color: #FFEB3B;
    }

        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #1E2328;
            color: white;
        }
	        
	        select:hover, 
	    select:focus,
	    input[type="text"]:hover,
	    input[type="text"]:focus,
	    input[type="date"]:hover,
	    input[type="date"]:focus {
	        border-color: #FFFF00;
	        outline: none;
	    }
        
        option {
            background-color: #1E2328;
            color: white;
        }
        .main-content {
        display: flex;
        width: calc(100% - 250px); 
        margin-left: 250px;
        padding: 20px;
        box-sizing: border-box;
        justify-content: space-between;
    	}

		        .calendar-section {
		    width: 250px;
		    background: #1E2328;
		    padding: 20px;
		    border-radius: 10px;
		    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
		    position: fixed;
		    top: 100px;
		    right: 20px;
		    z-index: 999;
		}
	
	    .calendar-header {
	        display: flex;
	        justify-content: space-between;
	        align-items: center;
	        margin-bottom: 15px;
	        color: #FFFF00;
	    }
	
	    .calendar-header button {
	        background: transparent;
	        border: none;
	        font-size: 24px;
	        cursor: pointer;
	        color: #FFFF00;
	    }
	
	    .calendar-header h3 {
	        font-size: 18px;
	        margin: 0;
	    }
	
	    .calendar-grid {
	        display: grid;
	        grid-template-columns: repeat(7, 1fr);
	        gap: 5px;
	    }
	
	    .calendar-day, .calendar-date {
	        text-align: center;
	        padding: 10px 5px;
	        font-size: 14px;
	    }
	
	    .calendar-day {
	        font-weight: bold;
	        color: #FFFF00;
	        border-bottom: 1px solid #e0e0e0;
	        margin-bottom: 5px;
	    }
	
	    .calendar-date {
	        cursor: pointer;
	        border-radius: 50%;
	        transition: background-color 0.3s ease;
	    }
	
	    .calendar-date:hover {
	        background: #FFFF00;
	        color: #000000;
	    }
	
	    .calendar-date.current {
	        background-color: #FFFF00;
	        color: #000000;
	        font-weight: bold;
	    }
        
        
        form[action="getFormsServlet"] {
        margin-top: 30px;
        padding-top: 20px;
        border-top: 1px solid #FFFF00;
	    }
	
	    form[action="getFormsServlet"] label {
	        display: inline-block;
	        margin-right: 10px;
	    }
	
	    form[action="getFormsServlet"] input[type="text"] {
	        width: calc(100% - 120px);
	        display: inline-block;
	    }
	
	    form[action="getFormsServlet"] input[type="submit"] {
	        width: auto;
	        padding: 10px 20px;
	        margin-top: 10px;
	    }
	    .footer {
            background: #1E2328;
            color: #FFFF00;
            text-align: center;
            padding: 20px;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="company-name">
            
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
            <a href="C_EmployeeHome.jsp"> Dash board</a>
            <a href="personalinfo.html"> Personal Info</a>
            <a href="C_LeaveApplicationForm.jsp"> Apply For Leave</a>
            
            <a href="C_Feedback.jsp">Give Feedback</a>
        </div>

        <div class="main-content">
            <div class="form-container">
                <h2>Employee Leave Application Form</h2>
                
                <form action="C_InsertServlet" method="post">
                    <div class="form-group">
                        <label for="employee_id">Employee ID:</label>
                        <input type="text" id="employee_id" name="employee_id" required>
                    </div>
                    <div class="form-group">
                        <label for="leave_type">Leave Type:</label>
                        <select id="leave_type" name="leave_type" required>
                            <option value="">Select Leave Type</option>
                            <option value="urgent">Urgent</option>
                            <option value="private_reason">Private Reason</option>
                            <option value="sick_leave">Sick Leave</option>
                            <option value="vacation">Vacation</option>
                            <option value="family_emergency">Family Emergency</option>
                            <option value="maternity_paternity">Maternity/Paternity Leave</option>
                            <option value="bereavement">Bereavement Leave</option>
                            <option value="medical">Medical Appointment</option>
                            <option value="jury_duty">Jury Duty</option>
                            <option value="study_leave">Study Leave</option>
                            <option value="unpaid_leave">Unpaid Leave</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="start_date">Start Date:</label>
                        <input type="date" id="start_date" name="start_date" required>
                    </div>
                    <div class="form-group">
                        <label for="end_date">End Date:</label>
                        <input type="date" id="end_date" name="end_date" required>
                    </div>
                    <div class="form-group">
                        <label for="reason">Reason:</label>
                        <input type="text" id="reason" name="reason" required>
                    </div>
                  
                    
                    <input type="submit" name="submit" value="Create Leave">
                    
                </form>
                
                <br><br>
            

            <div class="calendar-section">
                <div class="calendar-header">
                    <button onclick="prevMonth()">&#8249;</button>
                    <h3 id="month-year"></h3>
                    <button onclick="nextMonth()">&#8250;</button>
                </div>
                <div class="calendar-grid" id="calendar-dates"></div>
            </div>
        </div>
    </div>
    
    <script>
        const currentDate = new Date();
        let currentMonth = currentDate.getMonth();
        let currentYear = currentDate.getFullYear();

        function renderCalendar(month, year) {
            const calendarDates = document.getElementById("calendar-dates");
            calendarDates.innerHTML = "";

            const firstDay = new Date(year, month, 1).getDay();
            const daysInMonth = new Date(year, month + 1, 0).getDate();
            const monthYearText = moment(new Date(year, month)).format("MMMM YYYY");
            document.getElementById("month-year").textContent = monthYearText;

            
            const dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
            dayNames.forEach(day => {
                const dayElement = document.createElement("div");
                dayElement.textContent = day;
                dayElement.classList.add("calendar-day");
                calendarDates.appendChild(dayElement);
            });

            for (let i = 0; i < firstDay; i++) {
                const emptyCell = document.createElement("div");
                emptyCell.classList.add("calendar-date");
                calendarDates.appendChild(emptyCell);
            }

            for (let day = 1; day <= daysInMonth; day++) {
                const dateCell = document.createElement("div");
                dateCell.textContent = day;
                dateCell.classList.add("calendar-date");
                if (day === currentDate.getDate() && month === currentDate.getMonth() && year === currentDate.getFullYear()) {
                    dateCell.classList.add("current");
                }
                calendarDates.appendChild(dateCell);
            }
        }

        function prevMonth() {
            currentMonth--;
            if (currentMonth < 0) {
                currentMonth = 11;
                currentYear--;
            }
            renderCalendar(currentMonth, currentYear);
        }

        function nextMonth() {
            currentMonth++;
            if (currentMonth > 11) {
                currentMonth = 0;
                currentYear++;
            }
            renderCalendar(currentMonth, currentYear);
        }

        renderCalendar(currentMonth, currentYear);
    </script>
    <div class="footer">
        <p>&copy; 2024 FinancePro Management System. All rights reserved.</p>
    </div>
</body>
</html>