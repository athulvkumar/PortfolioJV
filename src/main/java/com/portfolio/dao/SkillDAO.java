package com.portfolio.dao;

import com.portfolio.model.Skill;
import com.portfolio.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SkillDAO {
    public List<Skill> getAllSkills() {
        List<Skill> skills = new ArrayList<>();

        String query = "select * from skills order by id desc";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery();) {
            while (rs.next()) {
                Skill sk = new Skill();
                sk.setId(rs.getInt("id"));
                sk.setName(rs.getString("name"));
                sk.setIconPath(rs.getString("icon_path"));
                sk.setPercentage(rs.getInt("percentage"));
                skills.add(sk);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return skills;
    }

    public void addSkill(Skill skill) {
        String query = "insert into skills (name, icon_path, percentage) VALUES (?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, skill.getName());
            ps.setString(2, skill.getIconPath());
            ps.setInt(3, skill.getPercentage());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
