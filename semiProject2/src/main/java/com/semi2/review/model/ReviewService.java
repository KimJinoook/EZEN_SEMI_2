package com.semi2.review.model;

import java.sql.SQLException;

public class ReviewService {
	private ReviewDAO reviewDao;
	
	public ReviewService() {
		reviewDao = new ReviewDAO();
	}
	
	public int totalReview() throws SQLException {
		return reviewDao.totalReview();
	}

}
