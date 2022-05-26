package com.semi2.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.board.model.BoardService;
import com.semi2.board.model.BoardVO;
import com.semi2.controller.Controller;

public class BoardReplyOkController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String title= request.getParameter("title");
		String id= request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String content=request.getParameter("content");
		String btype = request.getParameter("type");
		
		//상위글
		String groupNo=request.getParameter("groupNo");
		String step=request.getParameter("step");
		String sortNo=request.getParameter("sortNo");
		
		//2
		BoardService boardService = new BoardService();
		BoardVO vo= new BoardVO();
		vo.setContent(content);
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setTitle(title);
		vo.setBtype(Integer.parseInt(btype));
		
		vo.setGroupNo(Integer.parseInt(groupNo));
		vo.setStep(Integer.parseInt(step));
		vo.setSortNo(Integer.parseInt(sortNo));
		
		String msg="글작성 실패", url="b_list.do?type="+btype;
		try{
			int cnt=boardService.replyBoard(vo);
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
