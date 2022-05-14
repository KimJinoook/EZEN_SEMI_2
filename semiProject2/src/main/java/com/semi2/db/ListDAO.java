package com.semi2.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ListDAO {
	private ConnectionPoolMgr pool;
	
	public ListDAO() {
		pool=new ConnectionPoolMgr();
	}
	public List<ListVO> selectListTop6() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ListVO> list = new ArrayList<ListVO>();
		
		try {
			con = pool.getConnection();
			String sql = "select list_no, list_name, list_pic, list_coment, store_like, rownum from\r\n"
					+ "(select list_no, list_name, list_pic, list_coment, (select sum(st_like) from s2_store b where a.list_no=b.list_no) as store_like from s2_list a order by store_like)\r\n"
					+ "where rownum <= 6";
			
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				ListVO vo = new ListVO();
				vo.setList_no(rs.getInt(1));
				vo.setList_name(rs.getString(2));
				vo.setList_pic(rs.getString(3));
				vo.setList_coment(rs.getString(4));
				
				list.add(vo);
			}
			System.out.println("list.size = "+list.size());
			return list;
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
				String list_coment=rs.getString("list_coment");
				
				ListVO vo = new ListVO(list_no, list_name, list_pic, list_coment);
				
				list.add(vo);
			}//while
			
			System.out.println("지역리스트 조회 결과 list.size="+list.size());
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
