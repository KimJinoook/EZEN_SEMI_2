<%@page import="com.semi2.list.model.ListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	int cnt = (int)request.getAttribute("cnt");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "js/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		opener.parent.location.reload();
		window.close()
	});
	
</script>
</head>
<body>

</body>
</html>