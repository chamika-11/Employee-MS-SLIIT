<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Employee Update Form</title>
    <style>
        /* Center the form on the page */
        body {
            font-family: Arial, sans-serif;
            background-color: #243642;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Style the form */
        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
        }

        h3 {
            margin-bottom: 10px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-gap: 15px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }

        .form-group label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input {
            padding: 8px;
            font-size: 14px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .info-section {
            margin-top: 20px;
        }

        .action-buttons {
            text-align: center;
            margin-top: 20px;
        }

        /* Button styling */
        .btn {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #0b5db5;
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

    <form action="Update_Employee" method="post">
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
                <input type="text" name="DOB" value="<%= DOB %>">
            </div>
            <div class="form-group">
                <label for="Gender">Gender</label>
                <input type="text" name="Gender" value="<%= Gender %>" />
            </div>
            <div class="form-group">
                <label for="Email">Email</label>
                <input type="email" name="Email" value="<%= Email %>" />
            </div>
            <div class="form-group">
                <label for="Contact">Phone Number</label>
                <input type="text" name="Contact" value="<%= Contact %>" />
            </div>
            <div class="form-group">
                <label for="Department">Department</label>
                <input type="text" name="Department" value="<%= Department %>" />
            </div>
            <div class="form-group">
                <label for="Position">Position</label>
                <input type="text" name="Position" value="<%= Position %>" />
            </div>
            <div class="form-group">
                <label for="Username">Username</label>
                <input type="text" name="Username" value="<%= Username %>" />
            </div>
            <div class="form-group">
                <label for="Password">Password</label>
                <input type="text" name="Password" value="<%= Password %>" />
            </div>
       
            <div class="info-grid">
                <div class="form-group">
                    <label for="Address_L1">Street Address</label>
                    <input type="text" name="Address_L1" value="<%= Address_L1 %>" />
                </div>
                <div class="form-group">
                    <label for="Address_L2">City</label>
                    <input type="text" name="Address_L2" value="<%= Address_L2 %>" />
                </div>
            </div>
        </div>

        <div class="action-buttons">
            <input type="submit" name="submit" value="Save" class="btn">
        </div>
    </form>

</body>
</html>
