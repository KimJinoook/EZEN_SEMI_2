<%@page import="com.semi2.util.LikeDAO"%>
<%@page import="com.semi2.review.model.ReviewDAO"%>
<%@page import="com.semi2.review.model.ReviewVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.semi2.mem.model.MemDAO"%>
<%@page import="com.semi2.menu.model.MenuDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.menu.model.MenuVO"%> 
<%@page import="com.semi2.store.model.StoreVO"%>
<%@page import="com.semi2.store.model.StoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");	
	System.out.println("디테일의 no"+no);
	
	//가게
	StoreDAO dao = new StoreDAO(); 
	StoreVO Svo=null;
	
	//메뉴
	MenuDAO menuDao = new MenuDAO();
	List<MenuVO> list=null;
	
	//회원
	MemDAO memDao = new MemDAO();
	List<MemVO> Mlist=null;
	MemVO Mvo = new MemVO();
	
	//리뷰
	List<ReviewVO> Rlist = null;
	ReviewVO Rvo = new ReviewVO();
	ReviewDAO reviewDao = new ReviewDAO();
	
	try{
		Svo = dao.selectByNo(Integer.parseInt(no));
		list = menuDao.selectAll(Integer.parseInt(no));
		Mlist = memDao.selectAll();
		Rlist = reviewDao.selectStore(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	int userno = 0;
	MemVO curMemVo = (MemVO)session.getAttribute("curMemVo");
	LikeDAO likeDao = new LikeDAO();
	boolean storeIsLike = false;
	if(curMemVo!=null){
		storeIsLike = likeDao.storeIsLike(curMemVo.getMem_no(), Integer.parseInt(no));
		userno = curMemVo.getMem_no();
	}
	float score = likeDao.storeScore(Integer.parseInt(no));
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
    
    <script src="js/jquery-3.6.0.min.js"></script>
    <script>
    	$(function(){
    		$('#nolike').click(function(){
    			window.open('storeLike.jsp?stno=<%=no%>&memno=<%=userno%>&like=<%=1%>',"", "_blank");
    			alert('해당 맛집을 추천하셨습니다');
    			setTimeout(function(){
    				location.reload()},1000);
    			
    		});
    		
    		$('#like').click(function(){
    			window.open('storeLike.jsp?stno=<%=no%>&memno=<%=userno%>&like=<%=2%>',"", "_blank");
    			alert('해당 맛집 추천을 취소하셨습니다');
    			setTimeout(function(){
    				location.reload()},1000);

    		});
    		
    		$('#nouserlike').click(function(){
    			alert('로그인이 필요한 기능입니다.');
    		});
    	});
    </script>
    
</head>


<body>

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
    
    
	
	<!-- Carousel Start -->
    <div class="container-fluid p-0 pb-5 wow fadeIn" data-wow-delay="0.1s" >
        <div class="owl-carousel header-carousel position-relative">
        
        	<%if(list!=null && !list.isEmpty()){
        		for(int i=0; i<list.size();i++){
        			MenuVO menuVo = list.get(i);
        		%>
       		<div class="owl-carousel-item position-relative" data-dot="<img src='<%=menuVo.getMenu_pic()%>'>">
                <img height="700px" src="<%=menuVo.getMenu_pic()%>" alt="">
                <div class="owl-carousel-inner">
                    <div class="container">
                        <div class="row justify-content-start">
                            <div class="col-10 col-lg-8">
                                <h1 class="display-2 text-white animated slideInDown"><%=menuVo.getMenu_name() %></h1>
                                <p class="fs-5 fw-medium text-white mb-4 pb-3"><%=menuVo.getMenu_price() %></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        	<%}}%>
        </div>
    </div>
    <!-- Carousel End -->
    
    
    <!-- Contact Start -->
    <div class="container-fluid bg-light overflow-hidden px-lg-0" style="margin: 6rem 0;">
        <div class="container contact px-lg-0">
            <div class="row g-0 mx-lg-0">
                <div class="col-lg-6 contact-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 ps-lg-0">
                    	<h1 class="mb-4"><%=Svo.getName() %></h1>
                        <h6 class="text-primary">평점 : <%=score%></h6>
                        <h6 class="text-primary">등록일 : <%=sdf.format(Svo.getRegdate()) %></h6>
                        <br>
						<p>식당소개 : <%=Svo.getPreview() %></p><br>
                        <p>주소 :	 <%=Svo.getAdd() %> </p>
						<p>전화번호 : <%=Svo.getTel() %> </p>
						<p>음식종류 : <%=Svo.getKind() %> </p>
						<p>가격대 : <%=Svo.getPrice() %> </p>
						<p>주차 : <%=Svo.getParking() %> </p>
						<p>영업시간 : <%=Svo.getTime() %> </p>
						<p>휴일 : <%=Svo.getRestDay() %> </p><br>
						<p>메뉴 : 
							<%for(int i=0;i<list.size();i++){
								MenuVO vo = list.get(i);%>
								<p>메뉴이름 : <%=vo.getMenu_name() %> | 가격 : <%=vo.getMenu_price() %></p>
							<%}%>
						</p>
						<br><br>
						<table>
						<tr><td align="center">
							<%if(userno==0){%>
								<img src="img/nolike.png" height="65px" width="65px" id="nouserlike">
								
							<% }else if(storeIsLike){ %>
								<img src="img/like.png" height="65px" width="65px" id="like">
							<%}else{ %>
								<img src="img/nolike.png" height="65px" width="65px" id="nolike">
							<%} %>
						<br></td></tr>
						<tr><td align="center"><h6 class="text-primary"><%=Svo.getLike() %></h6></td></tr>
						</table>
						
						
                    </div>
                </div>
                
                <div class="col-lg-6 pe-lg-0" style="min-height: 400px;">
                    <div class="position-relative h-100">
                    
                <div id="map" style="width:100%;height:100%;"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00724106dd7f78df2178c577988b8039"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
						center: new kakao.maps.LatLng(<%=Svo.getLocationlati()%>, <%=Svo.getLocationlongi()%>),
						level: 5
					};
			
					var map = new kakao.maps.Map(container, options);
					
					var markerPosition  = new kakao.maps.LatLng(<%=Svo.getLocationlati()%>, <%=Svo.getLocationlongi()%>); 
			
					var marker = new kakao.maps.Marker({
					    position: markerPosition
					});
					
					marker.setMap(map);
				</script>
				
				 </div>
                </div>
				
				</div>
				</div>
				</div>
				
    <!-- Contact End -->
    
    
	<!-- 리뷰 시작! -->
    <div class="container-xxl py-5">
        <div class="container">
        	<div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h6 class="text-primary">맛집 리뷰</h6>
                <h1 class="mb-4">얼마나 맛있게요~!</h1>
            </div>
            <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.1s">
            
            <%if(Rlist != null && !Rlist.isEmpty()){
            	for(int i=0; i<Rlist.size(); i++){
            	ReviewVO reviewVo = Rlist.get(i);
            	MemVO memVo = memDao.selectByNo(reviewVo.getMemno());
            	%>
            	<div class="testimonial-item text-center">
                    <div class="testimonial-img position-relative">
                        <img class="img-fluid rounded-circle mx-auto mb-5" src="<%=memVo.getMem_pic()%>" onerror="this.onerror=null; this.src='img/mem/user.png'">
                        <div class="btn-square bg-primary rounded-circle">
                            <i class="fa fa-quote-left text-white"></i>
                        </div>
                    </div>
                    <div class="testimonial-text text-center rounded p-4">
                        <p><%=reviewVo.getReview() %></p>
                        <h5 class="mb-1"><%=memVo.getMem_id() %></h5>
                    </div>
                </div>
                
            <% }}else{%>
   					<div class="testimonial-text text-center rounded p-4">
                        <h5 class="mb-1">등록된 리뷰가 없습니다</h5>
                    </div>
			<%} %>
             </div>
         </div>
     </div>
     <div style=" text-align: center;">
  			<a href="review2.jsp?stno=<%=no %>" class="nav-item nav-link active">더보기</a>
	</div>

	<!-- 리뷰 끝!! -->
	
	
	

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