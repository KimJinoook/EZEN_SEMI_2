package com.semi2.menu.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi2.db.ConnectionPoolMgr;

public class MenuDAO {
	private ConnectionPoolMgr pool;
	
	public MenuDAO() {
		pool=new ConnectionPoolMgr();
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
			while(rs.next()) {
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
	
	public int deleteMenu(int st_no, String menu_name) throws SQLException{
		Connection con = null;
		PreparedStatement ps =null;
		try {
			con = pool.getConnection();
			String sql = "delete s2_menu where st_no=? and menu_name=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, st_no);
			ps.setString(2, menu_name);
			int cnt = ps.executeUpdate();
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int insertMenu(MenuVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = pool.getConnection();
			String sql = "insert into s2_menu values(?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getStno());
			ps.setString(2, vo.getMenu_name());
			ps.setInt(3, Integer.parseInt(vo.getMenu_price()));
			ps.setString(4, vo.getMenu_pic());
			int cnt = ps.executeUpdate();
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
}
