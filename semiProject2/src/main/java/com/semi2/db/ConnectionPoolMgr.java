package com.semi2.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//싱글톤 패턴 적용
public class ConnectionPoolMgr {
private DataSource ds;
	
	public ConnectionPoolMgr() {
		Context ctx;
		
		try {
			ctx = new InitialContext();
			
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracledb");
			System.out.println("ds = "+ds);
		}catch(NamingException e) {
			e.printStackTrace();
			System.out.println("ds 생성 실패");
		}
	}
	
	public Connection getConnection() throws SQLException{
		Connection con = ds.getConnection();
		System.out.println("db연결 여부 con = "+con);
		return con;
	}
	
	public void dbClose(PreparedStatement ps,  Connection con) throws SQLException{
		if(ps!=null) ps.close();
		if(con!=null) con.close();
	}
	
	public void dbClose(ResultSet rs,  PreparedStatement ps,  
			Connection con) throws SQLException{
		if(rs!=null)rs.close();
		if(ps!=null) ps.close();
		if(con!=null) con.close();				
	}
	
	
}//class
