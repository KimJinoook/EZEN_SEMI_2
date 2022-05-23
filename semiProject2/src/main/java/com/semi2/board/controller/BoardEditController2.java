package com.semi2.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.board.model.BoardService;
import com.semi2.board.model.BoardVO;
import com.semi2.controller.Controller;

public class BoardEditController2 implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
	
		String no= request.getParameter("no");
		String btype = request.getParameter("type");
		if(no==null || no.isEmpty()){
			return "board/b_list.do?type="+btype;
		}
		
		BoardService boardService = new BoardService();
		BoardVO vo=null;
	
		try{
			vo =boardService.selectByNo(Integer.parseInt(no));
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("vo", vo);
		request.setAttribute("type", btype);
		request.setAttribute("no", no);
		//4
		return "/board/b_edit.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
