package com.semi2.review.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi2.db.ConnectionPoolMgr;
import com.semi2.mem.model.MemVO;

public class ReviewDAO {
	private ConnectionPoolMgr pool;

	public ReviewDAO() {
		pool=new ConnectionPoolMgr();
	}
	public int totalReview() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int result = 0;
		
		try {
			con = pool.getConnection();
			String sql = "select count(*) from s2_review";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public List<ReviewVO> selectReview(int stno) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ReviewVO> list=new ArrayList<ReviewVO>();
		try {
			con=pool.getConnection();
			
			String sql=" select * from s2_review"
			+ " where st_no=?";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, stno);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int rno=rs.getInt("RE_NO");
				int sno=rs.getInt("ST_NO");
				int mno=rs.getInt("MEM_NO");
				String review=rs.getString("RE_REVIEW");
				int score=rs.getInt("RE_SCORE");
				Timestamp regdate=rs.getTimestamp("RE_REGDATE");
	
				ReviewVO vo = new ReviewVO(rno, sno, mno, review, score, regdate);
						
				list.add(vo);
			}
		}finally {
			pool.dbClose(rs, ps, con);
		}
		return list;
	}
	
	public int insertReview(ReviewVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			String sql="insert into s2_review(RE_NO, ST_NO, MEM_NO, RE_REVIEW, RE_SCORE, RE_REGDATE"
					+ " values(s2_review_seq.nextval,?,?,?,?,?)";
			
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, vo.getStno());
			ps.setInt(2, vo.getMemno());
			ps.setString(3, vo.getReview());
			ps.setFloat(4, vo.getScore());
			ps.setTimestamp(5, vo.getRegdate());
			
			int cnt=ps.executeUpdate();
			System.out.println("���� ��� ��� cnt="+cnt+", �Ű�����"+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int updateReview(ReviewVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="update s2_review"
					+ " set RE_REVIEW=?, RE_SCORE=?"
					+ " where RE_NO=? and ST_NO=? and MEM_NO=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getReno());
			ps.setInt(2, vo.getStno());
			ps.setInt(3, vo.getMemno());

			//4
			int cnt=ps.executeUpdate();
			System.out.println("���� ���� ��� cnt="+cnt+", �Ű����� vo="+vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int deleteReview(int rno, int sno, int mno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql="delete s2_review where RE_NO=? and ST_NO=? and MEM_NO=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, rno);
			ps.setInt(2, sno);
			ps.setInt(3, mno);

			int cnt=ps.executeUpdate();
			System.out.println("���� ���� ��� cnt="+cnt+", �Ű����� rno="+
					rno+", sno="+sno+", mno="+mno);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	

}
