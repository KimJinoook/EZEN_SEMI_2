package com.semi2.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VisitService {
	private VisitDAO visitDao;
	
	public VisitService() {
		visitDao = new VisitDAO();
	}
	
	public void insertVisit() throws SQLException {
		visitDao.insertVisit();
	}
	
	public int todayVisit() throws SQLException {
		return visitDao.todayVisit();
	}
	
	public int totalVisit() throws SQLException{
		return visitDao.totalVisit();
	}
}
