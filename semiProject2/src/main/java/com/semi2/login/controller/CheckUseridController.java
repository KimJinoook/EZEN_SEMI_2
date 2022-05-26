package com.semi2.login.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;
import com.semi2.mem.model.MemService;

public class CheckUseridController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String userid=request.getParameter("userid");
		
		MemService memService = new MemService();
		
		int result=0;
		
		try {
			if(userid!=null && !userid.isEmpty()){
				result=memService.duplicateId(userid);		
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		request.setAttribute("result", result);
		request.setAttribute("userid", userid);
		
		//4
		return "/checkUserid.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
