package com.semi2.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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

}
