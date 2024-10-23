<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Custom Dark Gray and Yellow Error Message</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #1E2328;
        }

        .error-container {
            max-width: 400px;
            width: 100%;
        }

        .error-message {
            background-color: #2A2F36;
            border-left: 4px solid #FFFF00;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            color: #e0e0e0;
            padding: 16px;
            border-radius: 4px;
            font-size: 14px;
            line-height: 1.5;
            margin: 10px 0;
            display: flex;
            align-items: flex-start;
            transition: all 0.3s ease;
        }

        .error-message:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        .error-icon {
            margin-right: 12px;
            font-size: 24px;
            color: #FFFF00;
        }

        .error-title {
            font-weight: bold;
            margin-bottom: 4px;
            color: #FFFF00;
        }

        .error-content {
            margin: 0;
        }

        .error-dismiss {
            margin-left: auto;
            color: #999;
            cursor: pointer;
            font-size: 18px;
            transition: color 0.2s ease;
        }

        .error-dismiss:hover {
            color: #FFFF00;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .error-message {
            animation: fadeIn 0.3s ease-out;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-message">
            <span class="error-icon">&#9888;</span>
            <div>
                <div class="error-title">Error</div>
                <p class="error-content">An error occurred. Please try again later.</p>
            </div>
            <span class="error-dismiss">&times;</span>
        </div>
    </div>
</body>
</html>