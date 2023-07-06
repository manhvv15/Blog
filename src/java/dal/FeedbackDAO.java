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
import model.Feedback;

/**
 *
 * @author dmngh
 */
public class FeedbackDAO extends DBContext{
    public List<Feedback> getFeedbackByPostId(int postId) {
        List<Feedback> list = new ArrayList<>();
        
        try {
            String sql = "SELECT * FROM feedback\n"
                    + "WHERE postId = ?\n"
                    + "ORDER BY date DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, postId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(rs.getString(2), rs.getString(3), rs.getInt(1), rs.getInt(5), rs.getDate(4), rs.getBoolean(6)));
            }
        } catch(SQLException e) {
            System.out.println("getFeedbackByPostId: " + e.getMessage());
        }
        return list;
    }
    
    public void insert (Feedback f) {
        try {
            String sql = "INSERT INTO feedback (name, content, [date], postId, status) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, f.getName());
            ps.setString(2, f.getContent());
            ps.setDate(3, f.getDate());
            ps.setInt(4, f.getPostId());
            ps.setBoolean(5, false);
            ps.executeUpdate();
        }catch(SQLException e) {
            System.out.println("insert: " + e.getMessage());
        }
    }
    
    public void delete(int f) {
        try {
            String sql = "DELETE FROM feedback WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, f);
            ps.executeUpdate();
        }catch(SQLException e) {
            System.out.println("delete: " + e.getMessage());
        }
    }
    
    public Feedback getFeedbackByid(int id) {
        
        try {
            String sql = "SELECT * FROM feedback WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Feedback(rs.getString(2), rs.getString(3), rs.getInt(1), rs.getInt(5), rs.getDate(4), rs.getBoolean(6)); 
            }
        } catch(SQLException e) {
            System.out.println("getFeedbackByid: " + e.getMessage());
        }
        return null;
    }
    
    public void changeStatus(Feedback f) {
        try {
            String sql = "UPDATE feedback SET status = ? WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setBoolean(1, !f.isStatus());
            ps.setInt(2, f.getId());
            ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println("changeStatus: " + e.getMessage());
        }
    }
}
