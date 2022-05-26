<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//1
	//검색 - 파라미터
	String keyword=request.getParameter("keywordid");	
	
	//2

	List<MemVO> list=(List<MemVO>)request.getAttribute("list");
	
	//3
	if(keyword==null) keyword="";
	
	//페이징 처리
	int currentPage=1;  //현재 페이지
	
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt((request.getParameter("currentPage")));
	}
	
	//[1] 현재 페이지와 무관한 변수
	int totalRecord=list.size();
	int pageSize=10; 
	int totalPage=(int)Math.ceil((float)totalRecord/pageSize);
	int blockSize=10; 

	//[2] 현재 페이지를 이용해서 계산하는 변수
	int	firstPage=currentPage-((currentPage-1)%blockSize);
	int lastPage=firstPage+(blockSize-1);
	
	int curPos=(currentPage-1)*pageSize;
	int num=totalRecord-curPos;
%>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>이젠 먹으러갑니다</title>
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
</head>

<body>
	<script src="js/jquery-3.6.0.min.js"></script>
		<script>
			$(function(){
				$('#searchBtn').click(function(){
					var key = $('#keywordid').val();
					location.href="memcontrol.do?keywordid="+key;
				});
				
				$('[id^=delMem]').on('click',function(){
					var mem_id = $(this).next('input').val();
					var con = confirm('해당 회원을 탈퇴시키겠습니까?');
					if(con){
						location.href="memdel_ok.do?mem_id="+mem_id;
					}
				});
			})
	</script>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Navbar Start -->
	<%@include file="navbar.jsp"%>
	<!-- Navbar End -->


    <!-- Projects Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
            	<!-- 검색어 출력 -->
            	<%if(keyword !=null && !keyword.isEmpty()){
            		%>
                <h1 class="mb-4"><%=keyword%> 검색결과</h1>
            	<%}else{%>
                <h1 class="mb-4">회원 목록</h1>
            		
            	<%}%>
            </div>
       		<div class="position-relative mx-auto" style="max-width: 400px;">
                <input class="form-control border-0 w-100 py-3 ps-4 pe-5" type="text" placeholder="회원 아이디 입력" name="keywordid" id="keywordid">
                <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2" id="searchBtn" border="1px solid black">검색</button>
            </div>

            
          
    <%if(list.isEmpty()){ %>
		<script type="text/javascript">
			alert ("검색 결과가 존재하지 않습니다"); 
		</script>
	<%}else{ %>
		<%for(int i=0;i<pageSize;i++){ 
			if(num-- <1) break;
				  	
			MemVO vo = list.get(curPos++);
		%>
			<div class="col-lg-4 col-md-6 portfolio-item first">
					<img class="img-fluid rounded-circle mx-auto mb-5" src="<%=vo.getMem_pic()%>"  onerror="this.onerror=null; this.src='img/mem/user.png'" style="max-width: 150px;" id="delMem">
					<input type="hidden" value = "<%=vo.getMem_id() %>">
				<div class="pt-3">
					<hr class="text-primary w-25 my-2">
					<a href="#">
					<h5 class="lh-base"><%=vo.getMem_id() %></h5>
					</a>
				</div>
			</div>
		<%
		} //for
		%>
	<%
	} //if
	%>
    </div>
    
    <!-- Footer Start -->
    <%@include file="footer.jsp"%>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/isotope/isotope.pkgd.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>