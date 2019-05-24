package com.oracle.web.mapper;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;

import java.util.List;

public interface BookMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(SubBook record);

	SubBook selectByPrimaryKey(Integer id);

	List<SubBook> selectAll();


	int updateByPrimaryKey(Book record);

	List<SubBook> showByPage();
}