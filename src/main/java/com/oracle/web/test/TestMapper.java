package com.oracle.web.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.oracle.web.bean.Book;
import com.oracle.web.mapper.BookMapper;

@RunWith(SpringJUnit4ClassRunner.class)//用的是spring的测试：
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class TestMapper {//写spring是注解：
	
@Autowired
private BookMapper bookMapper;

@Test
public void testPage(){
	
//	this.bookMapper.insert(record)
	List<Book> selectAll = this.bookMapper.selectAll();
	for (Book book : selectAll) {
		System.out.println(book);
	}
}
}
