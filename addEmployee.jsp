<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
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
        input[type="text"], input[type="submit"] {
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
    <h2>Add Employee</h2>
    <form action="addEmployee.jsp" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <label for="designation">Designation:</label>
        <input type="text" id="designation" name="designation" required>
        <label for="salary">Salary:</label>
        <input type="text" id="salary" name="salary" required>
        <input type="submit" value="Add Employee">
    </form>
</div>

<%
    // Process form submission and insert employee data into the database
    if (request.getMethod().equals("POST")) {
        String name = request.getParameter("name");
        String designation = request.getParameter("designation");
        int salary = Integer.parseInt(request.getParameter("salary"));

        // JDBC connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/employeemanagementsystem";
        String dbUser = "root";
        String dbPassword = "root";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Establishing connection
            // Class.forName("com.mysql.cj.jdbc.Driver");
            // conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nietdb", "root", "root");

            // Inserting data into the database
            String query = "INSERT INTO employee (name, designation, salary) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, designation);
            pstmt.setInt(3, salary);
            pstmt.executeUpdate();

            // Redirecting after successful insertion
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