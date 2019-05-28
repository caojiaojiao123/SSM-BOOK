package com.oracle.web.service;

import java.io.File;
import java.util.List;

import org.springframework.stereotype.Service;
import com.github.pagehelper.Page;
import com.oracle.web.bean.Book;
import com.oracle.web.bean.BookAndFenlei;
import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.SubBook;

public interface BookService {

	//pageBean<SubBook> showByPage(Integer pageNow);




	PageBean<BookAndFenlei> showBookPesgeAll(Integer pageNow);

	void deleteBook(String ids);

	Book yanzhengAddBook(String name, String f_id);

	int save(Book book);

	Book updateBookUl(Integer id);

	void updateBook(Book book);

	PageBean<BookAndFenlei> showBookPesgeGaoJi(Integer pageNow, Book book);

	 File exportStudent();
	

	//List<Book> showUserByIds(String[] arr);

	//List<Book> showUser();
}
