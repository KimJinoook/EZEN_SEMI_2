<%@page import="com.semi2.menu.model.MenuVO"%>
<%@page import="com.semi2.menu.model.MenuDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");

String upDir="img/menu";//업로드할 폴더

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

MenuDAO menuDao = new MenuDAO();
MenuVO menuVo = new MenuVO();

menuVo.setMenu_name(mr.getParameter("name"));

menuVo.setMenu_pic(pic);

menuVo.setMenu_price(mr.getParameter("price"));

menuVo.setStno(Integer.parseInt(mr.getParameter("stno")));



int cnt=menuDao.insertMenu(menuVo); 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
opener.location.reload();
window.close()
</script>
</body>
</html>