package com.dwg.vo;

public class ViewWishList {
    private Integer g_id;
    private String g_name;
    private String g_picture;
    private double price;
    public ViewWishList() {
    }

    public ViewWishList(Integer g_id, String g_name, String g_picture, double price) {
        this.g_id = g_id;
        this.g_name = g_name;
        this.g_picture = g_picture;
        this.price = price;
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

    public String getG_picture() {
        return g_picture;
    }

    public void setG_picture(String g_picture) {
        this.g_picture = g_picture;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "ViewWishList{" +
                "g_id=" + g_id +
                ", g_name='" + g_name + '\'' +
                ", g_picture='" + g_picture + '\'' +
                ", price=" + price +
                '}';
    }
}
