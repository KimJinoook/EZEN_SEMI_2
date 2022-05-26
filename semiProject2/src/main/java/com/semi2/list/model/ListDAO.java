package com.semi2.list.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi2.db.ConnectionPoolMgr;

public class ListDAO {
	private ConnectionPoolMgr pool;
	
	public ListDAO() {
		pool=new ConnectionPoolMgr();
	}
	public int deleteStore(int list_no, int store_no) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = pool.getConnection();
			String sql = "delete s2_listcon where list_no=? and st_no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, list_no);
			ps.setInt(2, store_no);
			int cnt = ps.executeUpdate();
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	public int addStore(int list_no, int store_no) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = pool.getConnection();
			String sql = "insert into s2_listcon(list_no,st_no) values(?,?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, list_no);
			ps.setInt(2, store_no);
			int cnt = ps.executeUpdate();
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	public int insertList(ListVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = pool.getConnection();
			String sql = "insert into s2_list values (s2_list_seq.nextval, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getList_name());
			ps.setString(2, vo.getList_pic());
			ps.setString(3, vo.getList_comment());
			ps.setInt(4, vo.getGroup_no());
			
			int cnt = ps.executeUpdate();
			System.out.println("리스트 추가 cnt = "+cnt);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<ListVO> selectListTop6() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ListVO> list = new ArrayList<ListVO>();
		
		try {
			con = pool.getConnection();
			String sql = "select list_no, list_name, list_pic, list_comment, group_no, rownum from\r\n"
					+ "    (select list_no, list_name, list_pic, list_comment, group_no, (select sum(st_like) from s2_store b where b.st_no in (select st_no from s2_listcon c where c.list_no =a.list_no)) as store_like from s2_list a order by store_like)\r\n"
					+ "    where rownum <= 6";
			
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				ListVO vo = new ListVO();
				vo.setList_no(rs.getInt(1));
				vo.setList_name(rs.getString(2));
				vo.setList_pic(rs.getString(3));
				vo.setList_comment(rs.getString(4));
				
				list.add(vo);
			}
			System.out.println("list.size = "+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public List<ListVO> selectByGroup(int groupno) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ListVO> list= new ArrayList<ListVO>();
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from s2_list where group_no = ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, groupno);			
			//4
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int list_no=rs.getInt("list_no");
				String list_name=rs.getString("list_name");
				String list_pic=rs.getString("list_pic");
				String list_comment=rs.getString("list_comment");
				int group_no = rs.getInt("group_no");
				
				ListVO vo = new ListVO(list_no, list_name, list_pic, list_comment, group_no);
				
				list.add(vo);
			}//while
			
			System.out.println("지역리스트 조회 결과 list.size="+list.size());
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public String getGroupName(int list_no) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String result = "";
		try {
			con = pool.getConnection();
			String sql = "select group_name from s2_listgroup a where a.group_no = (select group_no from s2_list where list_no = ?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, list_no);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public List<ListVO> selectRegion() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ListVO> list= new ArrayList<ListVO>();
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from s2_list";
			ps=con.prepareStatement(sql);
			
			//4
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int list_no=rs.getInt("list_no");
				String list_name=rs.getString("list_name");
				String list_pic=rs.getString("list_pic");
				String list_comment=rs.getString("list_comment");
				int group_no = rs.getInt("group_no");
				
				ListVO vo = new ListVO(list_no, list_name, list_pic, list_comment, group_no);
				
				list.add(vo);
			}//while
			
			System.out.println("지역리스트 조회 결과 list.size="+list.size());
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
