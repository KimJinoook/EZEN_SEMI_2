package com.semi2.login.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;
import com.semi2.mem.model.MemService;
import com.semi2.mem.model.MemVO;

public class RegisterOkController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String mem_name = request.getParameter("mem_name");
		String mem_birth = request.getParameter("mem_birth");
		String mem_zipcode = request.getParameter("mem_zipcode");
		String mem_add = request.getParameter("mem_add");
		String mem_add2 = request.getParameter("mem_add2");
		String mem_tel = request.getParameter("mem_tel");
		
		MemVO memVo = new MemVO();
		memVo.setMem_id(mem_id);
		memVo.setMem_pw(mem_pw);
		memVo.setMem_name(mem_name);
		memVo.setMem_birth(mem_birth);
		memVo.setMem_zipcode(mem_zipcode);
		memVo.setMem_add(mem_add);
		memVo.setMem_add2(mem_add2);
		memVo.setMem_tel(mem_tel);
		
		MemService memService = new MemService();
		
		String msg="회원가입 실패", url="register.do";
		try{
			System.out.println(memVo);
			
			int cnt=memService.insertMember(memVo);
			
			if(cnt>0){
				msg="회원가입되었습니다.";
				url="login.do";
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/message.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
