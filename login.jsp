<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('backgroundImage.jpg'); /* Replace 'background.jpg' with the path to your image */
            background-size: 100%;
            
        }
        .container {
            width: 300px;
            margin: 0 auto;
            margin-top: 100px;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background for better readability */
            padding: 20px;
            border-radius: 10px;
        }
        input[type="text"], input[type="password"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<%
    // Dummy username and password (you should replace this with a database lookup)
    String validUsername = "admin";
    String validPassword = "12345";

    // Get the parameters from the form submission
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Check if the form is submitted
    if (username != null && password != null) {
        // Validate the username and password
        boolean isValid = validUsername.equals(username) && validPassword.equals(password);

        if (isValid) {
            // Redirect to the home page or any other page after successful login
            response.sendRedirect("home.jsp");
        } else {
            // If login fails, redirect back to the login page with an error message
            response.sendRedirect("login.jsp?error=true");
        }
    }
%>

<div class="container">
    <h2>Login</h2>
    <form action="login.jsp" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <input type="submit" value="Login">
    </form>
</div>

</body>
</html>
