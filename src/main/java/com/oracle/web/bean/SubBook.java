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
	
	public String toString() {
		return "Book [id=" + this.getId() + ", name=" + this.getName() + ", price=" + this.getPrice() + ", chubanshe=" +this.getChubanshe()+ ", zhuangtai="
				+ this.getZhuangtai() + ", username=" + this.getUsername() + ", f_id=" + this.getF_id() +"fenlei="+fenlei+ "]";
	}
	
	

}
