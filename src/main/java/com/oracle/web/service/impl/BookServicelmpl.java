package com.oracle.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.pageBean;
import com.oracle.web.mapper.BookMapper;
import com.oracle.web.service.BookService;

@Service
public class BookServicelmpl implements BookService {// 类继承接口：
	@Autowired
	private BookMapper bookMapper;

	@Override
	@Transactional(readOnly = true)
	public pageBean<SubBook> showByPage(Integer pageNow) {
		// TODO Auto-generated method stub

		pageBean<SubBook> pb = new pageBean<SubBook>();

		// 当前页的数据
		PageHelper.startPage(pageNow, 8);

		// 已经是分页好的数据了
		List<SubBook> list = this.bookMapper.showByPage();

		pb.setBeanList(list);

		// 总记录数
		PageInfo<SubBook> pi = new PageInfo<SubBook>(list);

		pb.setCounts((int) pi.getTotal());

		// 当前页
		pb.setPageNow(pageNow);

		// 每页有多少条
		pb.setpageSize(8);

		return pb;
	}

	@Override
	@Transactional
	public int addBook(SubBook book) {// 添加：
		// TODO Auto-generated method stub
		return this.bookMapper.insert(book);
	}

	@Override
	@Transactional
	public void deleteBook(Integer id) {// 删除
		// TODO Auto-generated method stub
		bookMapper.deleteByPrimaryKey(id);
	}

	

	@Override
	@Transactional(readOnly = true)
	public SubBook QueryOneBook(Integer id) {
		// TODO Auto-generated method stub
		return (SubBook) this.bookMapper.selectByPrimaryKey(id);
	}

	@Override
	@Transactional
	public void updateBook(SubBook book) {// 修改：
		// TODO Auto-generated method stub
		bookMapper.updateByPrimaryKey(book);
	}

}
