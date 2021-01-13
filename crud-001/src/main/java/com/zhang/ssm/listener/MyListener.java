package com.zhang.ssm.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * @author: create by zhl
 * @version: v1.0
 * @description: com.zhang.ssm.listener
 * @date:2021/1/13
 */
public class MyListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext servletContext = sce.getServletContext();
        System.out.println(123);
    }
}
