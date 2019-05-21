package com.oracle.web.bean;

import java.util.List;

public class Fenlei {
	
	private int id;
	
	private String name;

	public Fenlei(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Fenlei() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Fenlei [id=" + id + ", name=" + name + "]";
	}
	
}