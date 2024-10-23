<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Employee Account</title>
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
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        width: 400px;
    }

    h1 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 24px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    td {
        padding: 10px;
        text-align: left;
    }

    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 8px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #007BFF;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }

    input[type="submit"]:hover {
        background-color: #d32f2f;
    }
</style>
</head>
<body>

    <%
    String empID = request.getParameter("empID");
    String empName = request.getParameter("empName");
    String dOB = request.getParameter("dOB");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");
    String contact = request.getParameter("contact");
    String department = request.getParameter("department");
    String position = request.getParameter("position");
    String address_L1 = request.getParameter("address_L1");
    String address_L2 = request.getParameter("address_L2");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    %>

    

    <form action="B_Delete_Employee_Servlet" method="post">
    <h1>Employee Account Delete</h1>
        <table>
            <tr>
                <td>Employee ID</td>
                <td><input type="text" name="empID" value="<%= empID %>" readonly></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><input type="text" name="empName" value="<%= empName %>" readonly></td>
            </tr>
            
           
            <tr>
                <td>Department</td>
                <td><input type="text" name="department" value="<%= department %>" readonly></td>
            </tr>
            <tr>
                <td>Position</td>
                <td><input type="text" name="position" value="<%= position %>" readonly></td>
            </tr>
            
            <tr>
                <td>Username</td>
                <td><input type="text" name="username" value="<%= username %>" readonly></td>
            </tr>
           
        </table>

        <br>
        <input type="submit" name="submit" value="Delete Account">
    </form>

</body>
</html>
