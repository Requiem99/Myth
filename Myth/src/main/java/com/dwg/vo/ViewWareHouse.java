package com.dwg.vo;

public class ViewWareHouse {
    private Integer g_id;
    private String g_name;
    private String gd_image;

    public ViewWareHouse() {
    }

    public ViewWareHouse(Integer g_id, String g_name, String gd_image) {
        this.g_id = g_id;
        this.g_name = g_name;
        this.gd_image = gd_image;
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

    public String getGd_image() {
        return gd_image;
    }

    public void setGd_image(String gd_image) {
        this.gd_image = gd_image;
    }

    @Override
    public String toString() {
        return "ViewWareHouse{" +
                "g_id=" + g_id +
                ", g_name=" + g_name +
                ", gd_image='" + gd_image + '\'' +
                '}';
    }
}
