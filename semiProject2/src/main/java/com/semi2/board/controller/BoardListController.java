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

public class BoardListController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
	
		String condition=request.getParameter("searchCondition");
		String keyword=request.getParameter("searchKeyword");
		String btype = request.getParameter("type");
		BoardService boardService = new BoardService();
		
		List<BoardVO> list=null;
		
		try {
			list=boardService.selectAll(Integer.parseInt(btype),condition, keyword);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		request.setAttribute("list", list);
		
		//4
		return "/board/b_list.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
