<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="javascript">
        function confirmDelete() {
            return confirm("Are you sure you want to delete this record?");
        }
    </script>
</head>
<body>


   <%
		   String EmpID = request.getParameter("EmpID");
		   Double BasicSalary = Double.parseDouble(request.getParameter("BasicSalary"));
		   Double OTRate = Double.parseDouble(request.getParameter("OTRate"));
		   Double DeductionRate = Double.parseDouble(request.getParameter("DeductionRate"));
		        

    
    %>

<form action="Delete" method="post">
    <label for="EmpID">Employee ID</label>
    <input type="text" name="EmpID" value="<%= EmpID %>" readonly><br>
    
    
    <label for="BasicSalary">Basic Salary</label>
    <input type="text" name="BasicSalary" value="<%= BasicSalary %>"><br>
   
    
    <input type="submit" name="submit" value="submit">
</form>

</body>
</html>