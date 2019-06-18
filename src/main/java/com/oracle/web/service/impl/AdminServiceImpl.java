package com.oracle.web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.web.bean.Admin;
import com.oracle.web.bean.User;
import com.oracle.web.mapper.AdminMapper;
import com.oracle.web.service.AdminService;

@Service
public abstract class AdminServiceImpl implements AdminService {


	@Autowired
	private AdminMapper adminMapper;

	@Override
	@Transactional
	public int save(Admin admin) {
		// TODO Auto-generated method stub
		return this.adminMapper.insert(admin);
	}

	
	@Override
	@Transactional(readOnly=true)
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		return this.adminMapper.queryAdmin(admin);
	}
	
//	@Override
//	@Transactional(readOnly=true)
//	public Admin login(String username) {
//		// TODO Auto-generated method stub
//		return this.adminMapper.login(username);
//	}

	@Override
	@Transactional
	public Admin validate(String username) {
		// TODO Auto-generated method stub
		return this.adminMapper.selectValidate(username);
	}

	@Override
	@Transactional(readOnly=true)
	public Admin showAdmin(String uname) {
		// TODO Auto-generated method stub
		return this.adminMapper.showAdmin(uname);
	}


	@Override
	@Transactional
	public int updatePassword(String uname, String newpassword) {
		// TODO Auto-generated method stub
		return this.adminMapper.updatePassword(uname,newpassword);
	}

	
}

