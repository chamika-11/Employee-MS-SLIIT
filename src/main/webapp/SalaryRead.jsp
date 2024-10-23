<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>    
<%@ page import="oop_v2_FM_Employee.employee" %>
<%@ page import="oop_v2_FM_Employee.Salary" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Salary Details</title>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Salary Deatails - Financial Management System</title>
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
            max-width: 1200px;
            margin: 0 auto;
        }

        .page-title {
            margin-bottom: 30px;
            color: #2c3e50;
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

        .btn-secondary {
            background-color: #95a5a6;
            color: white;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .footer {
            background: #2c3e50;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: auto;
        }

         table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Employee Management System</h1>
        <div class="user-info">
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

    <div class="container">
        <div class="sidebar">
            <a href="Dashboard.jsp"> Dashboard</a>
            <a href="User.jsp"> Personal Info</a>
            <a href="Salaryinsert.jsp"> Add Salary</a>
            <a href="SalaryRead.jsp" style="background: #34495e;"> View Salary</a>
          
        </div>

        <div class="main-content">
            <h2 class="page-title">View Salary Record</h2>
            
            <table class="table">
                <tr class="row1">
                    <th class="row2">EmpID</th>
                    <th class="row2">Basic Salary</th>
                    <th class="row2">OT Rate</th>
                    <th class="row2">Deduction Rate (%)</th>
                    <th class="row2">Actions</th>
                </tr>
                
                <c:forEach var="SalaryList2" items="${SalaryDetails}" >
                    <tr class="row3">
                        <td class="row4">${SalaryList2.empID}</td>
                        <td class="row2">${SalaryList2.basicSalary}</td>
                        <td class="row2">${SalaryList2.OTRate}</td>
                        <td class="row2">${SalaryList2.deductionRate}</td>

                        <c:url value="SalaryUpdate.jsp" var="SalUpdate">
                            <c:param name="EmpID" value="${SalaryList2.empID}" />
                            <c:param name="BasicSalary" value="${SalaryList2.basicSalary}" />
                            <c:param name="OTRate" value="${SalaryList2.OTRate}" />
                            <c:param name="DeductionRate" value="${SalaryList2.deductionRate}" />
                        </c:url>

                        <td class="row2">
                           <!--   <form style="display:inline;" action="viewEmployee.jsp" method="post">
                                <input type="hidden" name="empID" value="${SalaryList2.empID}" />
                                <button type="submit" class="btn">View More</button>
                            </form>-->
                             <c:url value="Viewmoreservlet" var="ViewMore">
   							  <c:param name="EmpID" value="${SalaryList2.empID}" />
							  </c:url>
							  <a href="${ViewMore}" >
    							<input type="button" name="ViewMore" value="View More" class="btn">
								</a>
                            
                           <!--   <form style="display:inline;" action="Update" method="post">
                                <input type="hidden" name="empID" value="${SalaryList2.empID}" />  -->
                                
                                
                                <c:url value="SalaryUpdate.jsp" var="SalUpdate">
							    <c:param name="EmpID" value="${SalaryList2.empID}" />
							    <c:param name="BasicSalary" value="${SalaryList2.basicSalary}" />
							    <c:param name="OTRate" value="${SalaryList2.OTRate}" />
							    <c:param name="DeductionRate" value="${SalaryList2.deductionRate}" />
									</c:url>

								<a href="${SalUpdate}">
								    <input type="button" name="Update" value="Update" class="btn">
								</a>
								
								
                            
                           <!--   <form style="display:inline;" action="Delete" method="post" onsubmit="return confirm('Are you sure you want to delete this employee?');">-->
                              <c:url value="Deletesalaryservlet" var="SalDelete">
   							  <c:param name="EmpID" value="${SalaryList2.empID}" />
							  </c:url>

								<a href="${SalDelete}" onclick="return confirmDelete();">
    							<input type="button" name="Delete" value="Delete" class="btn">
								</a>
                               
                               <script type="text/javascript">
    								function confirmDelete() {
        								return confirm('Are you sure you want to delete this employee?');
   											 }
								</script>
                               
                               
                               <!--   <input type="hidden" name="empID" value="${SalaryList2.empID}" />
                               <button type="submit">Delete</button>
                               <!--   <input type="button" name="Delete" value="Delete" >-->
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <div class="footer">
      
    </div>
</body>

</html>
