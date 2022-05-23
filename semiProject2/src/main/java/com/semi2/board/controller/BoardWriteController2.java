package com.semi2.board.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.board.model.BoardService;
import com.semi2.board.model.BoardVO;
import com.semi2.controller.Controller;
import com.semi2.list.model.ListService;
import com.semi2.list.model.ListVO;
import com.semi2.listGroup.model.ListGroupService;
import com.semi2.listGroup.model.ListGroupVO;

public class BoardWriteController2 implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
	
		String no= request.getParameter("no");
		String btype = request.getParameter("type");
		boolean isReply=false;
		
		String url="",  btLabel="";
		BoardVO vo = null;	

		if(no!=null && !no.isEmpty()){//답변화면
			isReply=true; 
			url="b_reply_ok.do?type="+btype;
			btLabel="답변";
			
			BoardService boardService = new BoardService();
			try{
				vo =boardService.selectByNo(Integer.parseInt(no));
			}catch(SQLException e){
				e.printStackTrace();
			}
		}else{ //일반 글쓰기
			url="b_write_ok.do?type="+btype;
			btLabel="등록";
		}
		request.setAttribute("isReply", isReply);
		request.setAttribute("vo", vo);
		request.setAttribute("url", url);
		request.setAttribute("btLabel", btLabel);
		//4
		return "/board/b_write.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
