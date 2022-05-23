package com.semi2.board.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.board.model.BoardService;
import com.semi2.board.model.BoardVO;
import com.semi2.comment.model.CommentService;
import com.semi2.comment.model.CommentVO;
import com.semi2.controller.Controller;
import com.semi2.list.model.ListService;
import com.semi2.list.model.ListVO;
import com.semi2.listGroup.model.ListGroupService;
import com.semi2.listGroup.model.ListGroupVO;

public class BoardDetailController implements Controller {

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
		
		CommentService commentService= new CommentService();
		List<CommentVO> list=null;
		CommentVO commentVo=null;
		
		try{
			list=commentService.showAll(Integer.parseInt(no));
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("no",no);
		request.setAttribute("type",btype);
		request.setAttribute("vo",vo);
		request.setAttribute("list",list);
		//4
		return "/board/b_detail.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
