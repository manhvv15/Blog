/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Drink;

/**
 *
 * @author dmngh
 */
public class DrinkDAO extends DBContext {

    public List<Drink> getAll() {
        List<Drink> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM drink\n"
                    + "ORDER BY drink_id DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Drink(rs.getString(3), rs.getString(4), rs.getString(2), rs.getInt(1), rs.getInt(5)));
            }
        } catch (SQLException e) {
            System.out.println("getAll: " + e.getMessage());
        }

        return list;
    }

    public List<Drink> getThree() {
        List<Drink> list = new ArrayList<>();

        try {
            String sql = "SELECT TOP 3 * FROM drink\n"
                    + "ORDER BY drink_id DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Drink(rs.getString(3), rs.getString(4), rs.getString(2), rs.getInt(1), rs.getInt(5)));
            }
        } catch (SQLException e) {
            System.out.println("getAll: " + e.getMessage());
        }

        return list;
    }
    
    public Drink getDrinkById(int id) {

        try {
            String sql = "SELECT * FROM drink\n"
                    + "WHERE drink_id = ?";
            
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Drink(rs.getString(3), rs.getString(4), rs.getString(2), rs.getInt(1), rs.getInt(5));
            }
        } catch (SQLException e) {
            System.out.println("getFoodById: " + e.getMessage());
        }

        return null;
    }
    
    public void insert (Drink d) {
        try {
            String sql = "INSERT INTO drink(drink_title, drink_info, image, vote) VALUES (?, ?, ?, ?);";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, d.getTitle());
            ps.setString(2, d.getInfo());
            ps.setString(3, d.getImage());
            ps.setInt(4, d.getVote());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("insert: " + e.getMessage());
        }
    }
    
    public void delete (Drink f) {
        try {
            String sql = "DELETE FROM drink WHERE drink_id = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, f.getId());
            ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println("delete: " + e.getMessage());
        }
    }
    
    public void update (Drink f, int id) {
        try {
            String sql = "UPDATE drink SET drink_title = ?, drink_info = ?, image = ?, vote = ? WHERE drink_id = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, f.getTitle());
            ps.setString(2, f.getInfo());
            ps.setString(3, f.getImage());
            ps.setInt(4, f.getVote());
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println("update: " + e.getMessage());
        }
    }
}
