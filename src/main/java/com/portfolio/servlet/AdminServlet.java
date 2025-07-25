package com.portfolio.servlet;

import com.portfolio.dao.AdminDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/login")
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        AdminDAO dao = new AdminDAO();
        try {
            if (dao.validateAdmin(username, password)) {
                HttpSession session = req.getSession();
                session.setAttribute("admin", username);
                resp.sendRedirect(req.getContextPath() + "/admin/dashboard.jsp");
            } else {
                req.setAttribute("error", "Invalid");
                req.getRequestDispatcher("/admin/adm-login.jsp").forward(req, resp);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
