package com.semi2.manager.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;
import com.semi2.list.model.ListService;
import com.semi2.list.model.ListVO;
import com.semi2.listGroup.model.ListGroupService;
import com.semi2.listGroup.model.ListGroupVO;
import com.semi2.mem.model.MemService;
import com.semi2.mem.model.MemVO;
import com.semi2.store.model.StoreService;
import com.semi2.store.model.StoreVO;

public class FormanagerController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		ListService listService = new ListService();
    	
    	StoreService storeService = new StoreService();
    	
    	MemService memService = new MemService();
    	
    	ListGroupService listGroupService = new ListGroupService();
		//2

		
    	List<ListVO> listVoList = null;
    	List<StoreVO> storeVoList = null;
		List<ListGroupVO> groupList = null;
		List<MemVO> memVoList = null;
		
		try {
			listVoList = listService.selectRegion();
			storeVoList = storeService.selectStore(null);
			memVoList = memService.selectAll();
			groupList = listGroupService.selectAll();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		request.setAttribute("listVoList", listVoList);
		request.setAttribute("storeVoList", storeVoList);
		request.setAttribute("groupList", groupList);
		request.setAttribute("memVoList", memVoList);
		
		//4
		return "/formanager.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
