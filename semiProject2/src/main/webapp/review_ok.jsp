<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.db.MemDAO"%>
<%@page import="com.semi2.db.MemVO"%>
<%@page import="com.semi2.db.ReviewVO"%>
<%@page import="com.semi2.db.ReviewDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.semi2.util.Utility"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try{
		String upDir=Utility.UPLOAD_PATH;
		String saveDir=application.getRealPath(upDir);
		System.out.println("saveDir="+saveDir);
		
		saveDir=config.getServletContext().getRealPath(upDir);
		System.out.println("saveDir="+saveDir);
		
		saveDir=Utility.TEST_PATH;
		System.out.println("testDir="+saveDir);
		
		int maxSize=2*1024*1024;  //업로드 최대용량,2M
		String encoding="utf-8";
		
		//업로드시 동일한 파일명이 있을 경우 나중에 업로드한 파일에 번호를 붙여 이름 변경
		DefaultFileRenamePolicy policy=new DefaultFileRenamePolicy();
		
		MultipartRequest mr
			=new MultipartRequest(request, saveDir, maxSize, encoding, policy);
		System.out.println("업로드 완료");
		
		//업로드한 파일 정보
		String fileName=mr.getFilesystemName("upfile");
		long fileSize=0;
		String originFileName="";
		if(fileName!=null && !fileName.isEmpty()){
			File f = mr.getFile("upfile");
			fileSize=f.length();
			
			originFileName=mr.getOriginalFileName("upfile");
		}
		
		//1
		String title=mr.getParameter("mem_id");
		String name=mr.getParameter("re_review");
		String pwd=mr.getParameter("RE_REGDATE");
		
		//ip 읽어오기
		String ip=request.getRemoteAddr();
		System.out.println("ip="+ip);
		
		ip=request.getRemoteHost();
		System.out.println("ip="+ip);
		
		//2
		ReviewDAO Rdao = new ReviewDAO();
		ReviewVO Rvo = new ReviewVO();
		Rvo.setReview(review);
		Rvo.setRegdate(regdate);
	
		int cnt=Rdao.insertReview(vo);
		
		//3
		if(cnt>0){ %>
			<script type="text/javascript">
				alert("리뷰 작성 성공");
				location.href="review2.jsp?stno="+<%=Rvo.getStno() %>;
			</script>
		<%}else{%>
			<script type="text/javascript">
				alert("리뷰 작성 실패");
				history.back();
			</script>			
		<%}
	}catch(IOException e){
		e.printStackTrace(); %>
		
		<script type="text/javascript">
			alert("2M 이상의 파일은 업로드 불가!");
			history.back();
		</script>
<%	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
%>
</body>
</html>