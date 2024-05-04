<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Employees</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<h2 style="text-align: center;">View Employees</h2>

<table>
    <thead>
        <tr>
            
            <th>Name</th>
            <th>Designation</th>
            <th>Salary</th>
            <th>Performance</th>
            <th>Feedback</th>
        </tr>
    </thead>
    <tbody>
        <% 
            // JDBC connection parameters
            String jdbcUrl = "jdbc:mysql://localhost:3306/employeemanagementsystem";
            String dbUser = "root";
            String dbPassword = "root";

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Establishing connection
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

                // Fetching data from the database
                String query = "SELECT * FROM employee";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(query);

                // Displaying data in the table
                while (rs.next()) {
                    
                    String name = rs.getString("name");
                    String designation = rs.getString("designation");
                    int salary = rs.getInt("salary");
                    int performance = rs.getInt("Performance");
                    String feedback = rs.getString("feedback");

                    out.println("<tr>");
                    
                    out.println("<td>" + name + "</td>");
                    out.println("<td>" + designation + "</td>");
                    out.println("<td>" + salary + "</td>");
                    out.println("<td>" + performance + "</td>");
                    out.println("<td>" + feedback + "</td>");
                    out.println("</tr>");
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                // Closing resources
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </tbody>
</table>

</body>
</html>
