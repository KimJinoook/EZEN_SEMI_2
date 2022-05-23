package com.semi2.listGroup.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.semi2.db.ConnectionPoolMgr;

public class ListGroupDAO {
	private ConnectionPoolMgr pool;
	
	public ListGroupDAO() {
		pool=new ConnectionPoolMgr();
	}
	public int updateGroup(int no, String group_name) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = pool.getConnection();
			String sql = "update s2_listgroup set group_name=? where group_no=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, group_name);
			ps.setInt(2, no);
			int cnt = ps.executeUpdate();
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public ListGroupVO selectByNo(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ListGroupVO vo = new ListGroupVO();
		
		try {
			con = pool.getConnection();
			String sql = "select * from s2_listgroup where group_no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				int group_no = rs.getInt(1);
				String group_name = rs.getString(2);
				vo.setGroup_name(group_name);
				vo.setGroup_no(group_no);
				
			}
			System.out.println("vo = "+vo);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
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
	
	public int deleteGroup(int no) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = pool.getConnection();
			String sql = "delete s2_listgroup where group_no = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			int cnt = ps.executeUpdate();
			System.out.println("리스트그룹 삭제 cnt = "+cnt);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int insertGroup(String name) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = pool.getConnection();
			String sql = "insert into s2_listgroup values (s2_listgroup_seq.nextval, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			int cnt = ps.executeUpdate();
			System.out.println("리스트그룹 추가 cnt = "+cnt);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
