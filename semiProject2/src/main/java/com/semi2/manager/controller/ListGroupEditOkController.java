package com.semi2.manager.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;
import com.semi2.listGroup.model.ListGroupService;

public class ListGroupEditOkController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String no = request.getParameter("groupNo");
		String group_name = request.getParameter("group_name");
		
		ListGroupService listGroupService = new ListGroupService();
		int cnt = 0;
		
		try {
			cnt = listGroupService.updateGroup(Integer.parseInt(no), group_name);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		String msg = "실패", url="listgroup_edit.do?no="+no;
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
