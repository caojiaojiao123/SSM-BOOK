package com.oracle.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.Book;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.pageBean;
import com.oracle.web.service.BookService;
import com.oracle.web.service.FenleiService;

@Controller
@Scope(value = "prototype")
public class BookHandler {

	@Autowired
	private BookService bookService;// 这个地方要导个包：
	@Autowired
	private FenleiService fenleiService;

	// 分页
	@RequestMapping(value = "/showByPage", method = RequestMethod.GET)
	public String showByPage(HttpServletRequest request, Integer pageNow) {

		if (pageNow == null || pageNow < 0) {

			pageNow = 1;
		}

		pageBean<SubBook> pb = bookService.showByPage(pageNow);

		request.setAttribute("pb", pb);

		return "showAll";

	}

	@RequestMapping(value = "/addUI", method = RequestMethod.GET)
	public String addUI(HttpServletRequest request) {

		List<Fenlei> list = fenleiService.list();

		request.setAttribute("sList", list);

		return "addBook";

	}

	@RequestMapping(value = "/addBook", method = RequestMethod.POST)

	public <SubBook> String addMonster(com.oracle.web.bean.SubBook book) {

		int i = bookService.addBook( book);

		if (i > 0) {

			return "redirect:/showByPage";
		} else {

			return "addBook";// 添加图书：
		}

	}

	@RequestMapping(value = "/deleteBook/{id}", method = RequestMethod.DELETE)
	public String deleteBook(@PathVariable("id") Integer id) {

		bookService.deleteBook(id);// 根据id来删除：

		return "redirect:/showByPage";

	}

	@RequestMapping(value = "/updateUI/{id}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("id") Integer id, HttpSession session) {

		Book book = bookService.QueryOneBook(id);// 单查出来一本书：

		// System.out.println(monster.getMonstername()+" "+monster.getEmail()+"
		// "+monster.getBrithday()+" "+monster.getEntryday());

		session.setAttribute("m", book);

		List<Fenlei> list = fenleiService.list();

		session.setAttribute("sList", list);

		return "redirect:/updateBook.jsp";
	}

	@RequestMapping(value = "/updateBook", method = RequestMethod.PUT) // 真正的修改：
	public <SubBook> String updateBook(SubBook book) {

		bookService.updateBook((com.oracle.web.bean.SubBook) book);

		return "redirect:/showByPage";

	}

}
