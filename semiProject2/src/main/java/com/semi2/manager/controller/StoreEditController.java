package com.semi2.manager.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;
import com.semi2.store.model.StoreService;
import com.semi2.store.model.StoreVO;

public class StoreEditController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String no = request.getParameter("no");
		
		StoreService storeService = new StoreService();
		
		StoreVO vo = null;
		try {
			vo = storeService.selectByNo(Integer.parseInt(no));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("vo", vo);
		return "/storeEdit.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
