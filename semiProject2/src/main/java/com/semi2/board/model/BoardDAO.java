package com.semi2.board.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi2.db.ConnectionPoolMgr;

public class BoardDAO {
	
	private ConnectionPoolMgr pool;
	
	public BoardDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	//글등록
	public int insertBoard(BoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="insert into s2_board(no, id, pwd, title, content, groupNo,btype)"
					+ " values(s2_board_seq.nextval,?,?,?,?,s2_board_seq.nextval,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getTitle());
			ps.setString(4, vo.getContent());
			ps.setInt(5, vo.getBtype());
			
			//4
			int cnt=ps.executeUpdate();
			System.out.println("글등록 결과 cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
			
		}
	}
	
	//전체조회 / 검색
	public List<BoardVO> selectAll(int type, String condition, String keyword) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<BoardVO> list= new ArrayList<BoardVO>();
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from s2_board where btype=?";
			if(keyword!=null && !keyword.isEmpty()) { //검색한다면..
				sql+=" and "+condition+" like '%' || ? || '%'";
			}
			sql+=" order by groupno desc, sortno";
			ps=con.prepareStatement(sql);
			ps.setInt(1,type);
			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(2, keyword);
			}
			
			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("no");
				int readcount=rs.getInt("readcount");
				String id=rs.getString("id");
				String pwd=rs.getString("pwd");
				String title=rs.getString("title");
				String content=rs.getString("content");
				Timestamp regdate=rs.getTimestamp("regdate");
				
				int groupNo=rs.getInt("groupno");
				int step=rs.getInt("step");
				int sortNo=rs.getInt("sortno");
				String delflag=rs.getString("delflag");
				
				BoardVO vo= new BoardVO(no, id, pwd, title, regdate, 
						readcount, content, groupNo, step, sortNo, delflag);
				
				list.add(vo);
			}
			
			System.out.println("전체 조회 결과 list.size="+list.size()
			+", 매개변수 condition="+condition+", keyword="
			+ keyword);
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	//조회수
	public int updateCount(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="update s2_board set readcount=readcount+1"
						+" where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			int cnt=ps.executeUpdate();
			System.out.println("조회수 증가 결과 cnt="+cnt+", 매개변수 no="+no);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
			
		}
	}
	
	//상세보기
	public BoardVO selectByNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		BoardVO vo= new BoardVO();
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from s2_board where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				vo.setNo(no);
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setId(rs.getString("id"));
				vo.setPwd(rs.getString("pwd"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setReadcount(rs.getInt("readcount"));
				
				//
				vo.setGroupNo(rs.getInt("groupno"));
				vo.setStep(rs.getInt("step"));
				vo.setSortNo(rs.getInt("sortno"));
				vo.setDelFlag(rs.getString("delflag"));	
			}
			System.out.println("상세보기 결과 vo="+vo+", 매개변수 no="+no);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	//수정
	public int updateBoard(BoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="update s2_board"
					+ " set title=?, content=?"
					+ " where no=?";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setInt(3, vo.getNo());
			
			//4
			int cnt=ps.executeUpdate();
			
			System.out.println("글 수정 결과 cnt="+cnt+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	//답변
	public int replyBoard(BoardVO vo) throws SQLException {
		Connection con= null;
		PreparedStatement ps=null;
		
		int cnt=0;
		try {
			//1,2
			con=pool.getConnection();
			
			//트랜잭션
			con.setAutoCommit(false);
			
			String sql="update s2_board"
					+" set sortno=sortno+1"
					+" where groupno=? and sortno>?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getGroupNo());
			ps.setInt(2, vo.getSortNo());
			
			cnt=ps.executeUpdate();
			System.out.println("sortNo 업데이트 결과 cnt="+cnt);
			
			
			//3
			sql="insert into s2_board(no, id, pwd, title, content, "
					+ " groupNo, step, sortno,btype)"
					+ " values(s2_board_seq.nextval, ?, ?, ?, ?, ?, ?, ?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getTitle());
			ps.setString(4, vo.getContent());
			ps.setInt(5, vo.getGroupNo());
			ps.setInt(6, vo.getStep()+1);
			ps.setInt(7, vo.getSortNo()+1);
			ps.setInt(8, vo.getBtype());
			
			//4
			cnt=ps.executeUpdate();
			System.out.println("답변 등록 결과 cnt="+cnt+", 매개변수 vo="+vo);
			
			//
			con.commit();
		}catch(SQLException e) {
			con.rollback();
			e.printStackTrace();
		}finally {
			con.setAutoCommit(true);
			pool.dbClose(ps, con);
		}
		
		return cnt;
	}

	//삭제
	public boolean deleteBoard(BoardVO vo) throws SQLException {
		Connection con=null;
		CallableStatement ps=null;
		Boolean bool=true;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="call s2_boardDelete(?,?,?)";
			ps=con.prepareCall(sql);
			
			ps.setInt(1, vo.getGroupNo());
			ps.setInt(2, vo.getStep());
			ps.setInt(3, vo.getNo());
			
			bool=ps.execute();
			System.out.println("글 삭제 결과 bool="+bool+", 매개변수 vo="+vo);
		
			return bool;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}//main