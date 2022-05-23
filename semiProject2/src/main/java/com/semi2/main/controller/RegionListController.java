package com.semi2.main.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;
import com.semi2.list.model.ListService;
import com.semi2.list.model.ListVO;

public class RegionListController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
	
		ListService listService = new ListService();
		List<ListVO> list= null;
		
		try{
			list=listService.selectRegion();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		//4
		request.setAttribute("list", list);
		return "/regionList.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
