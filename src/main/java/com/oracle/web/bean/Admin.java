package com.oracle.web.bean;

public class Admin {
	
    private Integer id;

    private String name;

    private String touxiang;

    private String username;

    private String password;

    private String repassword;

    private String phone;

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

    public String getTouxiang() {
        return touxiang;
    }

    public void setTouxiang(String touxiang) {
        this.touxiang = touxiang == null ? null : touxiang.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getRepassword() {
        return repassword;
    }

    public void setRepassword(String repassword) {
        this.repassword = repassword == null ? null : repassword.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

	public Admin(Integer id, String name, String touxiang, String username, String password, String repassword,
			String phone) {
		super();
		this.id = id;
		this.name = name;
		this.touxiang = touxiang;
		this.username = username;
		this.password = password;
		this.repassword = repassword;
		this.phone = phone;
	}

	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
}