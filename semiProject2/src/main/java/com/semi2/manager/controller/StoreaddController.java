package com.semi2.manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;

public class StoreaddController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		
		//4
		return "/storeadd.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
