package com.oracle.web.common;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mysql.jdbc.Constants;
import com.oracle.web.bean.Book;
import com.oracle.web.util.RequestUtils;

/**
 * 基础控制层
 * @author lonecloud
 * @version v1.0
 * @date 上午9:18 2017/10/27
 */
public class CommonController {

    protected Logger logger= LoggerFactory.getLogger(getClass());

    protected Book currentUser=null;
    /**
     * 获取user
     * @return
     */
    protected Book getCurrentUser(){
        currentUser=(Book)RequestUtils.getRequest().getSession().getAttribute(Constants.MILLIS_I18N);
        return currentUser;
    }
}
