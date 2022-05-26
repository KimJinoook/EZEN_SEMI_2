package com.semi2.manager.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;
import com.semi2.list.model.ListService;
import com.semi2.list.model.ListVO;
import com.semi2.listGroup.model.ListGroupService;
import com.semi2.listGroup.model.ListGroupVO;

public class ListGroupEditController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String groupNo = request.getParameter("no");
		
		ListGroupService listGroupService = new ListGroupService();
		ListGroupVO groupVo = null;
		
		ListService listService = new ListService();
		List<ListVO> listVoList = null;

		
		try {
			groupVo = listGroupService.selectByNo(Integer.parseInt(groupNo));
			listVoList = listService.selectByGroup(Integer.parseInt(groupNo));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		request.setAttribute("listVoList", listVoList);
		request.setAttribute("groupVo", groupVo);
		
		
		//4
		return "/listgroup_edit.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
