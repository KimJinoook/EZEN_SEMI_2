package com.semi2.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.comment.model.CommentService;
import com.semi2.controller.Controller;

public class BoardCommentDelController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String no=request.getParameter("no");
		String bdNo=request.getParameter("bdNo");
		String type = request.getParameter("type");

		//2
		CommentService commentService= new CommentService();
		
		//2
		
		String msg="삭제 실패", url="b_detail.do?no="+bdNo+"&type="+type;
		try{
			int cnt=commentService.deleteComment(Integer.parseInt(no));
			//3
			if(cnt>0){
					msg="삭제성공";
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
