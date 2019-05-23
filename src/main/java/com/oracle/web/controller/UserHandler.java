package com.oracle.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.User;
import com.oracle.web.service.UserService;

@Controller
@Scope(value = "prototype")
public class UserHandler {
	
	@Autowired
	private UserService userService;
	
//	@RequestMapping(value="/users",method=RequestMethod.GET)
//	 public String Users(HttpServletRequest request){
//	
//	 List<User> list=userService.list();
//	
//	 request.setAttribute("uList", list);
//	
//	 return "showUser";
//	 
//	 }
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
   	public String list(Integer pageNow ,HttpServletRequest request) {
       	
   		if(pageNow==null||pageNow<1){
   			
   			pageNow=1;
   			
   		}
   			
   		PageBean<User> pb =userService.selectAllPage(pageNow);

   		//System.out.println(pb);

   		request.setAttribute("pb", pb);

   		return "showUser";

 }
	
//	@RequestMapping(value = "/addUI", method = RequestMethod.GET)
//	public String addUI(HttpServletRequest request) {
//
//		List<User> list = userService.list();
//
//		request.setAttribute("List", list);
//
//		return "addUser";
//	}

	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public String add(User user) {

		userService.save(user);

		return "redirect:/users";
	}

	@RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") Integer id) {

		User user = new User();

		user.setId(id);

		userService.delete(user);

		return "redirect:/users";
	}
	
//	@RequestMapping(value="/user/{id}",method=RequestMethod.GET)
//   	public String  updateUI(@PathVariable("id") Integer id,HttpSession session){
//   		
//         User user=userService.queryOneUser(id);
//         
//         session.setAttribute("u", user);
//           
//       	return "redirect:/changeUser.jsp";
//       	
//   	}
	
	@RequestMapping(value="/monster",method=RequestMethod.PUT)
   	public String  update(User user){
   		
         userService.update(user);
         
         System.out.println(user);
      
       	return "redirect:/users";
       	
   	}

}
