package com.semi2.listGroup.model;

import java.sql.SQLException;
import java.util.List;

public class ListGroupService {
	private ListGroupDAO listGroupDao;
	
	public ListGroupService() {
		listGroupDao = new ListGroupDAO();
	}
	
	public int updateGroup(int no, String group_name) throws SQLException{
		return listGroupDao.updateGroup(no, group_name);
	}
	
	public ListGroupVO selectByNo(int no) throws SQLException {
		return listGroupDao.selectByNo(no);
	}
	
	public List<ListGroupVO> selectAll() throws SQLException {
		return listGroupDao.selectAll();
	}
	
	public int deleteGroup(int no) throws SQLException{
		return listGroupDao.deleteGroup(no);
	}
	
	public int insertGroup(String name) throws SQLException{
		return listGroupDao.insertGroup(name);
	}
}
