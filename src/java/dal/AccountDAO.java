/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;

/**
 *
 * @author dmngh
 */
public class AccountDAO extends DBContext{
    public Account getAccount(String username, String password) {
        try {
            String sql = "SELECT * FROM account WHERE username = ? and password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(username, password);
            }
        } catch (SQLException e) {
            System.out.println("getAccount: " + e.getMessage());
        }
        
        return null;
    }
    
    public boolean checkAdminAccount(Account a) {
        
        if(a.getUsername().equals("admin")) {
            return true;
        }
        return false;
    }
    
    public void insert(Account a) {
        try {
            String sql = "INSERT INTO account (username, password) VALUES (?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, a.getUsername());
            ps.setString(2, a.getPassword());
            ps.executeUpdate();
        }catch(SQLException e) {
            System.out.println("insert: " + e.getMessage());
        }
    }
}
