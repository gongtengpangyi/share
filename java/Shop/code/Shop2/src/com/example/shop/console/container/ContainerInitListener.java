package com.example.shop.console.container;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContainerInitListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("context initing...");
		ContextReader reader = new ContextReader();
		reader.parseXml("/context.xml");
		
	}

}
