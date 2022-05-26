<%@page import="com.semi2.store.model.StoreDAO"%>
<%@page import="com.semi2.mem.model.MemDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.store.model.StoreVO"%>
<%@page import="com.semi2.review.model.ReviewVO"%>
<%@page import="com.semi2.review.model.ReviewDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi2.util.PagingVO"%> 
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String stno = request.getParameter("stno");
	String memno = request.getParameter("memno");
	String no = request.getParameter("no");
	
	ReviewDAO dao = new ReviewDAO();	
	List<ReviewVO> list = null;
	ReviewVO vo = new ReviewVO();
	
	MemDAO Mdao=new MemDAO();
	List<MemVO> Mlist = null;
	MemVO Mvo = null;
	
	StoreDAO Sdao=new StoreDAO();
	StoreVO Svo = null;

	try{
		list=dao.selectReview(Integer.parseInt(stno));
		Mlist=Mdao.selectAll();
		Mvo=Mdao.selectByNo(Integer.parseInt(no));
		Svo=Sdao.selectByNo(Integer.parseInt(stno));
	}catch(NumberFormatException e){
		e.printStackTrace();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//날짜처리
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	//페이징 처리
	int currentPage=1;

	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt((request.getParameter("currentPage")));
	}

	int totalRecord=list.size();
	int pageSize=5;
	int blockSize=10;
	
	PagingVO pageVo
	=new PagingVO(currentPage, totalRecord, pageSize, blockSize);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이젠 먹으러 갑니다! - 맛집정보</title>
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
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
	<link rel="stylesheet" type="text/css" href="../css/clear.css" />
	<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
	<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">	
	$(function(){
		$('.divList table.box2 tbody tr').hover(function(){
			$(this).css('background','lightblue');
		}, function(){
			$(this).css('background','');
		});
	});
	
	$(function(){
		$('#btList').click(function(){
			location.href = 'list.jsp';
		});
		
		$('form[name=frmWrite]').submit(function(){
			$('.infobox').each(function(idx, item){
				if($.trim($(this).val()).length<1){
					alert($(this).prev().text() + '을(를) 입력하세요');
					$(item).focus();
					event.preventDefault();
				}
			});			
		});
		
	});
</script>
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }	
	 
	 .divList1{
	 	width: 450px;
        padding: 20px;
        margin-bottom: 20px;
        float: left;
	 }
	 
	 .divForm1{
	 
	 }
</style>	
</head>

<body>


<!-- Navbar Start -->
<%@include file="navbar.jsp"%> 
<!-- Navbar End --> 

<br>
<hr>
<br>

<!-- 리뷰 목록 -->
<h2 style="color: #32C36C; font-weight: bold;"><%=Svo.getName() %>의 리뷰</h2>
<div class="divList1">
<table class="box2">
	<colgroup>
		<col style="width:10%;" />
		<col style="width:50%;" />
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">작성자</th>
	    <th scope="col">리뷰</th>
	  </tr>
	</thead> 
	<tbody>  
	<%if(list.isEmpty()){ %>
		<tr>
			<td colspan="5" class="align_center">해당 글이 존재하지 않습니다.</td>
		</tr>
	<%}else{ %>
	  <%
	  int num =pageVo.getNum();
	  int curPos =pageVo.getCurPos();
	  
	  for(int i=0;i<pageVo.getPageSize();i++){
		  	if(num-- <1) break;
		  	
	  		vo = list.get(curPos++);
	  %>	
		<tr  style="text-align:center">
			<td>
			<%if(vo.getMemno()==Mvo.getMem_no()){ %>
				<%=Mvo.getMem_id()%>
			<%} %>
			</td>
			<td><%=vo.getReview() %></td>
		</tr>
	  <%}//for %>
	 <%}//if %> 
	 </tbody>
</table>	   
</div>
<!-- 리뷰 목록 끝 -->


<!-- 페이징 처리 -->
<div class="divPage">
	<%
		if(pageVo.getFirstPage()>1){ %>
			<a href='review2.jsp?currentPage=<%=pageVo.getFirstPage()-1%>'>
				<p>이전</p>
			</a>	
	<%	} %>

	<%
		for(int i=pageVo.getFirstPage();i<=pageVo.getLastPage();i++){
			if(i>pageVo.getTotalPage()) break;  
			
			if(i==currentPage){	%>
				<span style="color: blue;font-weight: bold;font-size: 1em">
					<%=i %></span>
			<%}else{ %>
				<a href='review2.jsp?stno=<%=stno %>&currentPage=<%=i%>'>
					[<%=i %>]</a>
			<%} %>		
	<%	} %>

	<%
		if(pageVo.getLastPage() < pageVo.getTotalPage()){ %>
			<a href='review2.jsp?stno=<%=stno %>&currentPage=<%=pageVo.getLastPage()+1%>'>
				<p>다음</p>
			</a>	
	<%	} %>
</div>
<hr>
<!-- 페이징 처리 끝 -->


<!-- 리뷰 작성 -->
<%if(m_login){ %>
	<div class="divForm1">
	<form name="frmWrite" method="post" action="review2.jsp?stno=<%=stno %>" 
		enctype="multipart/form-data">
	 <fieldset>
	        <div>
	            <label for="name">작성자</label>
	            <input type="text" id="name" name="name" class="infobox"/>
	        </div>
	        <hr>
	        <div>  
	        	<label for="content">리뷰</label>        
	 			<textarea id="content" name="content" rows="12" cols="40"></textarea>
	        </div>
	        <div>
	            <label for="upfile">사진</label>
	            <input type="file" id="upfile" name="upfile" />
	            <span>(최대 2M)</span>
	        </div>
	        
	        <div class="center">
	            <input type = "submit" value="등록"/>       
	        </div>
	    </fieldset>
	</form>
	</div>
<%}else{ %>
	<div class="divForm1">
	<form name="frmWrite" method="post" action="review2.jsp?stno=<%=stno %>" 
		enctype="multipart/form-data">
	 <fieldset>
	        <div>
	            <label for="name">작성자</label>
	            <input type="text" id="name" name="name" class="infobox"/>
	        </div>
	        <hr>
	        <div>  
	        	<label for="content">리뷰</label>        
	 			<textarea id="content" name="content" rows="12" cols="40"></textarea>
	        </div>
	        <hr>
	        <div>
	            <label for="upfile">사진</label>
	            <input type="file" id="upfile" name="upfile" />
	            <span>(최대 2M)</span>
	        </div>
	        <hr>
	        <div class="center">
	            <input type = "submit" value="등록"/>       
	        </div>
	    </fieldset>
	</form>
	</div>
	<!-- <div>
		<h3>리뷰 작성은 로그인이 필요한 서비스입니다.</h3>
	</div> -->
<%} %>
<!-- 리뷰 작성 끝 -->


<!-- Footer Start -->
<%@include file="footer.jsp"%>
<!-- Footer End -->


</body>
</html>





