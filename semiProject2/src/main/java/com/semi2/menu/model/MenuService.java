package com.semi2.menu.model;

import java.sql.SQLException;
import java.util.List;

public class MenuService {
	private MenuDAO menuDao;
	
	public MenuService() {
		menuDao = new MenuDAO();
	}
	
	public List<MenuVO> selectAll(int st_no) throws SQLException {
		return menuDao.selectAll(st_no);
	}
}
