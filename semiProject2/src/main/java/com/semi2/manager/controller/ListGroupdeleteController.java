package com.semi2.manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;

public class ListGroupdeleteController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		

		String no = request.getParameter("no");
		request.setAttribute("no", no);
		
		//4
		return "/listgroup_delete.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
