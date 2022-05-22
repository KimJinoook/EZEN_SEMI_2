<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.db.BoardVO"%>
<%@page import="com.semi2.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/board/clear.css" />
<link rel="stylesheet" type="text/css" href="css/board/formLayout2.css" />
<link rel="stylesheet" type="text/css"  href="css/board/write2.css">
<title>글 수정</title>
<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<!-- ckeditor -->
<script src="//cdn.ckeditor.com/4.19.0/standard/ckeditor.js"></script>
</head>
<body>
<!-- Navbar Start -->
	<%@include file="navbar.jsp"%>
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
	String no=request.getParameter("no");
	
		if(no==null || no.isEmpty()){ %>
		<script type="text/javascript">
			alert('잘못된 url!');
			location.href="b_list.jsp";
		</script>
	<% return;
		}//if
		
		//2
		BoardDAO dao=new BoardDAO();
		BoardVO vo=null;
		try{
			vo=dao.selectByNo(Integer.parseInt(no));
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		//3
		String content=vo.getContent();
		if(content==null) content="";

%>

<div class="divForm">
<form name="frmEdit" method="post" action="b_edit_ok.jsp">
	
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
            class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block" onclick="location.href	='b_list.jsp'" />         
        </div>
        
 
	</fieldset>
</form>    
</div>
</body>
</html>