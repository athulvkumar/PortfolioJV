<%@ page session="true" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("ada-skill.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <title>Add Skill</title>
</head>
<body>
    <a href="dashboard.jsp" class="project-add-back-btn">&#8592; Back to Dashboard</a>
    <div class="project-add-container">
        <div class="project-add-card">
            <h2 class="project-add-title">Add New Skill</h2>
            <form action="AddSkillServlet" method="post" class="project-add-form">
                <div class="input-group">
                    <label for="name"><span class="project-add-icon">&#128295;</span> Skill Name</label>
                    <input type="text" id="name" name="name" placeholder="Skill Name" required />
                </div>
                <div class="input-group">
                    <label for="iconUrl"><span class="project-add-icon">&#128247;</span> Icon URL</label>
                    <input type="text" id="icon_path" name="icon_path" placeholder="Icon Path (assets/java.png)" required />
                </div>
                <div class="input-group">
                    <label for="percentage"><span class="project-add-icon">&#128200;</span> Skill %</label>
                    <input type="number" id="percentage" name="percentage" placeholder="Skill %" min="1" max="100" required />
                </div>
                <button type="submit" class="project-add-btn">Add Skill</button>
            </form>
        </div>
    </div>
</body>
</html>