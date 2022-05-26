<%@page import="com.semi2.listGroup.model.ListGroupService"%>
<%@page import="com.semi2.mem.model.MemService"%>
<%@page import="com.semi2.store.model.StoreService"%>
<%@page import="com.semi2.list.model.ListService"%>
<%@page import="com.semi2.mem.model.MemDAO"%>
<%@page import="com.semi2.list.model.ListVO"%>
<%@page import="com.semi2.list.model.ListDAO"%>
<%@page import="com.semi2.listGroup.model.ListGroupVO"%>
<%@page import="com.semi2.listGroup.model.ListGroupDAO"%>
<%@page import="com.semi2.mem.model.MemVO"%>
<%@page import="com.semi2.store.model.StoreVO"%>
<%@page import="com.semi2.store.model.StoreDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    
    	List<ListVO> listVoList = (List<ListVO>)request.getAttribute("listVoList");
    	
    	List<StoreVO> storeVoList = (List<StoreVO>)request.getAttribute("storeVoList");
    	
    	List<MemVO> memVoList = (List<MemVO>)request.getAttribute("memVoList");
    	
    	List<ListGroupVO> groupList = (List<ListGroupVO>)request.getAttribute("groupList");

    %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>관리자메뉴</title>
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
<script>
	function addGroup(){
		var groupName = prompt('그룹 이름을 입력하세요');
		if(groupName.length>0){
			location.href="listgroup_add.do?groupname="+groupName;
		}
	}
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


    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown">관리자 메뉴</h1>
            <nav aria-label="breadcrumb animated slideInDown">    
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Projects Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row mt-n2 wow fadeInUp" data-wow-delay="0.3s" >
                <div class="col-12 text-center">
                    <ul class="list-inline mb-5" id="portfolio-flters">
                        <li class="mx-2" data-filter=".first">리스트 관리</li>
                        <li class="mx-2" data-filter=".second">맛집 정보 관리</li>
                        <li class="mx-2" data-filter=".third">회원 관리</li>
                    </ul>
                </div>
            </div>
            <div class="row g-4 portfolio-container wow fadeInUp" data-wow-delay="0.5s" >
            	<div class="col-lg-4 col-md-6 portfolio-item first">
                    <div class="portfolio-img rounded overflow-hidden">
                        <img class="img-fluid" src="img/add.png" alt="">
                        <div class="portfolio-btn">
                            <a class="btn btn-lg-square btn-outline-light rounded-circle mx-1" href="#" onclick="addGroup()">+</a>
                        </div>
                    </div>
                </div>
                <%for(int i=0; i<groupList.size();i++){
                	ListGroupVO groupVo = groupList.get(i);
                %>
                <div class="col-lg-4 col-md-6 portfolio-item first">
                    <div class="portfolio-img rounded overflow-hidden">
                        <img class="img-fluid" src="img/list/<%=i+1%>.jpg" alt="">
                        <div class="portfolio-btn">
                            <a class="btn btn-lg-square btn-outline-light rounded-circle mx-1" href="listgroup_edit.do?no=<%=groupVo.getGroup_no()%>">수정</a>&nbsp;&nbsp;
                            <a class="btn btn-lg-square btn-outline-light rounded-circle mx-1" href="listgroup_delete.do?no=<%=groupVo.getGroup_no()%>">삭제</a>
                        </div>
                    </div>
                    <div class="pt-3">
                        <p class="text-primary mb-0">리스트 그룹</p>
                        <hr class="text-primary w-25 my-2">
                        <h5 class="lh-base"><%=groupVo.getGroup_name() %></h5>
                    </div>
                </div>
                <%}%>
                <div class="col-lg-4 col-md-6 portfolio-item second" display="hidden">
                    <div class="portfolio-img rounded overflow-hidden">
                        <img class="img-fluid" src="img/add.png" alt="">
                        <div class="portfolio-btn">
                            <a class="btn btn-lg-square btn-outline-light rounded-circle mx-1" href="storeadd.do">+</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 portfolio-item second" display="hidden">
                    <div class="portfolio-img rounded overflow-hidden">
                        <img class="img-fluid" src="img/edit.png" alt="">
                        <div class="portfolio-btn">
                            <a class="btn btn-lg-square btn-outline-light rounded-circle mx-1" href="storecontrol.do">목록</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 portfolio-item third" >
                    <div class="portfolio-img rounded overflow-hidden">
                        <img class="img-fluid" src="img/memcon.png" alt="">
                        <div class="portfolio-btn">
                            <a class="btn btn-lg-square btn-outline-light rounded-circle mx-1" href="memcontrol.do"><i class="fa fa-link"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Projects End -->

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