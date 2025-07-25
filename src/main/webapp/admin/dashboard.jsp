<%@ page session="true" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <title>Dashboard</title>
</head>
<body>
    <div class="dashboard-container">
        <%@ page import="java.sql.*" %>
        <%@ page import="com.portfolio.util.DBConnection" %>
        <div class="dashboard-header">
            <div class="dashboard-title">Welcome, <span class="admin-name"><%= admin %></span></div>
            <a href="logout.jsp" class="dashboard-logout-btn">Logout</a>
        </div>
        <div class="dashboard-actions" style="display: flex; gap: 10px;">
            <a href="project-add.jsp" class="dashboard-action-btn">+ Add Project</a>
            <a href="add-skill.jsp" class="dashboard-action-btn">+ Add Skills</a>
        </div>
        <div class="dashboard-card">
            <h2 class="dashboard-section-title">Contact Messages</h2>
            <div class="dashboard-table-wrapper">
                <table class="dashboard-table">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Message</th>
                            <th>Received At</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% try (Connection con = DBConnection.getConnection();
                        PreparedStatement ps = con.prepareStatement("SELECT * FROM messages ORDER BY created_at DESC");
                        ResultSet rs = ps.executeQuery()) {
                        while (rs.next()) { %>
                        <tr>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("message") %></td>
                            <td><%= rs.getTimestamp("created_at") %></td>
                        </tr>
                    <% } } catch (Exception e) { %>
                        <tr><td colspan="4" class="dashboard-error">Error: <%= e.getMessage() %></td></tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>