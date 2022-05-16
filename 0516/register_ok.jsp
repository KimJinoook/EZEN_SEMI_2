<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register_ok.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="memService" class="com.semi2.db.MemService"
	scope="session"></jsp:useBean>
<jsp:useBean id="memVo" class="com.semi2.db.MemVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="memVo"/>

<%
	String msg="회원가입 실패", url="register.jsp";
	try{
		System.out.println(memVo);
		
		int cnt=memService.insertMember(memVo);
		
		if(cnt>0){
			msg="회원가입되었습니다.";
			url="login.jsp";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="message.jsp"></jsp:forward>

</body>
</html>