<%@page import="com.semi2.common.Utility"%>
<%@page import="com.semi2.common.PagingVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.db.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi2.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%
	//1 검색 - 파라미터
	request.setCharacterEncoding("utf-8");
	String condition=request.getParameter("searchCondition");
	String keyword=request.getParameter("searchKeyword");
	
	//2
	BoardDAO dao= new BoardDAO();
	
	List<BoardVO> list=null;
	
	try{
		list=dao.selectAll(condition, keyword);
				
	}catch(SQLException e){
		e.printStackTrace();
	}
	
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

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>맛집 추천 게시판</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/board/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="css/board/clear.css" />
<link rel="stylesheet" type="text/css" href="css/board/formLayout3.css" />

 <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
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
				location.href= 'login.jsp';
			
			}else{
				location.href= 'b_write.jsp';
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
	<%@include file="navbar.jsp"%>
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
<h2 class="m-0 text-primary" >맛집 추천</h2>	
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
					 <a href="b_countUpdate.jsp?no=<%=vo.getNo()%>">
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
         value="<%=session.getAttribute("pwd") %>"/>
		<!--  로그인된 아이디/비번 정보 끝-->
    <input type="button" id="bt_write" name="bt_write" value="글쓰기">
</div>
	
<div class="divPage">
	<!-- 이전블럭으로 이동 -->
	<%
		if(pageVo.getFirstPage()>1){ %>
			<a href='b_list.jsp?currentPage=<%=pageVo.getFirstPage()-1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
				<img src='img/board/first.JPG'>
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
	='b_list.jsp?currentPage=<%=i%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
					[<%=i %>]</a>
			<%} %>		
	<%	} //for %>
	<!--  페이지 번호 끝 -->
	
	<!-- 다음 블럭으로 이동 -->
	<%
		if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
			<a href='b_list.jsp?currentPage=<%=pageVo.getLastPage()+1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>'>
				<img src='img/board/last.JPG'>
			</a>	
	<% } %>
</div>
<!-- 검색 -->
<div class="divSearch">
	<form name="frmSearch" method="post" action="b_list.jsp">
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