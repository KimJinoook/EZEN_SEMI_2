package com.semi2.manager.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;
import com.semi2.store.model.StoreService;
import com.semi2.store.model.StoreVO;

public class ListStoreaddController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String st_name = request.getParameter("st_name");
		String list_no = request.getParameter("list_no");
		String group_no = request.getParameter("group_no");
		
		StoreService storeService = new StoreService();
		List<StoreVO> storeVoList =  null;
		
		try {
			storeVoList =  storeService.selectStore(st_name);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		request.setAttribute("storeVoList", storeVoList);
		
		
		//4
		return "/list_storeadd.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
