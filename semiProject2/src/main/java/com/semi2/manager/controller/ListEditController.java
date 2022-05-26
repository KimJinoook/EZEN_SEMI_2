package com.semi2.manager.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;
import com.semi2.list.model.ListService;
import com.semi2.list.model.ListVO;

public class ListEditController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String group_no = request.getParameter("group_no");
		ListService listService = new ListService();
		List<ListVO> listVoList = null;
		
	
		
		try {
			listVoList = listService.selectByGroup(Integer.parseInt(group_no));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		request.setAttribute("listVoList", listVoList);
		
		
		//4
		return "/list_edit.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
