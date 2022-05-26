package com.semi2.manager.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;
import com.semi2.listGroup.model.ListGroupService;

public class ListGroupaddController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String groupname = request.getParameter("groupname");
    	
    	ListGroupService listGroupService = new ListGroupService();
    	int cnt = 0;
		
		
		try {
			cnt = listGroupService.insertGroup(groupname);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		String msg = "그룹 추가 실패", url = "formanager.do";
		if(cnt>0) {
			msg = "그룹 추가 성공";
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
