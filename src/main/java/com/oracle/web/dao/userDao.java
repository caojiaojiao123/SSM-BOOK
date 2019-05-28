package com.oracle.web.dao;

import java.util.List;

import com.oracle.web.bean.Book;

public interface userDao {





	//int getCounts();//全查,返回多少条记录数：：

	//int[] delete(String[] ids);

	List<Book> showUser();

	List<Book> showUserByIds(String[] arr);

}
