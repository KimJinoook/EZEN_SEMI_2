package com.semi2.store.model;

import java.sql.SQLException;
import java.util.List;

public class StoreService {
	private StoreDAO storeDao;
	
	public StoreService() {
		storeDao = new StoreDAO();
	}
	
	public int totalStore() throws SQLException {
		return storeDao.totalStore();
	}

	public List<StoreVO> selectStore(String keyword) throws SQLException {
		return storeDao.selectStore(keyword);
	}
	
	public List<StoreVO> selectStore(int listNo) throws SQLException{
		return storeDao.selectStore(listNo);
	}
	public List<StoreVO> selectAll() throws SQLException {
		return storeDao.selectAll();
	}
	
	public StoreVO selectByNo(int no) throws SQLException {
		return storeDao.selectByNo(no);
	}
	
	public int insertStore(StoreVO vo) throws SQLException{
		return storeDao.insertStore(vo);
	}
	public int updateStore(StoreVO vo) throws SQLException{
		return storeDao.updateStore(vo);
	}
	public int deleteStore(int no) throws SQLException {
		return storeDao.deleteStore(no);
	}
}
