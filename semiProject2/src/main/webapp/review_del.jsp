<%@page import="com.semi2.review.model.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	String stno = request.getParameter("stno");
    	String reno = request.getParameter("reno");
    	
    	ReviewDAO reviewDao = new ReviewDAO();
    	int cnt = reviewDao.deleteReview(Integer.parseInt(reno), Integer.parseInt(stno));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
location.href="review2.jsp?stno=<%=stno%>";
</script>
</body>
</html>