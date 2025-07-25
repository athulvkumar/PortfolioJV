package com.portfolio.servlet;

import com.portfolio.dao.SkillDAO;
import com.portfolio.model.Skill;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/AddSkillServlet")
public class AddSkillServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String iconPath = request.getParameter("icon_path");
        int percentage = Integer.parseInt(request.getParameter("percentage"));

        Skill skill = new Skill();
        skill.setName(name);
        skill.setIconPath(iconPath);
        skill.setPercentage(percentage);

        SkillDAO dao = new SkillDAO();
        dao.addSkill(skill);

        response.sendRedirect("add-skill.jsp");
    }
}
