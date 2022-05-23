<%@page import="com.semi2.store.model.StoreService"%>
<%@page import="com.semi2.store.model.StoreVO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	String name = mr.getParameter("name");
	String address = mr.getParameter("address");
	String locationlati = mr.getParameter("locationlati");
	String locationlongi = mr.getParameter("locationlongi");
	String preview = mr.getParameter("preview");
	String kind = mr.getParameter("kind");
	String price = mr.getParameter("price");
	String time = mr.getParameter("time");
	String restday = mr.getParameter("restday");
	String parking = mr.getParameter("parking");
	if(parking.equals("주차 가능 여부")){
		parking="";
	}
	System.out.println(parking);
	
	String pic = "img/store/"+fileName;
	
	StoreVO storeVo = new StoreVO();
	storeVo.setName(name);
	storeVo.setAdd(address);
	storeVo.setLocationlati(locationlati);
	storeVo.setLocationlongi(locationlongi);
	storeVo.setPreview(preview);
	storeVo.setKind(kind);
	storeVo.setPrice(price);
	storeVo.setTime(time);
	storeVo.setRestDay(restday);
	storeVo.setParking(parking);
	storeVo.setPic(pic);
	
	StoreService storeService = new StoreService();
	int cnt = storeService.insertStore(storeVo);
	if(cnt>0){
		%><script>alert('추가 성공');
	location.href="storeadd.do"</script><%
			
		}else{
			%><script>alert('리스트추가 실패');
			history.back();</script><%
		}
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