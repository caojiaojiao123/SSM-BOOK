package com.oracle.web.bean;

public class Admin {
	
    private Integer id;

    private String name;

    private String touxiang;

    private String username;

    private String password;

    private String repassword;

    private String phone;
    
    private String sex;

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

	public String getTouxiang() {
		return touxiang;
	}

	public void setTouxiang(String touxiang) {
		this.touxiang = touxiang;
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

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Admin(Integer id, String name, String touxiang, String username, String password, String repassword,
			String phone, String sex) {
		super();
		this.id = id;
		this.name = name;
		this.touxiang = touxiang;
		this.username = username;
		this.password = password;
		this.repassword = repassword;
		this.phone = phone;
		this.sex = sex;
	}

	@Override
	public String toString() {
		return "Admin [id=" + id + ", name=" + name + ", touxiang=" + touxiang + ", username=" + username
				+ ", password=" + password + ", repassword=" + repassword + ", phone=" + phone + ", sex=" + sex + "]";
	}

  
    
}