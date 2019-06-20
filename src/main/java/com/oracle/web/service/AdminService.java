package com.oracle.web.service;

import com.oracle.web.bean.Admin;

public interface AdminService {

	int save(Admin admin);// 保存管理员

	Admin login(String username);// 登录

	Admin queryone(String username);// 单查管理员

	Admin selectByPrimaryKey(String username);

	Admin queryByPassword(Admin admin);// 保存密码

	Admin changepassword(String username, String newpassword);// 修改密码
}
