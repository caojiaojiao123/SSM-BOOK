package com.oracle.web.mapper;

import com.oracle.web.bean.Admin;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface AdminMapper {

	int save(Admin admin);// 保存

	Admin login(String username);// 登录

	Admin queryone(String username);// 单个查询

	Admin selectByPrimaryKey(String username);// 查看管理员

	Admin queryByPassword(Admin admin);// 密码

	// 修改密码

	Admin changepassword(@Param("username") String username, @Param("password") String newpassword);
}