<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.db.StoreVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.semi2.db.ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi2.db.ReviewDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	ReviewDAO dao=new ReviewDAO();
	ReviewVO vo = new ReviewVO();
	StoreVO svo=new StoreVO();

	List<ReviewVO> list=null;
	try{
		list=dao.selectStore(vo.getStno());
	}catch(SQLException e){
		e.printStackTrace();
	}
	

	int currentPage=1;
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt((request.getParameter("currentPage")));
	}
	
	int totalRecord=list.size();
	int pageSize=5;
	int totalPage=(int)Math.ceil((float)totalRecord/pageSize);
	int blockSize=10;
	int	firstPage=currentPage-((currentPage-1)%blockSize);
	int lastPage=firstPage+(blockSize-1);
	int curPos=(currentPage-1)*pageSize;
	int num=totalRecord-curPos;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="css/clear.css" />
<link rel="stylesheet" type="text/css" href="css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="css/mystyle.css" />
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">	
	$(function(){
		$('.divList table.box2 tbody tr').hover(function(){
			$(this).css('background','lightblue');
		}, function(){
			$(this).css('background','');
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
<h2><%=svo.getName() %> 리뷰</h2>
<div class="divList">
<table class="box2">
	<colgroup>
		<col style="width:10%;" />
		<col style="width:50%;" />	
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">리뷰번호</th>
	    <th scope="col">리뷰내용</th>
	  </tr>
	</thead> 
	<tbody>  
	<%if(list.isEmpty()){ %>
		<tr>
			<td colspan="5" class="align_center">해당 글이 존재하지 않습니다.</td>
		</tr>
	<%}else{ %>	
	  <%for(int i=0;i<pageSize;i++){ 
		  	if(num-- < 1) break;
		  	
		  	vo = list.get(curPos++);
	  %>	
		<tr  style="text-align:center">
			<td><%=vo.getReno() %></td>
			<td style="text-align:left">
				<%=vo.getReview() %>
			</td>
		</tr>
	  <%}//for %>
	 <%}//if %> 
	 </tbody>
</table>	   
</div>

<div class="divPage">
	<%
		if(firstPage>1){ %>
			<a href='review.jsp?currentPage=<%=firstPage-1%>'>
				<p>이전</p>
			</a>	
	<%	} %>

	<%
		for(int i=firstPage;i<=lastPage;i++){
			if(i>totalPage) break;  
			
			if(i==currentPage){	%>
				<span style="color: blue;font-weight: bold;font-size: 1em">
					<%=i %></span>
			<%}else{ %>
				<a href='review.jsp?currentPage=<%=i%>'>
					[<%=i %>]</a>
			<%} %>		
	<%	} %>

	<%
		if(lastPage < totalPage){ %>
			<a href='list.jsp?currentPage=<%=lastPage+1%>'>
				<p>다음</p>
			</a>	
	<%	} %>
</div>

<div>
	<textarea name="review" rows="5" cols="40">
		리뷰를 입력해주세요.
	</textarea>
	<input type='button' value='등록'>
	<input type='button' value='수정'>
	<input type='button' value='삭제'>
</div>

</body>
</html>