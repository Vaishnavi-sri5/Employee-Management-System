<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('backgroundImage.jpg'); /* Replace 'background.jpg' with the path to your image */
            background-size: 100%;
        }
        .container {
            text-align: center;
        }
        .button {
            display: inline-block;
            padding: 15px 30px;
            margin: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #45a049;
        }
        h2 {
            color: #333;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Welcome!</h2>
    <a href="addEmployee.jsp" class="button">Add Employee</a>
    <a href="deleteEmployee.jsp" class="button">Delete Employee</a>
    <a href="viewEmployee.jsp" class="button">View Employee</a>
    <a href="performanceCheck.jsp" class="button">Performance Check</a>
    <a href="feedback.jsp" class="button">Feedback</a>
</div>

</body>
</html>
