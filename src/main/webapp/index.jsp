<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Athul V Kumar | Portfolio</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="bg-gradient-circle circle1"></div>
    <div class="bg-gradient-circle circle2"></div>
    <header>
        <nav class="navbar">
            <ul class="nav-links" id="navLinks">
                <li><a href="#home">Home</a></li>
                <li><a href="#about">About</a></li>
                <li><a href="#skills">Skills</a></li>
                <li><a href="#projects">Projects</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
            <div class="menu-toggle" id="menuToggle">
                <span></span><span></span><span></span>
            </div>
        </nav>
    </header>
    <main>
        <section id="home" class="section home-section">
            <div class="container">
                <h1>Hello, I'm <span class="highlight">Athul V Kumar</span></h1>
                <p>Java | Python | HTML | CSS | JavaScript | React</p>
                <p class="tagline">Building elegant, modern web experiences. Passionate about learning and creating impactful solutions.</p>
                <a href="#contact" class="cta-btn">Let's Connect</a>
            </div>
        </section>
        <section id="about" class="section">
            <div class="container about-container-v2">
                <div class="about-left-row">
                    <div class="about-accent"></div>
                    <h2 class="about-title">About Me</h2>
                </div>
                <div class="about-right">
                    <p class="about-intro-v2">Hi! I'm Athul V Kumar, a passionate fresher with a strong foundation in programming and web development. I love building beautiful and functional websites and am eager to learn and grow in the tech industry.</p>
                    <div class="about-features">
                        <div class="about-feature-card">Always learning new technologies</div>
                        <div class="about-feature-card">Interested in UI/UX and web design</div>
                        <div class="about-feature-card">Enjoy collaborating and open source</div>
                        <div class="about-feature-card">Motivated to solve real-world problems</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Skills Section -->
        <%@ page import="com.portfolio.dao.SkillDAO, com.portfolio.model.Skill, java.util.List" %>
        <%
            SkillDAO skillDAO = new SkillDAO();
            List<Skill> skills = skillDAO.getAllSkills();
        %>
        <section id="skills" class="section">
            <div class="container">
                <h2>Skills</h2>
                <ul class="skills-list">
                    <% for (Skill skill : skills) { %>
                        <li><img src="<%= skill.getIconPath() %>" alt="<%= skill.getName() %>" class="skill-logo"></li>
                    <% } %>
                </ul>

                <div style="width:100%;max-width:400px;margin:0 auto;">
                    <% for (Skill skill : skills) { %>
                        <div><%= skill.getName() %></div>
                        <div class="skill-bar">
                            <div class="skill-bar-fill" data-width="<%= skill.getPercentage() %>%" style="width:0;"></div>
                        </div>
                    <% } %>
                </div>
            </div>
        </section>

        <!-- Project Section -->
        <%@ page import="java.util.List" %>
        <%@ page import="com.portfolio.model.Project" %>
        <%@ page import="com.portfolio.dao.ProjectDAO" %>

        <%
            ProjectDAO dao = new ProjectDAO();
            List<Project> projects = dao.getAllProjects();
        %>

        <section id="projects" class="section">
            <div class="container">
                <h2>Projects</h2>
                <div class="projects-grid">
                    <% for (Project p : projects) { %>
                        <div class="project-card">
                            <img src="<%= p.getImageUrl() %>" alt="<%= p.getName() %>" class="project-img" />
                            <h3><%= p.getName() %></h3>
                            <p><strong>Tech:</strong> <%= p.getTech() %></p>
                            <p><%= p.getDescription() %></p>
                            <a href="<%= p.getGithubUrl() %>" target="_blank">View Project</a>
                        </div>
                    <% } %>
                </div>
            </div>
        </section>

        <!-- Contact Section -->
        <section id="contact" class="section">
            <div class="container">
                <h2>Contact</h2>
                <form action="submitContact.jsp" method="post" class="contact-form" onsubmit="return showAlert()">
                    <input type="text" name="name" placeholder="Your Name" required>
                    <input type="email" name="email" placeholder="Your Email" required>
                    <textarea name="message" placeholder="Your Message" required></textarea>
                    <button type="submit">Send Message</button>
                </form>
                <%
                    String error = request.getParameter("error");
                    String submitted = request.getParameter("submitted");

                    if ("invalid_message".equals(error)) {
                %>
                    <div class="alert error">Your message contains invalid content.</div>
                <%
                    } else if ("data_too_long".equals(error)) {
                %>
                    <div class="alert error">Your input is too long. Please shorten it.</div>
                <%
                    } else if ("unknown".equals(error)) {
                %>
                    <div class="alert error">Your input is too long. Please shorten it.</div>
                <%
                    } else if ("true".equals(submitted)) {
                %>
                    <div class="alert success">Message sent successfully!</div>
                <%
                    }
                %>

                <%
                    if ("true".equals(submitted)) {
                %>
                    <script>
                        alert("Thank you for contacting!");
                    </script>
                <%
                    }
                %>
                <div style="margin-top: 30px; text-align: center;">
                    <p>Or connect with me on:</p>
                    <a href="#" class="social-link" title="LinkedIn" target="_blank" aria-label="LinkedIn">
                        <svg width="28" height="28" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <circle cx="16" cy="16" r="16" fill="#0A66C2"/>
                            <path d="M10.666 12.667h2.667v8h-2.667v-8zm1.333-1.334a1.333 1.333 0 1 1 0-2.666 1.333 1.333 0 0 1 0 2.666zm3.334 1.334h2.56v1.093h.037c.356-.675 1.226-1.387 2.523-1.387 2.7 0 3.2 1.776 3.2 4.084v4.21h-2.667v-3.733c0-.89-.016-2.034-1.24-2.034-1.24 0-1.427.97-1.427 1.97v3.797h-2.667v-8z" fill="#fff"/>
                        </svg>
                    </a>
                    <p style="margin-top:10px;">Location: Kerala, India</p>
                </div>
            </div>
        </section>
    </main>
    <footer>
        <div class="container">
            <p>&copy; 2024 Athul V Kumar. All rights reserved.</p>
        </div>
    </footer>
    <script src="js/script.js"></script>
</body>
</html>