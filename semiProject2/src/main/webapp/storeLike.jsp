<%@page import="com.semi2.util.LikeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	LikeDAO likeDao = new LikeDAO();
    	String stno = request.getParameter("stno");
    	String memno = request.getParameter("memno");
    	String like = request.getParameter("like");
    	
    	if(like.equals("1")){
    		int cnt = likeDao.storeLikePlus(Integer.parseInt(memno), Integer.parseInt(stno));
    	}else if(like.equals("2")){
    		int cnt = likeDao.storeLikeMinus(Integer.parseInt(memno), Integer.parseInt(stno));
    		
    	}
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.close();
</script>
</head>
<body>

</body>
</html>