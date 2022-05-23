package com.semi2.list.model;

import java.sql.SQLException;
import java.util.List;

public class ListService {
	private ListDAO listDao;
	
	public ListService(){
		this.listDao = new ListDAO();
	}
	
	public int deleteStore(int list_no, int store_no) throws SQLException{
		return listDao.deleteStore(list_no, store_no);
	}
	public int addStore(int list_no, int store_no) throws SQLException{
		return listDao.addStore(list_no, store_no);
	}
	public int insertList(ListVO vo) throws SQLException {
		return listDao.insertList(vo);
	}
	
	public List<ListVO> selectListTop6() throws SQLException{
		return listDao.selectListTop6();
	}
	
	public List<ListVO> selectByGroup(int groupno) throws SQLException{
		return listDao.selectByGroup(groupno);
	}
	
	public String getGroupName(int list_no) throws SQLException{
		return listDao.getGroupName(list_no);
	}
	
	public List<ListVO> selectRegion() throws SQLException{
		return listDao.selectRegion();
	}
}
