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

public class BoardCountUpdateController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
	
		String no=request.getParameter("no");
		String type = request.getParameter("type");
		if(no==null || no.isEmpty()){
			return "/board/b_list.do?type="+type;
		}
		BoardService boardService = new BoardService();
		String result="";
		try{
			int cnt=boardService.updateCount(Integer.parseInt(no));
			
			if(cnt>0){
				result = "/board/b_detail.do?no="+no+"&type="+type;
			}else{
				result = "/board/b_list.do?type="+type;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		//4
		return result;
	}

	@Override
	public boolean isRedirect() {
		return true;
	}
	
}
