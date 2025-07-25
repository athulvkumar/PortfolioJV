package com.portfolio.dao;

import com.portfolio.model.Project;
import com.portfolio.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAO {
    public void addProject(Project project) throws SQLException {
        String query = "insert into projects (name, tech, description, image, github) values (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, project.getName());
            ps.setString(2, project.getTech());
            ps.setString(3, project.getDescription());
            ps.setString(4, project.getImageUrl());
            ps.setString(5, project.getGithubUrl());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Project> getAllProjects() {
        List<Project> projects = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("select * from projects order by id desc");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Project prj = new Project();
                prj.setId(rs.getInt("id"));
                prj.setName(rs.getString("name"));
                prj.setTech(rs.getString("tech"));
                prj.setDescription(rs.getString("description"));
                prj.setImageUrl(rs.getString("image"));
                prj.setGithubUrl(rs.getString("github"));
                projects.add(prj);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projects;
    }
}
