/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dmngh
 */
public class Post {
    private String title, content, image, category;
    private int id, vote;

    public Post(String title, String content, String image, String category, int id, int vote) {
        this.title = title;
        this.content = content;
        this.image = image;
        this.category = category;
        this.id = id;
        this.vote = vote;
    }

    public Post(String title, String content, String image, String category, int vote) {
        this.title = title;
        this.content = content;
        this.image = image;
        this.category = category;
        this.vote = vote;
    }

    public Post() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVote() {
        return vote;
    }

    public void setVote(int vote) {
        this.vote = vote;
    }
    
    public boolean isDrink() {
        return this.category.equals("drink");
    }
    public boolean isFood() {
        return this.category.equals("food");
    }
}
