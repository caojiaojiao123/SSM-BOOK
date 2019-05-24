package com.oracle.web.bean;

import java.io.Serializable;

public class SubBook extends Book implements Serializable{

	
	

	private static final long serialVersionUID = 1L;
	
	private Fenlei fenlei;//要从分类里面查出来：

	public Fenlei getFenlei() {
		return fenlei;
	}

	public void setSchool(Fenlei fenlei) {
		this.fenlei = fenlei;
	}
	
	

}
