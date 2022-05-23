package com.semi2.manager.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;
import com.semi2.list.model.ListService;

public class ListStoreDeleteController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String list_no = request.getParameter("list_no");
		String store_no = request.getParameter("store_no");
		String group_no = request.getParameter("group_no");
		
		ListService listService = new ListService();
		int cnt = 0;
		
		
		try {
			cnt = listService.deleteStore(Integer.parseInt(list_no), Integer.parseInt(store_no));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	
		//4
		return "/list_edit.do?group_no="+group_no;
	}

	@Override
	public boolean isRedirect() {
		return true;
	}
	
}
