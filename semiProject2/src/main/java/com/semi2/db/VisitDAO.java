package com.semi2.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VisitDAO {
	private ConnectionPoolMgr pool;

	public VisitDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public void insertVisit() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = pool.getConnection();
			String sql = "insert into s2_visit values(sysdate)";
			
			ps = con.prepareStatement(sql);
			int cnt = ps.executeUpdate();
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int todayVisit() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			con = pool.getConnection();
			String sql = "select count(*) from s2_visit where to_date(visit_date, 'YYYY-MM-DD') = to_date(sysdate, 'YYYY-MM-DD)";
			ps = con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int totalVisit() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			con = pool.getConnection();
			String sql = "select count(*) from s2_visit";
			ps = con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

}
