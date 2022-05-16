package com.semi2.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class StoreDAO {
	private ConnectionPoolMgr pool;
	
	public StoreDAO() {
		pool=ConnectionPoolMgr.getInstance();
	}
	
	/*
	 * public int insertStore(StoreVO vo) throws SQLException { Connection con=null;
	 * PreparedStatement ps=null;
	 * 
	 * try { con=pool.getConnection();
	 * 
	 * //int no, String name, String add, String tel, String kind, String price,
	 * String parking, String time, String restDay, String preview, Timestamp
	 * regdate, String pic, int list_no //no, name, add, tel, kind, price, parking,
	 * time, restDay, preview, regdate, pic, list_no String
	 * sql="insert into s2_store" +
	 * " values(s2_store_seq, ?,?,?,?,?,?,?,?,?,?,?,?,?)";
	 * ps=con.prepareStatement(sql); ps.setString(1, vo.getName()); ps.setString(2,
	 * vo.getAdd()); ps.setString(3, vo.getTel()); ps.setString(4, vo.getKind());
	 * ps.setString(5, vo.getPrice()); ps.setString(6, vo.getParking());
	 * ps.setString(7, vo.getTime()); ps.setString(8, vo.getRestDay());
	 * ps.setString(9, vo.getPreview()); ps.setTimestamp(10, vo.getRegdate());
	 * ps.setString(11, vo.getPic()); ps.setInt(11, vo.getList_no());
	 * 
	 * //4 int cnt=ps.executeUpdate();
	 * System.out.println("맛집 등록 결과 cnt="+cnt+", 매개변수 vo="+vo);
	 * 
	 * return cnt; }finally { pool.dbClose(ps, con); } }
	 */
	
	public List<StoreVO> selectAll() 
			throws SQLException {
	
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
			int list_no=rs.getInt("list_no");
			int like=rs.getInt("st_like");
			String location=rs.getString("st_location");
			
									//no, name, add, tel, kind, price, parking, time, restDay, preview, regdate, pic, list_no, like, location
			StoreVO vo = new StoreVO(no, name, add, tel, kind, price, parking, time, restDay, preview, regdate, pic, list_no, like, location);
			
			list.add(vo);
		}

		System.out.println("list.size="+list.size()); // + ", keyword=" + keyword
		
		return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	/*
	 * public int menucount(int no) throws SQLException { Connection con = null;
	 * PreparedStatement ps = null; ResultSet rs = null; int count = 0;
	 * 
	 * try { String sql = "select count(*) from s2_menu" + " where st_no=?;";
	 * ps=con.prepareStatement(sql); ps.setInt(1, no);
	 * 
	 * rs=ps.executeQuery(); } catch (SQLException e) { e.printStackTrace(); }
	 * finally { pool.dbClose(rs, ps, con); }
	 * 
	 * return count; }
	 */
	
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
				vo.setName(rs.getString("name"));
				vo.setAdd(rs.getString("add"));
				vo.setTel(rs.getString("tel"));
				vo.setKind(rs.getString("kind"));
				vo.setPrice(rs.getString("price"));
				vo.setParking(rs.getString("parking"));
				vo.setTime(rs.getString("time"));
				vo.setRestDay(rs.getString("restDay"));
				vo.setPreview(rs.getString("preview"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setPic(rs.getString("pic"));
				vo.setList_no(rs.getInt("list_no"));
			}
			
			return vo;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
