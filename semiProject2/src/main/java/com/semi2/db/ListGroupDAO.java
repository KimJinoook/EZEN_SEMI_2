package com.semi2.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ListGroupDAO {
	private ConnectionPoolMgr pool;
	
	public ListGroupDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public List<ListGroupVO> selectAll() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ListGroupVO> list = new ArrayList<ListGroupVO>();
		
		try {
			con = pool.getConnection();
			String sql = "select * from s2_listgroup";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int group_no = rs.getInt(1);
				String group_name = rs.getString(2);
				ListGroupVO vo = new ListGroupVO(group_no, group_name);
				list.add(vo);
			}
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
