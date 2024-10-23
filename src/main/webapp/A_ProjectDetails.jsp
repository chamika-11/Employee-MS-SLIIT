<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Project Details</title>
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
            align-items: flex-start;
            flex-grow: 1;
            padding: 20px;
        }

        .form-container {
            width: 90%;
            max-width: 1200px;
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #333;
        }

        th {
            background-color: #1e90ff;
            color: #121212;
        }

        tr:hover {
            background-color: #2a2a2a;
        }

        .button-group {
            display: flex;
            gap: 10px;
        }

        button {
            padding: 8px 12px;
            background-color: #1e90ff;
            color: #121212;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
        }

        button:hover {
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
        <h1>Project Details</h1>
    </div>

    <div class="main-content">
        <div class="form-container">
            <h2>Project Details</h2>
            <table>
                <tr>
                    <th>Project ID</th>
                    <th>Project Name</th>
                    <th>Description</th>
                    <th>Client Name</th>
                    <th>Deadline</th>
                    <th>Status</th>
                    <th>User Name</th>
                    <th>Password</th>
                    <th>Action</th>
                </tr>

                <c:forEach var="pro" items="${allProject}">
                    <tr>
                        <td>${pro.projectID}</td>
                        <td>${pro.projectName}</td>
                        <td>${pro.description}</td>
                        <td>${pro.clientName}</td>
                        <td>${pro.deadline}</td>
                        <td>${pro.status}</td>
                        <td>${pro.username}</td>
                        <td>${pro.password}</td>
                        <td class="button-group">
                            <a href="A_UpdateProject.jsp?pid=${pro.projectID}&name=${pro.projectName}&description=${pro.description}&client=${pro.clientName}&deadline=${pro.deadline}&status=${pro.status}&userN=${pro.username}&passW=${pro.password}">
                                <button>Update</button>
                            </a>
                            <a href="A_DeleteProject.jsp?pid=${pro.projectID}&name=${pro.projectName}&description=${pro.description}&client=${pro.clientName}&deadline=${pro.deadline}&status=${pro.status}&userN=${pro.username}&passW=${pro.password}">  
                                <button>Delete</button>
                            </a>
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