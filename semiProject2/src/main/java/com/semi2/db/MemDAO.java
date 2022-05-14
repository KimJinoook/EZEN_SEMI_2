package com.semi2.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class MemDAO {
	private ConnectionPoolMgr pool;

	public MemDAO() {
		pool=new ConnectionPoolMgr();
	}
	public int totalMem() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int result = 0;
		
		try {
			con = pool.getConnection();
			String sql = "select count(*) from s2_mem";
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

	public List<MemVO> selectAll() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<MemVO> list = new ArrayList<MemVO>();
		
		try {
			con = pool.getConnection();
			String sql = "select * from s2_mem";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemVO vo = new MemVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),rs.getString(7), rs.getString(8));
				list.add(vo);
			}
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
