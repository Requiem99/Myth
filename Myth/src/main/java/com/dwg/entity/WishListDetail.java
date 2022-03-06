package com.dwg.entity;

public class WishListDetail {
    private Integer wd_id;
    private Integer g_id;

    public WishListDetail() {
    }

    public WishListDetail(Integer wd_id, Integer g_id) {
        this.wd_id = wd_id;
        this.g_id = g_id;
    }

    public Integer getWd_id() {
        return wd_id;
    }

    public void setWd_id(Integer wd_id) {
        this.wd_id = wd_id;
    }

    public Integer getG_id() {
        return g_id;
    }

    public void setG_id(Integer g_id) {
        this.g_id = g_id;
    }

    @Override
    public String toString() {
        return "WishListDetail{" +
                "wd_id=" + wd_id +
                ", g_id=" + g_id +
                '}';
    }
}
