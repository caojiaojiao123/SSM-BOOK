package com.oracle.web.service.impl;


import java.util.List;


import com.oracle.web.bean.Book;
import com.oracle.web.dao.userDao;
import com.oracle.web.dao.impl.userDaolmpl;

public class userServicelmpl implements com.oracle.web.service.userService {
	userDao ud=new userDaolmpl();

	


	

	@Override
	public List<Book> showUser() {
		// TODO Auto-generated method stub
		return ud.showUser();
	}

	@Override
	public List<Book> showUserByIds(String[] arr) {
		// TODO Auto-generated method stub
		return ud.showUserByIds(arr);
	}

	

}
