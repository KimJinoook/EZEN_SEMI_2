package com.semi2.board.model;

import java.sql.SQLException;
import java.util.List;

public class BoardService {
	private BoardDAO boardDao;
	
	public BoardService() {
		boardDao = new BoardDAO();
	}
	
	public int insertBoard(BoardVO vo) throws SQLException {
		return boardDao.insertBoard(vo);
	}
	
	//전체조회 / 검색
	public List<BoardVO> selectAll(int type, String condition, String keyword) throws SQLException{
		return boardDao.selectAll(type, condition, keyword);
	}
	
	//조회수
	public int updateCount(int no) throws SQLException {
		return boardDao.updateCount(no);
	}
	
	//상세보기
	public BoardVO selectByNo(int no) throws SQLException {
		return boardDao.selectByNo(no);
	}
	
	//수정
	public int updateBoard(BoardVO vo) throws SQLException {
		return boardDao.updateBoard(vo);
	}
	
	//답변
	public int replyBoard(BoardVO vo) throws SQLException {
		return boardDao.replyBoard(vo);
	}

	//삭제
	public boolean deleteBoard(BoardVO vo) throws SQLException {
		return boardDao.deleteBoard(vo);
	}
}
