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
import model.Post;

/**
 *
 * @author dmngh
 */
public class PostDAO extends DBContext {

    public List<Post> getAllFood() {
        List<Post> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM post\n"
                    + "WHERE category = 'food'\n"
                    + "ORDER BY id DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Post(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6), rs.getInt(1), rs.getInt(5)));
            }
        } catch (SQLException e) {
            System.out.println("getAllFood: " + e.getMessage());
        }

        return list;
    }

    public List<Post> getAllDrink() {
        List<Post> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM post\n"
                    + "WHERE category = 'drink'\n"
                    + "ORDER BY id DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Post(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6), rs.getInt(1), rs.getInt(5)));
            }
        } catch (SQLException e) {
            System.out.println("getAllDrink: " + e.getMessage());
        }

        return list;
    }

    public List<Post> getSix() {
        List<Post> list = new ArrayList<>();
        try {
            String sql = "SELECT TOP 6 * FROM post\n"
                    + "ORDER BY id DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Post(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6), rs.getInt(1), rs.getInt(5)));
            }
        } catch (SQLException e) {
            System.out.println("getAllDrink: " + e.getMessage());
        }
        return list;
    }

    public Post getPostById(int id) {
        try {
            String sql = "SELECT * FROM post WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Post(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6), rs.getInt(1), rs.getInt(5));
            }
        } catch (SQLException e) {
            System.out.println("Err");
        }
        return null;
    }

    public void insert(Post d) {
        try {
            String sql = "INSERT INTO drink(title, info, image, vote, category) VALUES (?, ?, ?, ?, ?);";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, d.getTitle());
            ps.setString(2, d.getContent());
            ps.setString(3, d.getImage());
            ps.setInt(4, d.getVote());
            ps.setString(5, d.getCategory());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("insert: " + e.getMessage());
        }
    }
    
    public List<Post> searchPost(String search) {
        List<Post> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM post WHERE title like ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Post(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6), rs.getInt(1), rs.getInt(5)));
            }
        }catch (SQLException e) {
            System.out.println("searchPost: " + e.getMessage());
        }
        return list;
    }
    
    public List<Post> searchPostOnCategory(String search, String category) {
        List<Post> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM post WHERE category = ? and title like ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, category);
            ps.setString(2, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Post(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(6), rs.getInt(1), rs.getInt(5)));
            }
        }catch (SQLException e) {
            System.out.println("searchPost: " + e.getMessage());
        }
        return list;
    }
    
    public void delete (Post f) {
        try {
            String sql = "DELETE FROM post WHERE id = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, f.getId());
            ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println("delete: " + e.getMessage());
        }
    }
    
    public void update (Post f, int id) {
        try {
            String sql = "UPDATE post SET title = ?, info = ?, image = ?, vote = ?, category = ? WHERE id = ?;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, f.getTitle());
            ps.setString(2, f.getContent());
            ps.setString(3, f.getImage());
            ps.setInt(4, f.getVote());
            ps.setString(5, f.getCategory());
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch(SQLException e) {
            System.out.println("update: " + e.getMessage());
        }
    }
}
