<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 300px;
            margin: 0 auto;
            margin-top: 50px;
            text-align: center;
        }
        input[type="text"], textarea, input[type="submit"] {
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

<div class="container">
    <h2>Feedback</h2>
    <form action="feedback.jsp" method="post">
        <label for="name">Employee Name:</label>
        <input type="text" id="name" name="name" required>
        <label for="feedback">Feedback:</label>
        <textarea id="feedback" name="feedback" rows="4" required></textarea>
        <input type="submit" value="Submit Feedback">
    </form>
</div>

<%
    // Process form submission and update feedback in the database
    if (request.getMethod().equals("POST")) {
        String name = request.getParameter("name");
        String feedback = request.getParameter("feedback");

        // JDBC connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/employeemanagementsystem";
        String dbUser = "root";
        String dbPassword = "root";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Establishing connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Updating feedback in the database
            String query = "UPDATE employee SET Feedback = ? WHERE Name = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, feedback);
            pstmt.setString(2, name);
            pstmt.executeUpdate();

            // Redirecting after successful update
            response.sendRedirect("home.jsp");
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            // Closing resources
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }
%>

</body>
</html>
