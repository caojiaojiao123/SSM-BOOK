package com.oracle.web.bean;

public class Book {
    private Integer id;

    private String name;

    private String price;

    private String chubanshe;

    private String zhuangtai;

    private String username;

    private Integer fid;

    @Override
	public String toString() {
		return "Book [id=" + id + ", name=" + name + ", price=" + price + ", chubanshe=" + chubanshe + ", zhuangtai="
				+ zhuangtai + ", username=" + username + ", fid=" + fid + "]";
	}

	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Book(Integer id, String name, String price, String chubanshe, String zhuangtai, String username,
			Integer fid) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.chubanshe = chubanshe;
		this.zhuangtai = zhuangtai;
		this.username = username;
		this.fid = fid;
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