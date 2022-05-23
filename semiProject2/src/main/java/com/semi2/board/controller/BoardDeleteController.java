package com.semi2.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.board.model.BoardService;
import com.semi2.board.model.BoardVO;
import com.semi2.controller.Controller;

public class BoardDeleteController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String no=request.getParameter("no");
		String groupNo = request.getParameter("groupNo");
		String step = request.getParameter("step");
		String type = request.getParameter("type");
		
		//2
		BoardService boardService = new BoardService();
		BoardVO vo= new BoardVO();
		vo.setNo(Integer.parseInt(no));
		vo.setGroupNo(Integer.parseInt(groupNo));
		vo.setStep(Integer.parseInt(step));
		
		String msg="글작성 실패", url="b_detail.do?no="+no+"&type="+type;
		try{
			
			//3
			if(!boardService.deleteBoard(vo)){
					msg="삭제성공";
					url="b_list.do?type="+type;
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
