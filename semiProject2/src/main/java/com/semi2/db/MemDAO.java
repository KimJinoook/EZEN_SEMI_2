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
				MemVO vo = new MemVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6),rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
				list.add(vo);
			}
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int insertMember(MemVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			String sql="insert into s2_mem(mem_no, mem_name, mem_id, mem_pw, mem_birth, mem_tel, mem_zipcode, mem_add, mem_add2, mem_pic)\r\n"
					+ "values(s2_mem_seq.nextval,?,?,?,?,?,?,?,?,?)";
			
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getMem_name());
			ps.setString(2, vo.getMem_id());
			ps.setString(3, vo.getMem_pw());
			ps.setString(4, vo.getMem_birth());
			ps.setString(5, vo.getMem_tel());
			ps.setString(6, vo.getMem_zipcode());
			ps.setString(7, vo.getMem_add());
			ps.setString(8, vo.getMem_add2());
			ps.setString(9, vo.getMem_pic());
			
			int cnt=ps.executeUpdate();
			System.out.println("회원가입 결과 cnt="+cnt+", 입력값 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int duplicateId(String userid) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		int result=0;
		try {
			con=pool.getConnection();
			String sql="select count(*) from s2_mem where mem_id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int count=rs.getInt(1);
				if(count >0) {
					result=MemService.UNUSABLE_ID; //아이디 존재, 사용불가
				}else {
					result=MemService.USABLE_ID; //아이디 사용가능
				}
			}
			System.out.println("아이디 중복확인 결과 result="+result+", 매개변수 userid="+userid);
			
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
