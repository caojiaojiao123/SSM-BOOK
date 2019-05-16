package com.oracle.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.web.bean.User;
import com.oracle.web.service.UserService;

@Controller
@Scope(value = "prototype")
public class UserHandler {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/user",method=RequestMethod.GET)
	 public String User(HttpServletRequest request){
	
	 List<User> list=userService.list();
	
	 request.setAttribute("uList", list);
	
	 return "showUser";
	 
	 }


}
