<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #121212;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .error-container {
            background-color: #1e1e1e;
            border-radius: 10px;
            padding: 40px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(255, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        .error-icon {
            font-size: 64px;
            color: #ff0000;
            margin-bottom: 20px;
        }

        h1 {
            color: #ff0000;
            margin-bottom: 20px;
        }

        p {
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .back-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #1e90ff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #cc0000;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-icon">❌</div>
        <h1>Error</h1>
        <p>An error occurred while processing your request. Please try again later.</p>
        <a href="A_ManagerHome.jsp" class="back-button">Back to Home</a>
    </div>
</body>
</html>