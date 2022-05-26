package com.semi2.mem.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.semi2.db.ConnectionPoolMgr;

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
			System.out.println("�쉶�썝媛��엯 寃곌낵 cnt="+cnt+", �엯�젰媛� vo="+vo);
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
					result=MemService.UNUSABLE_ID; //�븘�씠�뵒 議댁옱, �궗�슜遺덇�
				}else {
					result=MemService.USABLE_ID; //�븘�씠�뵒 �궗�슜媛��뒫
				}
			}
			System.out.println("�븘�씠�뵒 以묐났�솗�씤 寃곌낵 result="+result+", 留ㅺ컻蹂��닔 userid="+userid);
			
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int checkLogin(String userid, String pwd) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		int result=0;
		try {
			con=pool.getConnection();
			String sql="select mem_pw from s2_mem where mem_id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbPwd=rs.getString(1);
				if(dbPwd.equals(pwd)) {
					result=MemService.LOGIN_OK;
				}else {
					result=MemService.DISAGREE_PWD;
				}
			}else {
				result=MemService.NONE_USERID;
			}
			
			System.out.println("濡쒓렇�씤 泥댄겕 寃곌낵 result="+result
					+", 留ㅺ컻蹂��닔 userid="+userid+", pwd="+pwd);
			return result;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public MemVO selectByUserid(String userid) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		MemVO vo = new MemVO();
		try {
			con=pool.getConnection();
			String sql="select * from s2_mem where mem_id=?";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, userid);
			rs=ps.executeQuery();
			if(rs.next()) {
				vo.setMem_no(rs.getInt("mem_no"));
				vo.setMem_name(rs.getString("mem_name"));
				vo.setMem_id(userid);
				vo.setMem_pw(rs.getString("mem_pw"));
				vo.setMem_birth(rs.getString("mem_birth"));
				vo.setMem_tel(rs.getString("mem_tel"));
				vo.setMem_zipcode(rs.getString("mem_zipcode"));
				vo.setMem_add(rs.getString("mem_add"));
				vo.setMem_add2(rs.getString("mem_add2"));
				vo.setMem_pic(rs.getString("mem_pic"));
				vo.setMem_manager(rs.getString("mem_manager"));
			}
			System.out.println("�븘�씠�뵒濡� 議고쉶 寃곌낵 vo="+vo+", 留ㅺ컻蹂��닔 userid="+userid);
			
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int updateMember(MemVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			String sql="update s2_mem"
					+ " set mem_birth=?, mem_tel=?, mem_zipcode=?, mem_add=?, mem_add2=?, mem_pic=?"
					+ " where mem_id=?";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getMem_birth());
			ps.setString(2, vo.getMem_tel());
			ps.setString(3, vo.getMem_zipcode());
			ps.setString(4, vo.getMem_add());
			ps.setString(5, vo.getMem_add2());
			ps.setString(6, vo.getMem_pic());
			ps.setString(7, vo.getMem_id());
			
			int cnt=ps.executeUpdate();
			System.out.println("�쉶�썝 �닔�젙 寃곌낵 cnt="+cnt+", 留ㅺ컻蹂��닔 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<MemVO> selectMem(String keyword) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<MemVO> list=new ArrayList<MemVO>();
		try {
			//
			con=pool.getConnection();
			
			//
			String sql="select * from s2_mem";
			if(keyword!=null && !keyword.isEmpty()) {
				sql+= " where mem_id like '%' || ? || '%'";
			}
			sql+=" order by mem_no desc";
			ps=con.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);

			}
			//
			rs=ps.executeQuery();
			while(rs.next()) {
				MemVO vo = new MemVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6),rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
				list.add(vo);	
			}
		}finally {
			pool.dbClose(rs, ps, con);
		}
		return list;
	}
	
	public int deleteMember(String userid) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="delete s2_mem"
					+ " where mem_id=?";
			ps=con.prepareStatement(sql);			
			ps.setString(1, userid);
			
			int cnt=ps.executeUpdate();
			System.out.println("�쉶�썝 �깉�눜 寃곌낵 cnt="+cnt+", 留ㅺ컻蹂��닔 userid="+userid);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public MemVO selectByNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		MemVO vo = new MemVO();
		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select * from s2_mem where mem_no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);

			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				vo.setMem_no(no);
				vo.setMem_name(rs.getString("MEM_NAME"));
				vo.setMem_id(rs.getString("MEM_ID"));
				vo.setMem_pw(rs.getString("MEM_PW"));
				vo.setMem_birth(rs.getString("MEM_BIRTH"));
				vo.setMem_tel(rs.getString("MEM_TEL"));
				vo.setMem_zipcode(rs.getString("MEM_ZIPCODE"));		
				vo.setMem_add(rs.getString("MEM_ADD"));
				vo.setMem_add2(rs.getString("MEM_ADD2"));
				vo.setMem_pic(rs.getString("MEM_PIC"));
				vo.setMem_manager(rs.getString("MEM_MANAGER"));
			}

			System.out.println("vo="+vo+", 매개변수 no="+no);

			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
