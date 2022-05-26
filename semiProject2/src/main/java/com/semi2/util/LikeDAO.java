package com.semi2.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.semi2.db.ConnectionPoolMgr;

public class LikeDAO {
	private ConnectionPoolMgr pool;

	public LikeDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public boolean storeIsLike(int mem_no, int st_no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean bool = false;
		int cnt = 0;
		
		try {
			con = pool.getConnection();
			String sql = "select count(*) from s2_storelike where mem_no=? and st_no = ? ";
			ps = con.prepareStatement(sql);
			ps.setInt(1, mem_no);
			ps.setInt(2, st_no);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
			if(cnt>0) bool = true;
			else if(cnt==0) bool = false;
			return bool;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int storeLikePlus(int mem_no, int st_no) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		
		try {
			con = pool.getConnection();
			String sql = "update s2_store set st_like = st_like+1 where st_no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, st_no);
			int cnt = ps.executeUpdate();
			
			String sql2 = "insert into s2_storelike values(?,?)";
			ps2 = con.prepareStatement(sql2);
			ps2.setInt(1, mem_no);
			ps2.setInt(2, st_no);
			cnt = ps2.executeUpdate();
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int storeLikeMinus(int mem_no, int st_no) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		
		try {
			con = pool.getConnection();
			String sql = "update s2_store set st_like = st_like-1 where st_no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, st_no);
			int cnt = ps.executeUpdate();
			
			String sql2 = "delete s2_storelike where mem_no = ? and st_no = ?";
			ps2 = con.prepareStatement(sql2);
			ps2.setInt(1, mem_no);
			ps2.setInt(2, st_no);
			cnt = ps2.executeUpdate();
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public float storeScore(int stno) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		float rst = 0;
		try {
			con = pool.getConnection();
			String sql = "select avg(nvl(re_score,0)) from s2_review where st_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, stno);
			rs = ps.executeQuery();
			if(rs.next()) {
				rst = rs.getFloat(1);
			}
			return rst;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
