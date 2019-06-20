package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.PageBean;

public interface FenleiService {

	List<Fenlei> list();

	int save(Fenlei fenlei);

	int delete(Fenlei fenlei);

	Fenlei queryOneFenlei(Integer id);

	void update(Fenlei fenlei);

	Fenlei queryOne(String name);

	PageBean<Fenlei> showByPage(Integer pageNow);

	List<Fenlei> showfenleiByIds(String[] arr);

	List<Fenlei> showFenleiByIds(String[] arr);

	List<Fenlei> list2();

	//void delete1(String[] arr);

	int yanzhengAddFenlei2(Integer id);

	int delete1(Fenlei f);

	//List<Fenlei> selectFenleiAll();

}
