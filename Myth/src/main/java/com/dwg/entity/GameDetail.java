package com.dwg.entity;

public class GameDetail {
    private Integer gd_id;
    private Integer g_id;
    private String gd_image;

    public GameDetail() {
    }

    public GameDetail(Integer gd_id, Integer g_id, String gd_image) {
        this.gd_id = gd_id;
        this.g_id = g_id;
        this.gd_image = gd_image;
    }

    public Integer getGd_id() {
        return gd_id;
    }

    public void setGd_id(Integer gd_id) {
        this.gd_id = gd_id;
    }

    public Integer getG_id() {
        return g_id;
    }

    public void setG_id(Integer g_id) {
        this.g_id = g_id;
    }

    public String getGd_image() {
        return gd_image;
    }

    public void setGd_image(String gd_image) {
        this.gd_image = gd_image;
    }

    @Override
    public String toString() {
        return "GameDetail{" +
                "gd_id=" + gd_id +
                ", g_id=" + g_id +
                ", gd_image='" + gd_image + '\'' +
                '}';
    }
}
