package com.portfolio.setup;

import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class AdminSetup {
    public static void main(String[] args) {
        String username = "admin";
        String rawPassword = "admin";

        String hashedPassword = BCrypt.hashpw(rawPassword, BCrypt.gensalt());

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio", "root", "root")) {

            String sql = "INSERT INTO admin (username, password) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, hashedPassword);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
