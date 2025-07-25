<%@ page session="true" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("project-add.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/style.css">
    <title>Add Project</title>
</head>
<body>
    <a href="dashboard.jsp" class="project-add-back-btn">&#8592; Back to Dashboard</a>
    <div class="project-add-container">
        <div class="project-add-card">
            <h2 class="project-add-title">Add New Project</h2>
            <form method="post" action="project-add" class="project-add-form">
                <div class="input-group">
                    <label for="name"><span class="project-add-icon">&#128221;</span> Project Name</label>
                    <input type="text" id="name" name="name" placeholder="Project Name" required>
                </div>
                <div class="input-group">
                    <label for="tech"><span class="project-add-icon">&#9881;&#65039;</span> Technologies Used</label>
                    <input type="text" id="tech" name="tech" placeholder="Technologies Used" required>
                </div>
                <div class="input-group">
                    <label for="description"><span class="project-add-icon">&#9997;&#65039;</span> Project Description</label>
                    <textarea id="description" name="description" placeholder="Project Description" required></textarea>
                </div>
                <div class="input-group">
                    <label for="imageUrl"><span class="project-add-icon">&#128247;</span> Image URL</label>
                    <input type="text" id="imageUrl" name="imageUrl" placeholder="Image URL" required>
                </div>
                <div class="input-group">
                    <label for="githubUrl"><span class="project-add-icon">&#128187;</span> GitHub URL</label>
                    <input type="text" id="githubUrl" name="githubUrl" placeholder="GitHub URL" required>
                </div>
                <button type="submit" class="project-add-btn">Save</button>
            </form>
        </div>
    </div>
</body>
</html>