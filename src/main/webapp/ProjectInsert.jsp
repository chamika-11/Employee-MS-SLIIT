<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Project</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #121212;
            color: white;
            padding-top: 70px;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background-color: #121212; 
            color: #1e90ff;
            box-shadow: 0 2px 5px rgba(30, 144, 255, 0.2);
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

        .main-content {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
        }

        .form-container {
            width: 60%;
            max-width: 500px;
            padding: 20px;
            background-color: #1e1e1e;
            box-shadow: 0px 0px 10px rgba(30, 144, 255, 0.1);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            color: #1e90ff;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
            color: #1e90ff;
        }

        input[type="text"], 
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #1e90ff;
            border-radius: 5px;
            background-color: #121212;
            color: white;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #1e90ff;
            color: #121212;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: #1a7fdf;
        }

        input[type="text"]:hover,
        input[type="text"]:focus,
        input[type="password"]:hover,
        input[type="password"]:focus {
            border-color: #1e90ff;
            outline: none;
            box-shadow: 0 0 5px rgba(30, 144, 255, 0.5);
        }

        .footer {
            background: #121212;
            color: #1e90ff;
            text-align: center;
            padding: 20px;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="company-name">
            <h1>Project Management System</h1>
        </div>
    </div>

    <div class="main-content">
        <div class="form-container">
            <h2>Create Project</h2>
            <form action="A_ProjectInsert" method="post">
                <div class="form-group">
                    <label for="pid">Project ID</label>
                    <input type="text" id="pid" name="pid" required>
                </div>
                <div class="form-group">
                    <label for="name">Project Name</label>
                    <input type="text" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="description">Project Description</label>
                    <input type="text" id="description" name="description" required>
                </div>
                <div class="form-group">
                    <label for="client">Client Name</label>
                    <input type="text" id="client" name="client" required>
                </div>
                <div class="form-group">
                    <label for="deadline">Deadline</label>
                    <input type="text" id="deadline" name="deadline" required>
                </div>
                <div class="form-group">
                    <label for="status">Status</label>
                    <input type="text" id="status" name="status" required>
                </div>
                <div class="form-group">
                    <label for="uid">User Name</label>
                    <input type="text" id="uid" name="uid" required>
                </div>
                <div class="form-group">
                    <label for="psw">Password</label>
                    <input type="password" id="psw" name="psw" required>
                </div>
                
                <input type="submit" name="submit" value="Create Project">
            </form>
        </div>
    </div>
    
<br>
            <h2>View Project</h2>
                <form action="A_GetAllProject" method="post">
                    <label for="projectID">Project ID:</label>
                    <input type="text" name="projectID">
                    <input type="submit" name="submit" value="View Project">
                </form>


    <div class="footer">
       
    </div>
    
    
    
</body>
</html>