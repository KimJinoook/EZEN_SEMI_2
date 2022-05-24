<%@page import="com.semi2.review.model.ReviewVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.semi2.db.ReviewVO"%>
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
	
	//가게
	StoreDAO dao = new StoreDAO(); 
	StoreVO Svo=null;
	
	//메뉴
	MenuDAO menuDao = new MenuDAO();
	List<MenuVO> list=null;
	
	//회원
	MemDAO memDao = new MemDAO();
	List<MemVO> Mlist=null;
	MemVO Mvo = null;
	
	//리뷰
	List<ReviewVO> Rlist = null;
	ReviewVO Rvo = null;
	
	try{
		Svo = dao.selectByNo(Integer.parseInt(no));
		list = menuDao.selectAll(Integer.parseInt(no));
		Mlist = memDao.selectAll();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
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
    
    
	<!--     맛집 상세 이미지
    <aside class="restaurant-photos">
	    
    
    
    
    </aside>
    맛집 상세 이미지 끝 -->
    
    
    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown"><%=Svo.getName() %></h1>
        </div>
    </div>
    <!-- Page Header End -->
    
    
    
    
    
    <!-- Contact Start -->
    <div class="container-fluid bg-light overflow-hidden px-lg-0" style="margin: 6rem 0;">
        <div class="container contact px-lg-0">
            <div class="row g-0 mx-lg-0">
                <div class="col-lg-6 contact-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 ps-lg-0">
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
                    </div>
                </div>
                
                <div id="map" style="width:800px;height:400px;"></div>
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
    <!-- Contact End -->
    
    
	<!-- 리뷰 시작! -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.1s">
                <div class="testimonial-item text-center">
                    <div class="testimonial-img position-relative">
                        <img class="img-fluid rounded-circle mx-auto mb-5" src="<%=Mvo.getMem_pic()%>">
                        <div class="btn-square bg-primary rounded-circle">
                            <i class="fa fa-quote-left text-white"></i>
                        </div>
                    </div>
                    <div class="testimonial-text text-center rounded p-4">
                        <p><%if(Mvo.getMem_no()==Rvo.getMemno()){
                        	Rvo.getReview();
                        } %>
                        </p>
                        <h5 class="mb-1">
                        <%if(Mvo.getMem_no()==Rvo.getMemno()){
	                        Mvo.getMem_id();
                        } %>
                        </h5>
                    </div>
                </div>
                <div class="testimonial-item text-center">
                    <div class="testimonial-img position-relative">
                        <img class="img-fluid rounded-circle mx-auto mb-5" src="<%=Mvo.getMem_pic()%>">
                        <div class="btn-square bg-primary rounded-circle">
                            <i class="fa fa-quote-left text-white"></i>
                        </div>
                    </div>
                    <div class="testimonial-text text-center rounded p-4">
						<p><%if(Mvo.getMem_no()==Rvo.getMemno()){
                        	Rvo.getReview();
                        } %>
                        </p>
                        <h5 class="mb-1">
                        <%if(Mvo.getMem_no()==Rvo.getMemno()){
	                        Mvo.getMem_id();
                        } %>
                        </h5>
                    </div>
                </div>
                <div class="testimonial-item text-center">
                    <div class="testimonial-img position-relative">
                        <img class="img-fluid rounded-circle mx-auto mb-5" src="<%=Mvo.getMem_pic()%>">
                        <div class="btn-square bg-primary rounded-circle">
                            <i class="fa fa-quote-left text-white"></i>
                        </div>
                    </div>
                    <div class="testimonial-text text-center rounded p-4">
						<p><%if(Mvo.getMem_no()==Rvo.getMemno()){
                        	Rvo.getReview();
                        } %>
                        </p>
                        <h5 class="mb-1">
                        <%if(Mvo.getMem_no()==Rvo.getMemno()){
	                        Mvo.getMem_id();
                        } %>
                        </h5>
                    </div>
                </div>
            </div>
            <div style=" text-align: center;">
                <a href="review.jsp?stno=<%=Svo.getNo() %>" class="nav-item nav-link active">더보기</a>
            </div>
        </div>
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



















