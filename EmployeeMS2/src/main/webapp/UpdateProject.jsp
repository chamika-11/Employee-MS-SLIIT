<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Project</title>
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

        h1 {
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

        input[type="text"] {
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
        <h1>Update Project</h1>
    </div>

    <div class="main-content">
        <div class="form-container">
            <%
                String projectID = request.getParameter("pid");
                String projectName = request.getParameter("name");
                String description = request.getParameter("description");
                String clientName = request.getParameter("client");
                String deadline = request.getParameter("deadline");
                String status = request.getParameter("status");
                String username = request.getParameter("userN");
                String password = request.getParameter("passW");
            %>

            <form action="UpdateProject" method="post">
                <div class="form-group">
                    <label for="pid">Project ID</label>
                    <input type="text" id="pid" name="pid" value="<%=projectID %>" >
                </div>
                <div class="form-group">
                    <label for="name">Project Name</label>
                    <input type="text" id="name" name="name" value="<%=projectName %>">
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <input type="text" id="description" name="description" value="<%=description %>">
                </div>
                <div class="form-group">
                    <label for="client">Client Name</label>
                    <input type="text" id="client" name="client" value="<%=clientName %>">
                </div>
                <div class="form-group">
                    <label for="deadline">Deadline</label>
                    <input type="text" id="deadline" name="deadline" value="<%=deadline %>">
                </div>
                <div class="form-group">
                    <label for="status">Status</label>
                    <input type="text" id="status" name="status" value="<%=status %>">
                </div>
                <div class="form-group">
                    <label for="uname">User Name</label>
                    <input type="text" id="uname" name="uname" value="<%=username %>">
                </div>
                <div class="form-group">
                    <label for="pass">Password</label>
                    <input type="text" id="pass" name="pass" value="<%=password %>">
                </div>
    
                <input type="submit" name="submit" value="Update Project">
            </form>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2023 Project Management System. All rights reserved.</p>
    </div>
</body>
</html>