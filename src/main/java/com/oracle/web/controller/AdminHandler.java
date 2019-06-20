package com.oracle.web.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.web.bean.Admin;
import com.oracle.web.service.AdminService;

@Controller
@Scope(value = "prototype")
public class AdminHandler {

	private static final String NONE = null;

	@Autowired
	private AdminService adminService;

	// 注册
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(String name, @RequestParam("touxiang") MultipartFile filetx,String username, String password, String phone,
			 HttpServletRequest request)
			throws IllegalStateException, IOException {

		String str = request.getSession().getServletContext().getRealPath("/upload");

		System.out.println(str);
		
		File file = new File(str + "\\" + filetx.getOriginalFilename());

		filetx.transferTo(file);

		String touxiang = str + "\\" + filetx.getOriginalFilename();

		System.out.println(touxiang);

		Admin admin = new Admin(null, name, touxiang, username, password, phone);

		adminService.save(admin);

		return "redirect:/login.jsp";

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String Login(@RequestParam("username") String username, @RequestParam("password") String password,
			Admin admin, HttpServletRequest req, HttpSession session) {

		session.setAttribute("username", username);

		System.out.println(username);

		Admin admin1 = adminService.login(admin.getUsername());

		if (admin1 == null) {

			return "redirect:/login.jsp";

		} else if (!admin1.getPassword().equals(admin.getPassword())) {

			return "redirect:/login.jsp";

		} else {

			String str = admin1.getTouxiang().substring(admin1.getTouxiang().lastIndexOf("\\") + 1);

			session.setAttribute("touxiang", str);

		}

		return "redirect:/index.jsp";

	}

	// 验证用户名

	@RequestMapping(value = "validate2")
	@ResponseBody
	public String queryByName(String username, HttpServletResponse response) throws IOException {

		Admin a = adminService.queryone(username);

		response.setContentType("text/html;charset=utf-8");

		if (a!= null) {

			response.getWriter().write("{\"valid\":\"false\"}");

		} else {

			response.getWriter().write("{\"valid\":\"true\"}");// 不存在

		}

		return NONE;
	}
	
	//验证密码
			@RequestMapping(value = "/queryByPassword",method = RequestMethod.POST)
			@ResponseBody
			public void queryByPassword(@RequestParam("password") String password,HttpServletResponse response,
					HttpServletRequest request,HttpSession session) throws IOException{
				
				response.setContentType("text/html;chatset=utf-8");
				
				String username = (String) session.getAttribute("username");
				
				session.setAttribute("password", password);
				
				Admin admin = new Admin();
				
				admin.setUsername(username);
				
				admin.setPassword(password);
				
				Admin a = adminService.queryByPassword(admin);
				
				int i=1;
				
				if(a==null){
					
					i=1;
					
				}else{
					
					i=0;
				}
				
				response.getWriter().write(String.valueOf(i));
				
			} 

	// 修改密码
	@RequestMapping(value = "/changepassword", method = RequestMethod.POST)
	public String changePassword(@RequestParam("password") String password, HttpServletResponse response,
			HttpServletRequest request, HttpSession session) {

		String username = (String) session.getAttribute("username");

		String newpassword = request.getParameter("newpassword");

		Admin a = adminService.changepassword(username, newpassword);

		return "showAdmin";

	}

	// 查看管理员
	@RequestMapping(value = "/showAdmin", method = RequestMethod.GET)
	public String showAdmin(HttpSession session) {

		String username = (String) session.getAttribute("username");

		System.out.println(username);

		Admin a = adminService.selectByPrimaryKey(username);

		session.setAttribute("admin", a);

		return "redirect:/showAdmin.jsp";

	}

	@RequestMapping(value = "/exitSystem")
	public String exit(HttpSession session, HttpServletResponse resp) {

		// 1.清空session
		session.invalidate();

		// 2.跳转到登录界面
		return "redirect:/login.jsp";

	}
}
