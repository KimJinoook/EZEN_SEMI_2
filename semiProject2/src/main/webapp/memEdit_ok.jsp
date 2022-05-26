<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.semi2.mem.model.MemService"%>
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

	String upDir="img/mem";//업로드할 폴더
	
	String saveDir=application.getRealPath(upDir); //업로드할 폴더 절대경로 구하기
	System.out.println("saveDir = "+saveDir);
	
	//saveDir = "C:\\Users\\USER\\Desktop\\test";
	
	int maxSize = 10*1024*1024; // 업로드 최대 용량, 2M
	
	String encoding="utf-8"; // 인코딩 형식
	
	//업로드 시 동일한 파일명이 있을 경우 나중에 업로드한 파일에 번호를 붙여 이름 변경
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	//업로드 최대 용량
	MultipartRequest mr = new MultipartRequest(request, saveDir, maxSize, encoding, policy);
	
	out.print("업로드 완료");
	
	//업로드된 파일 정보 얻어오기
	String fileName = mr.getFilesystemName("fileName"); //변경된 파일명
	String originFileName = mr.getOriginalFileName("fileName"); //원본 파일명
	
	File file = mr.getFile("fileName");
	String mem_pic = mr.getParameter("mem_pic");
	
	if(fileName !=null && !fileName.isEmpty()){
		mem_pic = "img/mem/"+fileName;
	}
%>
<jsp:useBean id="memService" class="com.semi2.mem.model.MemService"
	scope="session"></jsp:useBean>
<jsp:useBean id="memVo" class="com.semi2.mem.model.MemVO"
	scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="memVo"/>
<%
	String userid = (String)session.getAttribute("userid");
	memVo.setMem_id(userid);
	memVo.setMem_pic(mem_pic);
	memVo.setMem_pw(mr.getParameter("mem_pw"));
	memVo.setMem_birth(mr.getParameter("mem_birth"));
	memVo.setMem_tel(mr.getParameter("mem_tel"));
	memVo.setMem_zipcode(mr.getParameter("mem_zipcode"));
	memVo.setMem_add(mr.getParameter("mem_add"));
	memVo.setMem_add2(mr.getParameter("mem_add2"));
	String msg="비밀번호 체크 실패", url="memEdit.do";
	try{
		int result=memService.checkLogin(userid, memVo.getMem_pw());
		System.out.println(userid);
		System.out.println(memVo.getMem_pw());
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