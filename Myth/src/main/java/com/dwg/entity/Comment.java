package com.dwg.entity;

public class Comment {
    private Integer c_id;
    private Integer c_g_id;
    private Integer c_u_id;
    private String c_u_username;
    private String c_u_header_icon;
    private Integer c_author_id;
    private String c_author_username;
    private String c_author_header_icon;
    private String c_content;
    private String c_datetime;
    private Integer thumbs_up;
    private Integer thumbs_down;
    private Integer c_h_id;

    public Comment() {
    }

    public Comment(Integer c_id, Integer c_g_id, Integer c_u_id, String c_u_username, String c_u_header_icon, Integer c_author_id, String c_author_username, String c_author_header_icon, String c_content, String c_datetime, Integer thumbs_up, Integer thumbs_down, Integer c_h_id) {
        this.c_id = c_id;
        this.c_g_id = c_g_id;
        this.c_u_id = c_u_id;
        this.c_u_username = c_u_username;
        this.c_u_header_icon = c_u_header_icon;
        this.c_author_id = c_author_id;
        this.c_author_username = c_author_username;
        this.c_author_header_icon = c_author_header_icon;
        this.c_content = c_content;
        this.c_datetime = c_datetime;
        this.thumbs_up = thumbs_up;
        this.thumbs_down = thumbs_down;
        this.c_h_id = c_h_id;
    }

    public Integer getC_id() {
        return c_id;
    }

    public void setC_id(Integer c_id) {
        this.c_id = c_id;
    }

    public Integer getC_g_id() {
        return c_g_id;
    }

    public void setC_g_id(Integer c_g_id) {
        this.c_g_id = c_g_id;
    }

    public Integer getC_u_id() {
        return c_u_id;
    }

    public void setC_u_id(Integer c_u_id) {
        this.c_u_id = c_u_id;
    }

    public String getC_u_username() {
        return c_u_username;
    }

    public void setC_u_username(String c_u_username) {
        this.c_u_username = c_u_username;
    }

    public String getC_u_header_icon() {
        return c_u_header_icon;
    }

    public void setC_u_header_icon(String c_u_header_icon) {
        this.c_u_header_icon = c_u_header_icon;
    }

    public Integer getC_author_id() {
        return c_author_id;
    }

    public void setC_author_id(Integer c_author_id) {
        this.c_author_id = c_author_id;
    }

    public String getC_author_username() {
        return c_author_username;
    }

    public void setC_author_username(String c_author_username) {
        this.c_author_username = c_author_username;
    }

    public String getC_author_header_icon() {
        return c_author_header_icon;
    }

    public void setC_author_header_icon(String c_author_header_icon) {
        this.c_author_header_icon = c_author_header_icon;
    }

    public String getC_content() {
        return c_content;
    }

    public void setC_content(String c_content) {
        this.c_content = c_content;
    }

    public String getC_datetime() {
        return c_datetime;
    }

    public void setC_datetime(String c_datetime) {
        this.c_datetime = c_datetime;
    }

    public Integer getThumbs_up() {
        return thumbs_up;
    }

    public void setThumbs_up(Integer thumbs_up) {
        this.thumbs_up = thumbs_up;
    }

    public Integer getThumbs_down() {
        return thumbs_down;
    }

    public void setThumbs_down(Integer thumbs_down) {
        this.thumbs_down = thumbs_down;
    }

    public Integer getC_h_id() {
        return c_h_id;
    }

    public void setC_h_id(Integer c_h_id) {
        this.c_h_id = c_h_id;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "c_id=" + c_id +
                ", c_g_id=" + c_g_id +
                ", c_u_id=" + c_u_id +
                ", c_u_username='" + c_u_username + '\'' +
                ", c_u_header_icon='" + c_u_header_icon + '\'' +
                ", c_author_id=" + c_author_id +
                ", c_author_username='" + c_author_username + '\'' +
                ", c_author_header_icon='" + c_author_header_icon + '\'' +
                ", c_content='" + c_content + '\'' +
                ", c_datetime='" + c_datetime + '\'' +
                ", thumbs_up=" + thumbs_up +
                ", thumbs_down=" + thumbs_down +
                ", c_h_id=" + c_h_id +
                '}';
    }
}
