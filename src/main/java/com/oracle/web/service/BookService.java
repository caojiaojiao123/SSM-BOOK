package com.oracle.web.service;

import java.util.List;

import org.springframework.stereotype.Service;
import com.github.pagehelper.Page;
import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.pageBean;

public interface BookService {

	pageBean<SubBook> showByPage(Integer pageNow);



	void deleteBook(Integer id);

	SubBook QueryOneBook(Integer id);

	void updateBook(SubBook book);



	



	int addBook(SubBook book);

	//int addBook(SubBook book);

	
	

}
