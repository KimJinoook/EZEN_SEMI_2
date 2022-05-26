package com.semi2.manager.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;
import com.semi2.mem.model.MemService;
import com.semi2.store.model.StoreService;

public class StoreDeleteController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String no = request.getParameter("no");
		
		StoreService storeService = new StoreService();
		int cnt = 0;
		try {
			cnt = storeService.deleteStore(Integer.parseInt(no));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		String msg="삭제 실패", url="storeEdit.do?no="+no;
		if(cnt>0) {
			msg = "삭제 성공";
			url = "storecontrol.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		//4
		return "/message.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
