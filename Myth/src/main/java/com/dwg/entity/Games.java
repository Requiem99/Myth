package com.dwg.entity;

import java.util.Date;

public class Games {
    private Integer g_id;
    private String g_name;
    private String g_detail;
    private String g_type;
    private String g_picture;
    private Integer g_star;
    private double price;
    private Date uptime;

    public Games() {
    }

    public Games(Integer g_id, String g_name, String g_detail, String g_type, String g_picture, Integer g_star, double price,Date uptime) {
        this.g_id = g_id;
        this.g_name = g_name;
        this.g_detail = g_detail;
        this.g_type = g_type;
        this.g_picture = g_picture;
        this.g_star = g_star;
        this.price = price;
        this.uptime = uptime;
    }

    public Integer getG_id() {
        return g_id;
    }

    public void setG_id(Integer g_id) {
        this.g_id = g_id;
    }

    public String getG_name() {
        return g_name;
    }

    public void setG_name(String g_name) {
        this.g_name = g_name;
    }

    public String getG_detail() {
        return g_detail;
    }

    public void setG_detail(String g_detail) {
        this.g_detail = g_detail;
    }

    public String getG_type() {
        return g_type;
    }

    public void setG_type(String g_type) {
        this.g_type = g_type;
    }

    public String getG_picture() {
        return g_picture;
    }

    public void setG_picture(String g_picture) {
        this.g_picture = g_picture;
    }

    public Integer getG_star() {
        return g_star;
    }

    public void setG_star(Integer g_star) {
        this.g_star = g_star;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getUpdate() { return uptime;}

    public void setUpdate(Date uptime) {
        this.uptime = uptime;
    }

    @Override
    public String toString() {
        return "Games{" +
                "g_id=" + g_id +
                ", g_name='" + g_name + '\'' +
                ", g_detail='" + g_detail + '\'' +
                ", g_type='" + g_type + '\'' +
                ", g_picture='" + g_picture + '\'' +
                ", g_star=" + g_star +
                ", price=" + price +
                ", update=" + uptime +
                '}';
    }
}
