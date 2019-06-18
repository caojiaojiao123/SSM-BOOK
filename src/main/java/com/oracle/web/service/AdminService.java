package com.oracle.web.service;

import com.oracle.web.bean.Admin;

public interface AdminService {

	int save(Admin admin);

	Admin login(Admin admin);

	Admin queryone(String username);

	Admin showAdmin(String uname);

	int updatePassword(String uname, String newpassword);

	//Admin login(String username);

	Admin validate(String username);
}
