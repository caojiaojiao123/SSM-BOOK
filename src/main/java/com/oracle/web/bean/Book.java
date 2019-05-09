package com.oracle.web.bean;

public class Book {
    private Integer id;

    private String flname;

    private String name;

    private String price;

    private String chubanshe;

    private String zhuangtai;

    private String username;

    private Integer fid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFlname() {
        return flname;
    }

    public void setFlname(String flname) {
        this.flname = flname == null ? null : flname.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price == null ? null : price.trim();
    }

    public String getChubanshe() {
        return chubanshe;
    }

    public void setChubanshe(String chubanshe) {
        this.chubanshe = chubanshe == null ? null : chubanshe.trim();
    }

    public String getZhuangtai() {
        return zhuangtai;
    }

    public void setZhuangtai(String zhuangtai) {
        this.zhuangtai = zhuangtai == null ? null : zhuangtai.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }
}