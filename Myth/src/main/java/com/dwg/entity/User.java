package com.dwg.entity;

public class User {
    private Integer id;
    private String name;
    private String email;
    private String address;
    private String username;
    private String password;
    private String header_icon;
    private double wx;
    private double zfb;
    public User() {
    }

    public User(Integer id, String name, String email, String address, String username, String password, String header_icon, double wx, double zfb) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.address = address;
        this.username = username;
        this.password = password;
        this.header_icon = header_icon;
        this.wx = wx;
        this.zfb = zfb;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getHeader_icon() {
        return header_icon;
    }

    public void setHeader_icon(String header_icon) {
        this.header_icon = header_icon;
    }

    public double getWx() {
        return wx;
    }

    public void setWx(double wx) {
        this.wx = wx;
    }

    public double getZfb() {
        return zfb;
    }

    public void setZfb(double zfb) {
        this.zfb = zfb;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", header_icon='" + header_icon + '\'' +
                ", wx=" + wx +
                ", zfb=" + zfb +
                '}';
    }
}
