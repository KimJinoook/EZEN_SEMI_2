<%@page import="com.semi2.board.model.BoardVO"%>
<%@page import="com.semi2.board.model.BoardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/board/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/board/formLayout2.css" />
<link rel="stylesheet" type="text/css"  href="../css/board/write2.css">
<title>글 수정</title>

	<meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../lib/animate/animate.min.css" rel="stylesheet">
    <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">

<!-- ckeditor -->
<script src="//cdn.ckeditor.com/4.19.0/standard/ckeditor.js"></script>
</head>
<body>
<!-- Navbar Start -->
	<%@include file="../navbar.jsp"%>
	<!-- Navbar End -->

    <!-- 상단 배너 -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown">맛집추천 관련 문구</h1>
        </div>
    </div>
    <!-- 상단 배너 끝 -->
<%
	//1
		String no=(String)request.getAttribute("no");
		String type = (String)request.getAttribute("type");
	
		BoardVO vo=(BoardVO)request.getAttribute("vo");

		
		//3
		String content=vo.getContent();
		if(content==null) content="";

%>

<div class="divForm">
<form name="frmEdit" method="post" action="b_edit_ok.do?type=<%=type%>">
	
	<input type="hidden" name="no" value="<%=no %>" />
	
    <fieldset>
	<legend class="m-0 text-primary" >글수정</legend>
		<!-- 글 작성자의 아이디/비번 정보-->
		<input type="hidden" id="id" name="id" value="<%=vo.getId() %>"/>
		<input type="hidden" id="pwd" name="pwd" value="<%=vo.getPwd() %>"/>

        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" 
            	value="<%=vo.getTitle() %>" />
        </div>
        <div class="areaDiv">       
 			<textarea id="content" name="content" rows="12" cols="40"><%=content %></textarea>
        </div>
         <!-- ckeditor -->
        <script type="text/javascript">
        	CKEDITOR.replace('content');
        </script>
        <!--ckeditor 끝  -->
        
        <div class="center">
            <input type = "submit"  id="btSubmit"
            class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block" value="수정"/>
            <input type = "Button" value="글목록"  id="btList"
            class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block" onclick="location.href	='b_list.do?type=<%=type%>'" />         
        </div>
        
 
	</fieldset>
</form>    
</div>
</body>
</html>