<%@page import="com.semi2.board.model.BoardDAO"%>
<%@page import="com.semi2.util.PagingVO"%>
<%@page import="com.semi2.board.model.BoardVO"%>
<%@page import="com.semi2.util.Utility"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%
	//1 검색 - 파라미터
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	String condition = request.getParameter("condition");
	List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
				
	//페이징 처리
	int currentPage=1; //현재페이지
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt((request.getParameter("currentPage")));
	}
	
	//[1] 현재 페이지와 무관한 변수
	int totalRecord=list.size(); //총 레코드 수
	int pageSize=10; //한 페이지에 보여줄 레코드 수
	int blockSize=10; // 한 블럭에 보여줄 페이지 수
		
	PagingVO pageVo
		=new PagingVO(currentPage, totalRecord, pageSize, blockSize);
		
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	if(keyword==null) keyword="";
	
	String bname = "";
	if(type.equals("1")){
		bname="공지사항";
	}else if(type.equals("2")){
		bname="맛집추천";
	}else if(type.equals("3")){
		bname="자유게시판";
	}else if(type.equals("4")){
		bname="Q&A";
	}
	
	String manager = (String)session.getAttribute("manager");
	boolean b_manager = false;
	if(manager!=null && !manager.isEmpty()){
		b_manager=true;
	}

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>맛객식판</title>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<link rel="stylesheet" type="text/css" href="../css/board/mainstyle.css" />
	<link rel="stylesheet" type="text/css" href="../css/board/clear.css" />
	<link rel="stylesheet" type="text/css" href="../css/board/formLayout3.css" />
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


<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">	
	$(function(){
		$('.divList table.box2 tbody tr').hover(function(){
			$(this).css('background','lightgreen');
		}, function(){
			$(this).css('background','');
		});
		
		$('#bt_write').click(function(){
			if($('#id').val() =="null" && $('#pwd').val() =="null"){
				alert('로그인이 필요합니다.');
				location.href= '../login.do';
			
			}else{
				if(<%=type%>==1 && !<%=b_manager%>){
					alert('권한이 없습니다');
					return false;
				}
				location.href= 'b_write.do?type=<%=type%>';
			}
		});
	});
</script>
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }	
	 
</style>	
</head>
<body>
<!-- Navbar Start -->
	<%@include file="../navbar.jsp"%>
	<!-- Navbar End -->

    <!-- 상단 배너 -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown">이젠 먹으러 갑니다</h1>
        </div>
    </div>
    <!-- 상단 배너 끝 -->

<% if(keyword!=null && !keyword.isEmpty()){ %>
	<p>검색어 : <%=keyword %>, <%=list.size() %>건 검색되었습니다.</p>
<%} %>

<div class="divList">
<h2 class="m-0 text-primary" ><%=bname%></h2>	
	<div class=tb>
	<table class="box2">
		
		<colgroup>
			<col style="width:10%;" />
			<col style="width:50%;" />
			<col style="width:15%;" />
			<col style="width:15%;" />
			<col style="width:10%;" />		
		</colgroup>
	
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		
		<tbody>
		<%if(list.isEmpty()){ %>
			<tr>
				<td colspan="5" class="align_center">해당 글이 존재하지 않습니다.</td>
			</tr>
		<%}else{ %>
			<!--게시판 내용 반복문 시작  -->
			<%
			int num=pageVo.getNum(); //페이지당 시작 글번호 17,12,7 ~
			int curPos= pageVo.getCurPos(); //페이지당 시작 index 0,10,20 ~
			
			for(int i=0;i<pageVo.getPageSize();i++){ //페이지 사이즈 10
			  	if(num-- <1) break;
			  	
			  	BoardVO vo = list.get(curPos++);
			%>
		<!-- 게시판 내용 반복문 시작 -->
			<tr style="text-align:center">
				<td><%=vo.getNo() %></td>
				
				<td style="text-align:left">
				<% if(vo.getDelFlag().equals("Y")){ %>
					 <span style="color: lightgray">삭제된 글입니다</span>
				<%}else{ %>
						<!-- 답변글인 경우 이미지 넣기 -->
					 <%=Utility.displayRe(vo.getStep()) %>
					 
					 <!-- 제목이 긴 경우 일부 글자만 보여주기 -->
					 <a href="b_countUpdate.do?no=<%=vo.getNo()%>&type=<%=type%>">
						<%=Utility.cutString(vo.getTitle(), 30) %>
					</a>
					
					<!-- 24시간 이내의 글인 경우 new 이미지 보여주기 -->
					<%=Utility.displayNew(vo.getRegdate()) %>
				<%} %>
				</td>
				
				<td><%=vo.getId() %></td>
				<td><%=sdf.format(vo.getRegdate()) %></td>
				<td><%=vo.getReadcount() %></td>
			</tr>
			<% }//for%>
			<!-- 반복끝 -->
		<%}//if %>
		</tbody>
	</table>
</div>
<div class="divBtn">
	<!-- 로그인된 아이디/비번 정보 -->
	    <input type="hidden" id="id" name="id" 
         value="<%=session.getAttribute("userid") %>"/>       
        <input type="hidden" id="pwd" name="pwd"
         value="<%=session.getAttribute("userpwd") %>"/>
		<!--  로그인된 아이디/비번 정보 끝-->
    <input type="button" id="bt_write" name="bt_write" value="글쓰기">
</div>
	
<div class="divPage">
	<!-- 이전블럭으로 이동 -->
	<%
		if(pageVo.getFirstPage()>1){ %>
			<a href='b_list.do?type<%=type%>&currentPage=<%=pageVo.getFirstPage()-1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
				<img src='../img/board/first.JPG'>
			</a>	
	<%	} %>

	<!-- 페이지 번호 추가 -->						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%
		for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){
			if(i>pageVo.getTotalPage()) break;  
			
			if(i==currentPage){	%>
				<span style="color: green;font-weight: bold;font-size: 1em">
					<%=i %></span>
			<%}else{ %>
				<a href
	='b_list.do?type<%=type%>&currentPage=<%=i%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
					[<%=i %>]</a>
			<%} %>		
	<%	} //for %>
	<!--  페이지 번호 끝 -->
	
	<!-- 다음 블럭으로 이동 -->
	<%
		if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
			<a href='b_list.do?type<%=type%>&currentPage=<%=pageVo.getLastPage()+1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
				<img src='../img/board/last.JPG'>
			</a>	
	<% } %>
</div>
<!-- 검색 -->
<div class="divSearch">
	<form name="frmSearch" method="post" action="b_list.do?type<%=type%>">
		<select name="searchCondition">
		
			<option value="title"
			<%if("title".equals(condition)) { %>
				selected="selected"
			<%} %>
			>제목</option>
			
			<option value="content"
			<%if("content".equals(condition)) { %>
				selected="selected"
			<%} %>
			>내용</option>
			
			<option value="id"
			<%if("id".equals(condition)) { %>
				selected="selected"
			<%} %>
			>작성자</option>
		</select>
		<input type="text" name="searchKeyword" title="검색어 입력" value="<%=keyword %>">
		<input type="submit" value="검색">	
	</form>
</div>


</div>
</body>
</html>