package com.qfedu.web.listener;

import com.qfedu.service.LeaveService;
import org.springframework.web.context.ContextLoaderListener;

import javax.servlet.ServletContextEvent;

public class MySpringListener extends ContextLoaderListener {
    @Override
    public void contextInitialized(ServletContextEvent event) {
        super.contextInitialized(event);
        LeaveService leaveService=getCurrentWebApplicationContext().getBean(LeaveService.class);
        leaveService.initPro();

    }
}
