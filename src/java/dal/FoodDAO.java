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
import model.Food;

/**
 *
 * @author dmngh
 */
public class FoodDAO extends DBContext {

    public List<Food> getAllFood() {
        List<Food> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM food\n"
                    + "ORDER BY food_id DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Food(rs.getString(3), rs.getString(4), rs.getString(2), rs.getInt(1), rs.getInt(5)));
            }
        } catch (SQLException e) {
            System.out.println("getAll: " + e.getMessage());
        }

        return list;
    }

    public List<Food> getThree() {
        List<Food> list = new ArrayList<>();

        try {
            String sql = "SELECT TOP 3 * FROM food\n"
                    + "ORDER BY food_id DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Food(rs.getString(3), rs.getString(4), rs.getString(2), rs.getInt(1), rs.getInt(5)));
            }
        } catch (SQLException e) {
            System.out.println("getAll: " + e.getMessage());
        }

        return list;
    }

    public Food getFoodById(int id) {

        try {
            String sql = "SELECT * FROM food\n"
                    + "WHERE food_id = ?";
            
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Food(rs.getString(3), rs.getString(4), rs.getString(2), rs.getInt(1), rs.getInt(5));
            }
        } catch (SQLException e) {
            System.out.println("getFoodById: " + e.getMessage());
        }

        return null;
    }
    
    public void insert (Food d) {
        try {
            String sql = "INSERT INTO food(food_title, food_info, image, vote) VALUES (?, ?, ?, ?);";
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
    
    public void delete (Food f) {
        try {
            String sql = "DELETE FROM food WHERE food_id = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, f.getId());
            ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println("delete: " + e.getMessage());
        }
    }
    
    public void update (Food f, int id) {
        try {
            String sql = "UPDATE food SET food_title = ?, food_info = ?, image = ?, vote = ? WHERE food_id = ?;";
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
