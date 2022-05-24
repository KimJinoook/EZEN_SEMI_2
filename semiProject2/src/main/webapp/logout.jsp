<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout.jsp</title>
</head>
<body>
<%
	String loginType = (String)session.getAttribute("loginType");
	
	session.invalidate();
	response.sendRedirect("main.do");
%>
</body>
</html>