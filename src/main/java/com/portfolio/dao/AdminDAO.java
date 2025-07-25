package com.portfolio.dao;

import com.portfolio.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {
    public boolean validateAdmin(String username, String password) throws SQLException {
        String query = "select * from admin where username = ? AND password = ?";

        try(Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        } return false;
    }
}
