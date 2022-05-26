<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.mem.model.MemService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memOut_ok.jsp</title>
</head>
<body>
<jsp:useBean id="memService" class="com.semi2.mem.model.MemService"
	scope="session"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
	String userid=(String)session.getAttribute("userid");
	String pwd=request.getParameter("mem_pw");
	
	String msg="비밀번호 체크 실패", url="memOut.do";
	
	try{
		int result=memService.checkLogin(userid, pwd);
		
		if(result==MemService.LOGIN_OK){
			int cnt=memService.deleteMember(userid);
			if(cnt>0){
				msg="회원탈퇴 되었습니다.";
				url="main.do"; 
				
				session.invalidate();
			}else{
				msg="회원탈퇴 실패되었습니다.";
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