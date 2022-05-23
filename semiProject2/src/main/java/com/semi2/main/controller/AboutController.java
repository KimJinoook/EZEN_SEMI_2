package com.semi2.main.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi2.controller.Controller;
import com.semi2.mem.model.MemService;
import com.semi2.review.model.ReviewService;
import com.semi2.store.model.StoreService;
import com.semi2.util.VisitService;

public class AboutController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
	
		//2
		StoreService storeService = new StoreService();
    	int totalStore = 0;
    	
    	MemService memService = new MemService();
    	int totalMem = 0;
    	
    	ReviewService reviewService = new ReviewService();
    	int totalReview = 0;
    	
    	VisitService visitService2 = new VisitService();
    	int totalVisit = 0;
		
		try {
			totalStore = storeService.totalStore();
			totalMem = memService.totalMem();
			totalReview = reviewService.totalReview();
			totalVisit = visitService2.totalVisit();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		request.setAttribute("totalStore", totalStore);
		request.setAttribute("totalMem", totalMem);
		request.setAttribute("totalReview", totalReview);
		request.setAttribute("totalVisit", totalVisit);
		
		
		//4
		return "/about.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
}
