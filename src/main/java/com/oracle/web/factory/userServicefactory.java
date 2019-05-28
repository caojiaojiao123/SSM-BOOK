package com.oracle.web.factory;

import com.oracle.web.service.userService;
import com.oracle.web.service.impl.userServicelmpl;

public class userServicefactory {

	public static userServicelmpl getuserServiceImpl(){
		
		return new userServicelmpl();
	}
	
}


