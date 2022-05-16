package com.semi2.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MenuDAO {
	private ConnectionPoolMgr pool;
	
	public MenuDAO() {
		pool=ConnectionPoolMgr.getInstance();
	}
	
	//int stno, String menu_name, String menu_price, String menu_pic
	public List<MenuVO> selectAll(int st_no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<MenuVO> list = new ArrayList<MenuVO>();
		try {
			con=pool.getConnection();
			
			String sql = "select * from s2_menu where st_no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, st_no);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int stno=rs.getInt("st_no");
				String menu_name=rs.getString("menu_name");
				String menu_price=rs.getString("menu_price");
				String menu_pic=rs.getString("menu_pic");
				
				MenuVO vo = new MenuVO(stno, menu_name, menu_price, menu_pic);
				list.add(vo);
			}
			
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
}
