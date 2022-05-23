<%@page import="com.semi2.store.model.StoreVO"%>
<%@page import="com.semi2.list.model.ListService"%>
<%@page import="com.semi2.listGroup.model.ListGroupService"%>
<%@page import="com.semi2.list.model.ListVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi2.listGroup.model.ListGroupVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	StoreVO vo = (StoreVO)request.getAttribute("vo");

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
<script src = "js/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		
		$('form[name=frmstoreadd]').submit(function(){
			var a = $('input[name=address]').val();
			var n = $('input[name=name]').val();
			var l = $('input[name=locationlati]').val();
			var f = $('#inputstoreimg').val();
			if(a.length<1){
				alert('주소를 입력해야합니다');
				event.preventDefault();
				event.stopPropagation();
			}else if(n.length<1){
				alert('맛집 이름을 입력해야합니다');
				event.preventDefault();
				event.stopPropagation();
			}
		});
		
		$('#storeDel').click(function(){
			var con = confirm('해당 맛집을 삭제하시겠습니까?');
			if(con){
				location.href="storeDelete.do?no=<%=vo.getNo()%>";
			}
		});
	});
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


    <!-- Quote Start -->
    <div class="container-fluid bg-light overflow-hidden my-5 px-lg-0">
        <div class="container quote px-lg-0">
            <div class="row g-0 mx-lg-0">
            	<div class="col-lg-6 ps-lg-0 wow fadeIn" data-wow-delay="0.1s" style="min-height: 400px;">
			 		<div class="position-relative h-100" id="map"></div>
              	</div>
                <div class="col-lg-6 quote-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 pe-lg-0">
                    	<h1 class="mb-4">맛집 수정</h1>
                        <form method="post" action="storeEdit_ok.jsp" enctype="multipart/form-data" name="frmstoreadd">
                            <div class="row g-3">
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" name = "address" placeholder="맛집 주소" style="height: 55px;" value="<%=vo.getAdd()%>">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <button type="button" class="btn btn-primary rounded-pill py-3 px-5" onClick="mapsearch()">주소 검색</button>
                                </div>  
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" name = "locationlati" placeholder="위도" style="height: 55px;" value="<%=vo.getLocationlati()%>" readonly>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" name = "locationlongi" placeholder="경도" style="height: 55px;"  value="<%=vo.getLocationlongi()%>" readonly>
                                </div>    
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" name = "name" placeholder="맛집 이름" style="height: 55px;" id="inputlistname"  value="<%=vo.getName()%>" >
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="file" class="form-control border-0" name = "fileName" placeholder="사진 등록" style="height: 55px;" accept="image/gif, image/jpg, image/JPG, image/jpeg, image/png, image/PNG" id="inputstoreimg">
                                    <input type="hidden" name="pic" value="<%=vo.getPic()%>">
                                    <input type="hidden" name="no" value="<%=vo.getNo()%>">
                                </div>
                                
                                
                                <div class="col-12">
                                    <textarea class="form-control border-0" name = "preview" placeholder="맛집 소개" id="inputlistpreview" value="<%=vo.getPreview()%>"></textarea>
                                </div>
                                
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" name = "kind" placeholder="종류" style="height: 55px;" id="inputlistname" value="<%=vo.getKind()%>">
                                </div>
                                
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" name = "price" placeholder="가격대" style="height: 55px;" id="inputlistname" value="<%=vo.getPrice()%>">
                                </div>
                                
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" name = "time" placeholder="운영 시간" style="height: 55px;" id="inputlistname" value="<%=vo.getTime()%>">
                                </div>
                                
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" name = "restday" placeholder="휴무일" style="height: 55px;" id="inputlistname" value="<%=vo.getRestDay()%>">
                                </div>
                                
                                <div class="col-12 col-sm-6">
                                    <select class="form-select border-0" style="height: 55px;" name="parking">
                                        <option value="" selected>주차 가능 여부</option>
                                        <option value="O">주차 가능</option>
                                        <option value="X">주차 불가</option>
                                    </select>
                                </div>
                                
                                <div class="col-12 col-sm-6">
                                    <button class="btn btn-primary rounded-pill py-3 px-5" type="submit">맛집 수정</button>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <button class="btn btn-primary rounded-pill py-3 px-5" type="button" id="storeDel">맛집 삭제</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Quote End -->


   
        

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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00724106dd7f78df2178c577988b8039&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
// 주소로 좌표를 검색합니다
geocoder.addressSearch('<%=vo.getAdd()%>', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        
        var message = 'latlng: new kakao.maps.LatLng(' + result[0].y + ', ';
		message += result[0].x + ')';
		
		/* var resultDiv = document.getElementById('clickLatlng'); 
		resultDiv.innerHTML = message; */

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });


        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
        
    } 
});

function mapsearch(){
	var address = $('input[name=address]').val();
	var geocoder2 = new kakao.maps.services.Geocoder();
	geocoder2.addressSearch(address, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        
	        var message = 'latlng: new kakao.maps.LatLng(' + result[0].y + ', ';
			message += result[0].x + ')';
			
			/* var resultDiv = document.getElementById('clickLatlng'); 
			resultDiv.innerHTML = message; */
			

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });


	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	        
	        $('input[name=locationlati]').val(result[0].y);
	    	$('input[name=locationlongi]').val(result[0].x);
	    } 
	});
	
	
}
</script>
</body>

</html>