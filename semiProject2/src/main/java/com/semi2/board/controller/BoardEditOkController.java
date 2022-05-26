package com.semi2.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.board.model.BoardService;
import com.semi2.board.model.BoardVO;
import com.semi2.controller.Controller;

public class BoardEditOkController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String no=request.getParameter("no");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String type = request.getParameter("type");
		
		//2
		BoardService boardService = new BoardService();
		BoardVO vo= new BoardVO();
		vo.setContent(content);
		vo.setTitle(title);
		vo.setNo(Integer.parseInt(no));
		
		String msg="글작성 실패", url="b_detail.do?no="+no+"&type="+type;
		try{
			int cnt=boardService.updateBoard(vo);
			//3
			if(cnt>0){
					msg="글쓰기 성공";
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
