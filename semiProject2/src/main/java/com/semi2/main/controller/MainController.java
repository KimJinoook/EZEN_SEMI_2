package com.semi2.main.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;
import com.semi2.list.model.ListService;
import com.semi2.list.model.ListVO;
import com.semi2.listGroup.model.ListGroupService;
import com.semi2.listGroup.model.ListGroupVO;

public class MainController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
	
		//2
		ListService listService=new ListService();
		ListGroupService listGroupService = new ListGroupService();
		
		List<ListVO> list = null;
		List<ListVO> listList = null;
		List<ListGroupVO> groupList = null;
		
		try {
			list = listService.selectListTop6(); 
			listList = listService.selectRegion();
			groupList = listGroupService.selectAll();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		request.setAttribute("list", list);
		request.setAttribute("listList", listList);
		request.setAttribute("groupList", groupList);
		
		//4
		return "/main.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
