<%@page import="com.semi2.review.model.ReviewDAO"%>
<%@page import="com.semi2.review.model.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String stno = request.getParameter("stno");
    String memno = request.getParameter("memno");
    String review = request.getParameter("review");
    String score = request.getParameter("score");
    
    ReviewDAO reviewDao = new ReviewDAO();
    ReviewVO reviewVo = new ReviewVO();
    reviewVo.setMemno(Integer.parseInt(memno));
    reviewVo.setReview(review);
    reviewVo.setScore(Float.parseFloat(score));
    reviewVo.setStno(Integer.parseInt(stno));
    int cnt = reviewDao.insertReview(reviewVo);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	location.href="review2.jsp?stno=<%=stno%>";
</script>
</head>
<body>

</body>
</html>