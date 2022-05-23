<%@page import="com.semi2.board.model.BoardVO"%>
<%@page import="com.semi2.board.model.BoardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.list 글쓰기
	//2.detail => 답변
	
	String no= request.getParameter("no");
	boolean isReply=(boolean)request.getAttribute("isReply");
	BoardVO vo = (BoardVO)request.getAttribute("vo");
	String url = (String)request.getAttribute("url");
	String btLabel = (String)request.getAttribute("btLabel");
	String type = request.getParameter("type");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">

<meta content="width=device-width, initial-scale=1.0" name="viewport">

<link rel="stylesheet" type="text/css" href="../css/board/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/board/formLayout2.css" />
<link rel="stylesheet" type="text/css"  href="../css/board/write2.css">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="../img/favicon.ico" rel="icon">

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

<title>맛집 추천</title>


<!-- ckeditor -->
<script src="//cdn.ckeditor.com/4.19.0/standard/ckeditor.js"></script>

<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btList').click(function(){
			location.href= 'b_list.do?type=<%=type%>';
		});
	
		$('form[name=frmWrite]').submit(function(){	
			if($.trim($('#title').val()).length<1){
				alert('제목을 입력하세요');
				$('title').focus();
				event.preventDefault(); 
			}else if($('#id').val() =="null" && $('#pwd').val() =="null"){
				alert('로그인이 필요합니다.');
				 event.preventDefault();
			}
		});

	});
	
</script>
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

<div class="divForm">
<form name="frmWrite" method="post" action="<%=url %>" >
	<%if(isReply){ %>
		<input type="hidden" name="groupNo" value="<%=vo.getGroupNo()%>">
		<input type="hidden" name="step" value="<%=vo.getStep()%>">
		<input type="hidden" name="sortNo" value="<%=vo.getSortNo()%>">
	<%} %>
 <fieldset>
	<legend class="m-0 text-primary">
		<%if(isReply){ %>
			답변하기
		<%}else{ 
			if(type.equals("1")){%>
				공지사항
			<%}else if(type.equals("2")){%>
				맛집을 추천합니다
			<%}else if(type.equals("3")){%>
				자유게시판
			<%}else if(type.equals("4")){%>
				Q&A
			<%}%>
			
		<%} %>	
	</legend>
		<!-- 로그인된 아이디/비번 정보 -->
	    <input type="hidden" id="id" name="id" 
         value="<%=session.getAttribute("userid") %>"/>       
        <input type="hidden" id="pwd" name="pwd"
         value="<%=session.getAttribute("pwd") %>"/>
	
		
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="title" name="title"
            	<%if(isReply){ %>
            		value="Re : <%=vo.getTitle() %>"
            	<% }%>
             />
        </div>
        <div class="areaDiv">         
 			<textarea id="content" name="content" rows="12" cols="40"></textarea>
        </div>
        <!-- ckeditor -->
        <script type="text/javascript">
        	CKEDITOR.replace('content');
        </script>
        <!--ckeditor 끝  -->
        
        <div class="center">
            <input type = "submit" id="btSubmit"
			class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block" value="<%=btLabel%>"/>
            <input type = "Button" id="btList" 
            class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block" value="글목록" id="btList"/>         
        </div>
    </fieldset>
</form>
</div>   

</body>
</html>