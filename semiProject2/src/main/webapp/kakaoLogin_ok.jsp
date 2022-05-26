<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.mem.model.MemVO"%>
<%@page import="com.semi2.mem.model.MemService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("nick");
	String pwd=request.getParameter("nick");
	String email=request.getParameter("email");
	String img=request.getParameter("img");
	
	session.setAttribute("userid", userid);
	session.setAttribute("userName", userid);
	session.setAttribute("userpwd", userid);
	session.setAttribute("pwd", userid);
	session.setAttribute("loginType","kakao");
	MemService memberService = new MemService();
	
	String msg=userid+"로그인 되었습니다.", url="main.do";
	try{
		int result=memberService.checkLogin(userid, pwd);
		
		if(result==MemService.NONE_USERID){
			MemVO vo = new MemVO();
			vo.setMem_id(userid);
			vo.setMem_name(userid);
			vo.setMem_pw(pwd);
			memberService.insertMember(vo);
			
			vo = memberService.selectByUserid(userid);
			session.setAttribute("curMemVo", vo);
			session.setAttribute("userno", vo.getMem_no());
			
		}else{
			MemVO vo = memberService.selectByUserid(userid);
			session.setAttribute("curMemVo", vo);
			session.setAttribute("userno", vo.getMem_no());
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	System.out.println(userid);
	System.out.println(email);
	System.out.println(img);
	System.out.println("아래");
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="message.jsp"></jsp:forward>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>