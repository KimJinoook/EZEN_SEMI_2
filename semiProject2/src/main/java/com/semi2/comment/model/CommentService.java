package com.semi2.comment.model;

import java.sql.SQLException;
import java.util.List;

public class CommentService {
	CommentDAO commentDao;
	
	public CommentService() {
		commentDao=new CommentDAO();
	}
	
	public List<CommentVO> showAll(int bdno) throws SQLException{
		return commentDao.showAll(bdno);
	}
	
	public int insertComment(CommentVO vo) throws SQLException {
		return commentDao.insertComment(vo);
	}
	
	public int deleteComment(int no) throws SQLException {
		return commentDao.deleteComment(no);
	}
}