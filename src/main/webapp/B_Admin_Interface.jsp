<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %> 
    
    
<%@ page import="oop_v2_FM_Employee.employee" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Details</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        background-color: #243642;
    }

	.table-container {
    max-height: 250px; 
    overflow-y: scroll; 
    border: 1px solid #ddd;
}

    .input-container {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 2rem;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 90%;
        
    }

    h2 {
        margin-bottom: 1.5rem;
        color: #333;
        text-align: center;
    }
    h1 {
       
        color: #ffffff;
        text-align: top;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 1.5rem;
    }

    th, td {
        padding: 10px;
        border: 1px solid #ddd;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }
    
   

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    .input-group {
        text-align: center;
        margin-bottom: 1rem;
    }

    .input-group input[type="text"] {
        width: 60%;
        padding: 0.5rem;
        font-size: 1rem;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-right: 0.5rem;
    }

    .input-group input[type="submit"],
    .input-group button {
        padding: 0.5rem 1rem;
        background-color: #007BFF;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .input-group input[type="submit"]:hover,
    .input-group button:hover {
        background-color: #0056b3;
    }

    form {
        text-align: center;
        margin-bottom: 1rem;
    }

</style>

</head>
<body>
 <h1>ADMIN INTERFACE</h1>
<div class="input-container">
    <h2>Employee Details</h2>
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
    
    <div class="table-container">
    <table>
    <thead>
        <tr>        
            <th>Employee ID</th>
            <th>Name</th>
            <th>Date Of Birth</th>
            <th>Gender</th>
            <th>Email</th>
            <th>Contact</th>
            <th>Department</th>        
            <th>Position</th>
            <th>Address</th>
            <th>City</th>
            <th>Username</th>        
        </tr>
        </thead>
        <tbody>
        <c:forEach var="emp" items="${empDetails}">
            <tr>
                <td>${emp.empID}</td>    
                <td>${emp.empName}</td>
                <td>${emp.dOB}</td>
                <td>${emp.gender}</td>
                <td>${emp.email}</td>
                <td>${emp.contact}</td>
                <td>${emp.department}</td>
                <td>${emp.position}</td>
                <td>${emp.address_L1}</td>
                <td>${emp.address_L2}</td>
                <td>${emp.username}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
    <form action="B_Action_Servlet" method="post" class="input-group">
        Enter Employee ID: <input type="text" name="uid">
        <input type="submit" name="submit" value="Make Action">
    </form>
    
    <form action="B_Insert_Employee.jsp" method="post" class="input-group">
        <button type="submit">Add new employee</button>
    </form>
</div>

</body>
</html>
