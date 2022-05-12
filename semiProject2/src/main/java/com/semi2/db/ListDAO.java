package com.semi2.db;

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
		pool=ConnectionPoolMgr.getInstance();
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
