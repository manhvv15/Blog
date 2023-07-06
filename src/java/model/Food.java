/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dmngh
 */
public class Food {
    private String info, image, title;
    private int id, vote;

    public Food(String info, String image, String title, int id, int vote) {
        this.info = info;
        this.image = image;
        this.title = title;
        this.id = id;
        this.vote = vote;
    }

    public Food(String info, String image, String title, int vote) {
        this.info = info;
        this.image = image;
        this.title = title;
        this.vote = vote;
    }

    public Food() {
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

}
