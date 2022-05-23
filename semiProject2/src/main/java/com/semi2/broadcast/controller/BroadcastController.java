package com.semi2.broadcast.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;

public class BroadcastController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//4
		return "/broadcast.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
