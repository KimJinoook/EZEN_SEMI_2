package com.semi2.store.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.semi2.db.ConnectionPoolMgr;

public class StoreDAO {
	private ConnectionPoolMgr pool;

	public StoreDAO() {
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

	public List<StoreVO> selectStore(String keyword) throws SQLException {
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
				String locationlati=rs.getString("st_locationlati");
				String locationlongi=rs.getString("st_locationlongi");
	
				StoreVO vo = new StoreVO(no, name, add, tel, kind, price, parking, time, restday, preview, regdate, pic, like, locationlati, locationlongi);
						
				list.add(vo);
			}
		}finally {
			pool.dbClose(rs, ps, con);
		}
		return list;
	}
	
	public List<StoreVO> selectStore(int listNo) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<StoreVO> list=new ArrayList<StoreVO>();
		try {
			//
			con=pool.getConnection();
			
			//
			String sql=" select * from s2_store"
			+ " where st_no in(select st_no from s2_listcon"
			+ " where list_no in(select list_no from s2_list"
			+ " where list_no=?))";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, listNo);
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
				String locationlati=rs.getString("st_locationlati");
				String locationlongi=rs.getString("st_locationlongi");
	
				StoreVO vo = new StoreVO(no, name, add, tel, kind, price, parking, time, restday, preview, regdate, pic, like, locationlati, locationlongi);
						
				list.add(vo);
			}
		}finally {
			pool.dbClose(rs, ps, con);
		}
		return list;
	}
	public List<StoreVO> selectAll() throws SQLException {
	
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
	
		List<StoreVO> list=new ArrayList<StoreVO>();
		try {
			//1,2
			con=pool.getConnection();
	
			//3
			/*
			 * String sql="select * from s2_store"; if(keyword!=null && !keyword.isEmpty())
			 * { sql+=" where name like '%' || ? || '%' or add like '%' || ? || '%'"; }
			 * ps=con.prepareStatement(sql);
			 * 
			 * if(keyword!=null && !keyword.isEmpty()) { ps.setString(1, keyword); }
			 */
			
			//4
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
				String restDay=rs.getString("st_restDay");
				String preview=rs.getString("st_preview");
				Timestamp regdate=rs.getTimestamp("st_regdate");
				String pic=rs.getString("st_pic");
				int like=rs.getInt("st_like");
				String locationlati=rs.getString("st_locationlati");
				String locationlongi=rs.getString("st_locationlongi");
				
										//no, name, add, tel, kind, price, parking, time, restDay, preview, regdate, pic, list_no, like, location
				StoreVO vo = new StoreVO(no, name, add, tel, kind, price, parking, time, restDay, preview, regdate, pic, like, locationlati, locationlongi);
				
				list.add(vo);
			}
	
			System.out.println("list.size="+list.size()); // + ", keyword=" + keyword
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public StoreVO selectByNo(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		StoreVO vo = new StoreVO();
		
		try {
			con=pool.getConnection();
			
			String sql="select * from s2_store"
					+ " where st_no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			rs=ps.executeQuery();
			
			//no, name, add, tel, kind, price, parking, time, restDay, preview, regdate, pic, list_no
			if(rs.next()) {
				vo.setNo(no);
				vo.setName(rs.getString("st_name"));
				vo.setAdd(rs.getString("st_add"));
				vo.setTel(rs.getString("st_tel"));
				vo.setKind(rs.getString("st_kind"));
				vo.setPrice(rs.getString("st_price"));
				vo.setParking(rs.getString("st_parking"));
				vo.setTime(rs.getString("st_time"));
				vo.setRestDay(rs.getString("st_restDay"));
				vo.setPreview(rs.getString("st_preview"));
				vo.setRegdate(rs.getTimestamp("st_regdate"));
				vo.setPic(rs.getString("st_pic"));
				vo.setLocationlati(rs.getString("st_locationlati"));
				vo.setLocationlongi(rs.getString("st_locationlongi"));
			}
			
			return vo;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int insertStore(StoreVO vo) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			String sql = "insert into s2_store"
					+ " values(s2_store_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate,?,0,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getAdd());
			ps.setString(3, vo.getTel());
			ps.setString(4, vo.getKind());
			ps.setString(5, vo.getPrice());
			ps.setString(6, vo.getParking());
			ps.setString(7, vo.getTime());
			ps.setString(8, vo.getRestDay());
			ps.setString(9, vo.getPreview());
			ps.setString(10, vo.getPic());
			ps.setString(11, vo.getLocationlati());
			ps.setString(12, vo.getLocationlongi());
			
			int cnt = ps.executeUpdate();
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int updateStore(StoreVO vo) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			String sql = "update s2_store\r\n"
					+ "set st_name=?,st_add=?,st_tel=?,st_kind=?,st_price=?,st_parking=?,st_time=?,st_restday=?,st_preview=?,st_pic=?,st_locationlati=?,st_locationlongi=?\r\n"
					+ "where st_no=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getAdd());
			ps.setString(3, vo.getTel());
			ps.setString(4, vo.getKind());
			ps.setString(5, vo.getPrice());
			ps.setString(6, vo.getParking());
			ps.setString(7, vo.getTime());
			ps.setString(8, vo.getRestDay());
			ps.setString(9, vo.getPreview());
			ps.setString(10, vo.getPic());
			ps.setString(11, vo.getLocationlati());
			ps.setString(12, vo.getLocationlongi());
			ps.setInt(13, vo.getNo());
			int cnt = ps.executeUpdate();
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	public int deleteStore(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = pool.getConnection();
			String sql = "delete s2_store where st_no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			int cnt = ps.executeUpdate();
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}