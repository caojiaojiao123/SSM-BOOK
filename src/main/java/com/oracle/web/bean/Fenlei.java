package com.oracle.web.bean;

import java.util.List;

import com.oracle.web.controller.Autowired;
import com.oracle.web.controller.Controller;
import com.oracle.web.controller.HttpServletRequest;
import com.oracle.web.controller.RequestMapping;
import com.oracle.web.controller.Scope;

@Controller
@Scope(value = "prototype")


public class Fenlei {
	
	
	@Autowired
	
    private Integer id;
     @Autowired
    private String name;
     
    @RequestMapping(value = "/addUI", method = RequestMethod.GET)
    public Integer getId(HttpServletRequest request) {
    	
    	List<School> list = name.list();
    	
    	request.setAttribute("sList", list);
    	
        return "add";
    }
    @RequestMapping(value = "/monster/{monsterId}", method = RequestMethod.DELETE)
    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}