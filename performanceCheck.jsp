<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Performance Check</title>
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
        input[type="text"], input[type="number"], input[type="submit"] {
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
    <h2>Performance Check</h2>
    <form action="performanceCheck.jsp" method="post">
        <label for="name">Employee Name:</label>
        <input type="text" id="name" name="name" required>
        <label for="rating">Rating (1-10):</label>
        <input type="number" id="rating" name="rating" min="1" max="10" required>
        <input type="submit" value="Submit Rating">
    </form>
</div>

<%
    // Process form submission and update employee performance in the database
    if (request.getMethod().equals("POST")) {
        String name = request.getParameter("name");
        int rating = Integer.parseInt(request.getParameter("rating"));

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

            // Updating data in the database
            String query = "UPDATE employee SET employeePerformance = ? WHERE name = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, rating);
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
