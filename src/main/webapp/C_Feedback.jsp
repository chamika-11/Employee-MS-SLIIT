<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Box</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #1E2328;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #e0e0e0;
        }
        .feedback-box {
            background-color: #2A2F36;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            width: 400px;
            padding: 20px;
            border-left: 4px solid #FFFF00;
        }
        .feedback-box h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #FFFF00;
        }
        .feedback-box textarea {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #FFFF00;
            resize: vertical;
            min-height: 100px;
            margin-bottom: 15px;
            background-color: #1E2328;
            color: #e0e0e0;
        }
        .feedback-box input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #FFFF00;
            border: none;
            color: #1E2328;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .feedback-box input[type="submit"]:hover {
            background-color: #E6E600;
        }
        .date-display {
            text-align: center;
            margin-top: 15px;
            font-style: italic;
            color: #999;
        }
        
        .button-group {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
    }

    .button-group input[type="submit"],
    .button-group .back-button {
        width: 48%;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
        transition: background-color 0.3s ease;
        font-size: 16px;
        text-align: center;
    }

    .button-group input[type="submit"] {
        background-color: #FFFF00;
        color: #1E2328;
    }

    .button-group input[type="submit"]:hover {
        background-color: #E6E600;
    }

    .button-group .back-button {
        background-color: #4A4A4A;
        color: #FFFF00;
        text-decoration: none;
        display: inline-block;
    }

    .button-group .back-button:hover {
        background-color: #3A3A3A;
    }
    </style>
</head>
<body>

    <div class="feedback-box">
        <h2>Leave Your Feedback</h2>
        
        <form action="C_FeedbackInsertServlet" method="post">
            <input type="hidden" name="feedback_id" value="1"> 
            <textarea id="feedback" name="feedback" placeholder="Write your feedback..."></textarea>
            <div class="button-group">
            <input type="submit" value="Submit">
            <a href="C_EmployeeHome.jsp">
            <button type="button" class="back-button">Back</button>
            </a>
            </div>
        </form>

        <div class="date-display">
            <span id="current-date"></span>
        </div>
    </div>

    <script>
        const dateElement = document.getElementById("current-date");
        const today = new Date();
        const options = { year: 'numeric', month: 'long', day: 'numeric' };
        dateElement.textContent = today.toLocaleDateString(undefined, options);
    </script>

</body>
</html>