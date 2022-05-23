package com.semi2.manager.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;
import com.semi2.list.model.ListService;

public class ListStoreaddOkController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String list_no = request.getParameter("list_no");
		String st_no = request.getParameter("st_no");
		String group_no=request.getParameter("group_no");
		
		ListService listService = new ListService();
		int cnt = 0;
		
		try {
			cnt = listService.addStore(Integer.parseInt(list_no), Integer.parseInt(st_no));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		request.setAttribute("cnt", cnt);
		
		
		//4
		return "/list_storeadd_ok.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
