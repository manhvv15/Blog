/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author dmngh
 */
public class Feedback {
    private String name, content;
    private int id , postId;
    private Date date;
    private boolean status;

    public Feedback() {
    }

    public Feedback(String name, String content, int id, int postId, Date date, boolean status) {
        this.name = name;
        this.content = content;
        this.id = id;
        this.postId = postId;
        this.date = date;
        this.status = status;
    }

    public Feedback(String name, String content, int postId, Date date, boolean status) {
        this.name = name;
        this.content = content;
        this.postId = postId;
        this.date = date;
        this.status = status;
    }
    public Feedback(String name, String content, int postId, Date date) {
        this.name = name;
        this.content = content;
        this.postId = postId;
        this.date = date;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
}
