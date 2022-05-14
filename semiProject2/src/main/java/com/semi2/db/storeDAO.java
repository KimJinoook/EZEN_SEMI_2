package com.semi2.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class storeDAO {
	private ConnectionPoolMgr pool;

	public storeDAO() {
		pool=new ConnectionPoolMgr();
	}
	public int totalStore() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int result = 0;
		
		try {
			con = pool.getConnection();
			String sql = "select count(*) from s2_store";
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

	public List<StoreVO> selectStore(String keyword) 
			throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<StoreVO> list=new ArrayList<StoreVO>();
		try {
			//
			con=pool.getConnection();
			
			//
			String sql="select * from s2_store";
			if(keyword!=null && !keyword.isEmpty()) {
				sql+= " where st_no in(select st_no from s2_menu"
						+ " where menu_name like '%' || ? || '%')"
						+ " or st_name like '%' || ? || '%'"
						+ " or st_add like '%' || ? || '%'"
						+ " or st_kind like '%' || ? || '%'";
			}
			sql+=" order by st_no desc";
			ps=con.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
				ps.setString(2, keyword);
				ps.setString(3, keyword);
				ps.setString(4, keyword);
			}
			//
			rs=ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("st_no");
				String name=rs.getString("st_name");
				String add=rs.getString("st_add");
				String tel=rs.getString("st_tel");
				String kind=rs.getString("st_kind");
				String price=rs.getString("st_price");
				String parking=rs.getString("st_parking");
				String time=rs.getString("st_time");
				String restday=rs.getString("st_restday");
				String preview=rs.getString("st_preview");
				Timestamp regdate=rs.getTimestamp("st_regdate");
				String pic=rs.getString("st_pic");
				int like = rs.getInt("st_like");
				int list_no=rs.getInt("list_no");
	
				StoreVO vo = new StoreVO(no, name, add, tel, kind, price, parking, time, restday, preview, regdate, pic, list_no,like);
						
				list.add(vo);
			}
		}finally {
			pool.dbClose(rs, ps, con);
		}
		return list;
	}
}
