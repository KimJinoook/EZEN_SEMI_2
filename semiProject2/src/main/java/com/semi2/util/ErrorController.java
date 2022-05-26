package com.semi2.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;

public class ErrorController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//4
		return "/404.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
