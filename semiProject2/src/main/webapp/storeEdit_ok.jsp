<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.store.model.StoreVO"%>
<%@page import="com.semi2.store.model.StoreService"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

	
	request.setCharacterEncoding("utf-8");

	String upDir="img/store";//업로드할 폴더
	
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
	String pic = mr.getParameter("pic");
	
	if(fileName !=null && !fileName.isEmpty()){
		pic = "img/store/"+fileName;
	}
	
	StoreService storeService = new StoreService();
	StoreVO storeVo = new StoreVO();
	storeVo.setNo(Integer.parseInt(mr.getParameter("no")));
	String no = mr.getParameter("no");
	storeVo.setAdd(mr.getParameter("address"));
	storeVo.setKind(mr.getParameter("kind"));
	storeVo.setLocationlati(mr.getParameter("locationlati"));
	storeVo.setLocationlongi(mr.getParameter("locationlongi"));
	storeVo.setName(mr.getParameter("name"));
	String parking = mr.getParameter("parking");
	if(parking.equals("주차 가능 여부")){
		parking="";
	}
	storeVo.setParking(parking);
	storeVo.setPic(pic);
	storeVo.setPreview(mr.getParameter("preview"));
	storeVo.setPrice(mr.getParameter("price"));
	storeVo.setRestDay(mr.getParameter("restday"));
	storeVo.setTel(mr.getParameter("tel"));
	storeVo.setTime(mr.getParameter("time"));
	
	String msg="수정 실패", url="storeEdit.do?no="+no;
	try{

			
			int cnt=storeService.updateStore(storeVo); 
			if(cnt>0){
				msg="수정완료";
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