package com.semi2.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.board.model.BoardService;
import com.semi2.board.model.BoardVO;
import com.semi2.controller.Controller;

public class BoardWriteOkController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String title= request.getParameter("title");
		String id= request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String content=request.getParameter("content");
		String btype = request.getParameter("type");
		
		
		//ip 읽어오기
		String ip=request.getRemoteAddr();
		System.out.println("ip="+ip);
		
		ip=request.getRemoteHost();
		System.out.println("ip="+ip);
		
		//2
		BoardService boardService = new BoardService();
		BoardVO vo = new BoardVO();
		vo.setContent(content);
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setTitle(title);
		vo.setBtype(Integer.parseInt(btype));
		
		String msg="글작성 실패", url="b_write.do?type="+btype;
		try{
			int cnt=boardService.insertBoard(vo);
			//3
			if(cnt>0){

					msg="글쓰기 성공";
					url="b_list.do?type="+btype;
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
