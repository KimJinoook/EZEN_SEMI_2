<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("nick");
	String email=request.getParameter("email");
	String img=request.getParameter("img");
	
	session.setAttribute("userid", userid);
	session.setAttribute("userName", userid);
	session.setAttribute("userpwd", userid);
	session.setAttribute("loginType","kakao");
	System.out.println(userid);
	System.out.println(email);
	System.out.println(img);
	System.out.println("아래");
	response.sendRedirect("main.do");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>