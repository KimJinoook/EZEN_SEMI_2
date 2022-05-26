package com.semi2.manager.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;
import com.semi2.mem.model.MemService;
import com.semi2.mem.model.MemVO;

public class MemcontrolController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String keyword=request.getParameter("keywordid");	
		
		//2
		MemService memService = new MemService();

		List<MemVO> list=null;
		try{
			list=memService.selectMem(keyword);	
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("list", list);
		
		//4
		return "/memcontrol.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
