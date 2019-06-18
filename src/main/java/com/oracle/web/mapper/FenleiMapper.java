package com.oracle.web.mapper;

import com.oracle.web.bean.Fenlei;
import java.util.List;

public interface FenleiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Fenlei record);

    Fenlei selectByPrimaryKey(Integer id);    

    List<Fenlei> selectAll();

    int updateByPrimaryKey(Fenlei record);

	int deleteByPrimaryKey(String[] arr);

	List<Fenlei> selectAll2();

	List<Fenlei> showfenleiById(String[] arr);

	List<Fenlei> showfenleiByIds(String[] arr);

	List<Fenlei> showByPage();

	Fenlei findfenlei(String name);
    
    
 }