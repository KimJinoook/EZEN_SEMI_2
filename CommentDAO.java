package com.semi2.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
	ConnectionPoolMgr pool;
	
	public CommentDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public List<CommentVO> showAll(int bdno) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<CommentVO> list=new ArrayList<CommentVO>();
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from s2_comment where bdNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, bdno);
			
			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("no");
				String id=rs.getString("id");
				String pwd=rs.getString("pwd");
				Timestamp regdate=rs.getTimestamp("regdate");
				String content=rs.getString("content");
				int bdNo=bdno;
				
				CommentVO vo = new CommentVO(no, id, pwd, regdate, content, bdNo);
				
				list.add(vo);
			}
			
			System.out.println("조회 결과 list.size()="+list.size()+", 매개변수 bdno="+bdno);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
			
		}
	}
	
	public int insertComment(CommentVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="insert into s2_comment(no, id, pwd, content, bdNo)"
					+ " values(s2_comment_seq.nextval, ?, ?, ?, ?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getContent());
			ps.setInt(4, vo.getBdNo());
			
			//4
			int cnt=ps.executeUpdate();
			System.out.println("댓글 등록 결과 cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
			
		}
	}
	
	public int deleteComment(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="delete from s2_comment where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			//4
			int cnt=ps.executeUpdate();
			System.out.println("댓글 삭제 결과 cnt="+cnt+", 매개변수 no="+no);
			
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}
		
	}
}
