package com.dwg.entity;

public class Orders {
    private Integer o_id;
    private Integer o_u_id;
    private Integer o_g_id;
    private String o_g_name;
    private String o_g_picture;
    private double o_g_money;

    public Orders() {
    }

    public Orders(Integer o_id, Integer o_u_id, Integer o_g_id, String o_g_name, String o_g_picture, double o_g_money) {
        this.o_id = o_id;
        this.o_u_id = o_u_id;
        this.o_g_id = o_g_id;
        this.o_g_name = o_g_name;
        this.o_g_picture = o_g_picture;
        this.o_g_money = o_g_money;
    }

    public Integer getO_id() {
        return o_id;
    }

    public void setO_id(Integer o_id) {
        this.o_id = o_id;
    }

    public Integer getO_u_id() {
        return o_u_id;
    }

    public void setO_u_id(Integer o_u_id) {
        this.o_u_id = o_u_id;
    }

    public Integer getO_g_id() {
        return o_g_id;
    }

    public void setO_g_id(Integer o_g_id) {
        this.o_g_id = o_g_id;
    }

    public String getO_g_name() {
        return o_g_name;
    }

    public void setO_g_name(String o_g_name) {
        this.o_g_name = o_g_name;
    }

    public String getO_g_picture() {
        return o_g_picture;
    }

    public void setO_g_picture(String o_g_picture) {
        this.o_g_picture = o_g_picture;
    }

    public double getO_g_money() {
        return o_g_money;
    }

    public void setO_g_money(double o_g_money) {
        this.o_g_money = o_g_money;
    }

    @Override
    public String toString() {
        return "Order{" +
                "o_id=" + o_id +
                ", o_u_id=" + o_u_id +
                ", o_g_id=" + o_g_id +
                ", o_g_name='" + o_g_name + '\'' +
                ", o_g_picture='" + o_g_picture + '\'' +
                ", o_g_money=" + o_g_money +
                '}';
    }
}
