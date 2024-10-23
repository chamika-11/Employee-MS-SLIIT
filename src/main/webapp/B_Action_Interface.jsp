<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Interface</title>
<style>

	

    table {
        width: 90%;
        border-collapse: collapse;
        
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #e2e2e2;
    }

    button, input[type="button"] {
        background-color: #007BFF; 
        color: white;
        padding: 8px 16px;
        margin: 10px 0;
        border: none;
        cursor: pointer;
    }

    button:hover, input[type="button"]:hover {
        background-color: #0b5db5;
    }

    a {
        text-decoration: none;
    }

    .actions {
        margin-top: 20px;
    }
</style>
</head>
<body>

    <table>
        <tr>
            <th>Employee ID</th>
            <th>Name</th>
            <th>Date Of Birth</th>
            <th>Gender</th>
            <th>Email</th>
            <th>Contact</th>
            <th>Department</th>
            <th>Position</th>
            <th>Address Line 1</th>
            <th>Address Line 2</th>
            <th>Username</th>
        </tr>

        <c:forEach var="emp" items="${empDetails}">
        
        <c:set var="empID" value="${emp.empID}"/>     
	<c:set var="empName" value="${emp.empName}"/>
	<c:set var="dOB" value="${emp.dOB}"/>
	<c:set var="gender" value="${emp.gender}"/>
	<c:set var="email" value="${emp.email}"/>
	<c:set var="contact" value="${emp.contact}"/>
	<c:set var="department" value="${emp.department}"/>
	<c:set var="position" value="${emp.position}"/>
	<c:set var="address_L1" value="${emp.address_L1}"/>
	<c:set var="address_L2" value="${emp.address_L2}"/>
	<c:set var="username" value="${emp.username}"/>      
	<c:set var="password" value="${emp.password}"/>
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
    </table>

		<div class="actions">
        <c:url value="B_Update_Employee.jsp" var="empupdate">
            <c:param name="EmpID" value="${empID}"/>     
            <c:param name="EmpName" value="${empName}"/>
            <c:param name="DOB" value="${dOB}"/>
            <c:param name="Gender" value="${gender}"/>
            <c:param name="Email" value="${email}"/>
            <c:param name="Contact" value="${contact}"/>
            <c:param name="Department" value="${department}"/>
            <c:param name="Position" value="${position}"/>
            <c:param name="Address_L1" value="${address_L1}"/>
            <c:param name="Address_L2" value="${address_L2}"/>
            <c:param name="Username" value="${username}"/>      
            <c:param name="Password" value="${password}"/>
        </c:url>

        <a href="${empupdate}">
            <input type="button" name="update" value="Update Data">
        </a>

        <c:url value="B_Delete_Employee.jsp" var="empdelete">
            <c:param name="empID" value="${empID}"/>     
            <c:param name="empName" value="${empName}"/>
            <c:param name="dOB" value="${dOB}"/>
            <c:param name="gender" value="${gender}"/>
            <c:param name="email" value="${email}"/>
            <c:param name="contact" value="${contact}"/>
            <c:param name="department" value="${department}"/>
            <c:param name="position" value="${position}"/>
            <c:param name="address_L1" value="${address_L1}"/>
            <c:param name="address_L2" value="${address_L2}"/>
            <c:param name="username" value="${username}"/>      
            <c:param name="password" value="${password}"/>
        </c:url>

        <a href="${empdelete}">
            <input type="button" name="delete" value="Delete Employee Account">
        </a>

        <form action="B_All_Employee_Details_Servlet" method="post">
            <button type="submit">Exit</button>
        </form>
    </div>

</body>
</html>