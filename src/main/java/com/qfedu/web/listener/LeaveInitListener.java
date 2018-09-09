package com.qfedu.web.listener;

import com.qfedu.service.LeaveService;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class LeaveInitListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        //初始化leave
        LeaveService leaveService =
                WebApplicationContextUtils
                .getWebApplicationContext(sce.getServletContext())
                        .getBean(LeaveService.class);
        leaveService.initPro();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }

}

