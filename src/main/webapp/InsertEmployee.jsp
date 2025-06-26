<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert </title>

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
            background-color: dark blue;
        }

        .input-container {
            background-color: rgba(255, 255, 255, 0.7); 
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 320px;
            text-align: center;
        }

        h2 {
            margin-bottom: 1.5rem;
            color: #333;
        }

        .input-group {
            margin-bottom: 1rem;
            text-align: left;
        }


        .input-group input {
            width: 60%;
            padding: 0.5rem;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-top: 0.5rem;
           
        }

        .btn {
            width: 100%;
            padding: 0.75rem;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
        }

        .btn:hover {
            background-color: #0056b3;
        }


        .change-password:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="input-container">

	<form action="InsertEmployeeServlet" method="post">
	 <div class="input-group">	
		<h2>Add New Employee</h2>
		    Employee ID <input type="text" name="EmpID"> <br>    
			Employee Name <input type="text" name="EmpName" ><br>
			Date Of Birth <input type="date" name="DOB" ><br>
			
			
			
		<label for="male">
            <input type="radio" id="male" name="Gender" value="Male">
            Male
        </label>
        
        <label for="female">
            <input type="radio" id="female" name="Gender" value="Female">
            Female
        </label>
        
        <label for="other">
            <input type="radio" id="other" name="Gender" value="Other">
            Other
        </label>
			<br>
			Email <input type="text" name="Email" ><br>
			Contact <input type="text" name="Contact" ><br><br>
			<label for="Department">Choose Department:</label>
				<select id="Department" name="Department">
				  <option value="Accounting">Accounting</option>
				  <option value="Administration">Administration</option>
				  <option value="Customer_Service">Customer Service</option>
				  <option value="Finance">Finance</option>
				  <option value="Human_Resources">Human Resources</option>
				  <option value="Information">Information Technology</option>
				  <option value="Legal">Legal</option>
				  <option value="Marketing">Marketing</option>
				  <option value="Manager">Manager</option>
				  <option value="Sales">Sales</option>
				</select><br>
			Position <input type="text" name="Position" ><br>
			Address_L1 <input type="text" name="Address_L1" ><br>
			City <input type="text" name="Address_L2" ><br>
			Username <input type="text" name="Username" >    <br>
			Password <input type="password" name="Password" ><br>
		</div>
		
		
		<input type="submit" name="submit" value="Create Employee">
	</form>
		

</div>

</body>
</html>