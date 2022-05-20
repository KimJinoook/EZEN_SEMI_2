<%@page import="com.semi2.db.MemService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memEdit_ok.jsp</title>
</head>
<body>
<%@ include file="loginCheck.jsp" %>
<%	
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="memService" class="com.semi2.db.MemService"
	scope="session"></jsp:useBean>
<jsp:useBean id="memVo" class="com.semi2.db.MemVO"
	scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="memVo"/>
<%
	String userid = (String)session.getAttribute("userid");

	String msg="비밀번호 체크 실패", url="memEdit.jsp";
	try{
		int result=memService.checkLogin(userid, memVo.getMem_pw());
		if(result==MemService.LOGIN_OK){
			
			int cnt=memService.updateMember(memVo);
			if(cnt>0){
				msg="회원정보가 수정되었습니다.";
			}else{
				msg="회원정보수정 실패했습니다.";
			}
		}else if(result==MemService.DISAGREE_PWD){
			msg="비밀번호가 일치하지 않습니다.";
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