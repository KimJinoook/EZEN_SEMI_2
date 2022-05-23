package com.semi2.manager.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;
import com.semi2.mem.model.MemService;

public class MemDelOkController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String mem_id = request.getParameter("mem_id");
		
		MemService memService = new MemService();
		int cnt = 0;
		try {
			cnt = memService.deleteMember(mem_id);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		String msg = "실패", url="memcontrol.do";
		if(cnt>0) {
			msg = "성공";
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
