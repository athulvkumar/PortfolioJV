package com.portfolio.test;

import com.portfolio.util.DBConnection;

import java.sql.Connection;
import java.sql.SQLException;

public class TestDB {
    public static void main(String[] args) throws SQLException {
        try (Connection con = DBConnection.getConnection()) {
            if(con != null) {
                System.out.println("Database Connection success");
            } else {
                System.out.println("Database Connection Failed");
            }
        } catch (RuntimeException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
