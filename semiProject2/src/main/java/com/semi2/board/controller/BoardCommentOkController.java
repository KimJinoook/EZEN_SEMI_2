package com.semi2.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.board.model.BoardService;
import com.semi2.board.model.BoardVO;
import com.semi2.comment.model.CommentService;
import com.semi2.comment.model.CommentVO;
import com.semi2.controller.Controller;

public class BoardCommentOkController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String bdNo=request.getParameter("bdNo"); //부모키
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String content=request.getParameter("content2");
		String type = request.getParameter("type");
		
		//2
		CommentService commentService = new CommentService();
		CommentVO vo= new CommentVO();

		vo.setBdNo(Integer.parseInt(bdNo));
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setContent(content);
		
		String msg="글작성 실패", url="b_detail.do?no="+bdNo+"&type="+type;
		try{
			int cnt=commentService.insertComment(vo);
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
