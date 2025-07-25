package com.portfolio.servlet;

import com.portfolio.dao.ProjectDAO;
import com.portfolio.model.Project;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/project-add")
public class ProjectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String tech = req.getParameter("tech");
        String desc =  req.getParameter("description");
        String image = req.getParameter("imageUrl");
        String github = req.getParameter("githubUrl");

        Project prj = new Project();

        prj.setName(name);
        prj.setTech(tech);
        prj.setDescription(desc);
        prj.setImageUrl(image);
        prj.setGithubUrl(github);

        try {
            new ProjectDAO().addProject(prj);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        resp.sendRedirect("project-add.jsp");
    }
}
