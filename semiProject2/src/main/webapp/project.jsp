<%@page import="com.semi2.db.StoreDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.semi2.db.StoreVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//1
	//검색 - 파라미터
	request.setCharacterEncoding("utf-8");
	String keyword=request.getParameter("keyword");	
	
	//2
	StoreDAO dao=new StoreDAO();

	List<StoreVO> list=new ArrayList<StoreVO>();
	try{
		list=dao.selectStore(keyword);	
	}catch(SQLException e){
		e.printStackTrace();
	}
	
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
                <h1 class="mb-4"><%=keyword%> 맛집 인기 검색순위</h1>
            </div>
            <div class="row mt-n2 wow fadeInUp" data-wow-delay="0.3s">
                <div class="col-12 text-center">
                    <ul class="list-inline mb-5" id="portfolio-flters">
                        <li class="mx-2 active" data-filter="*">All</li>
                        <li class="mx-2" data-filter=".first">Solar Panels</li>
                        <li class="mx-2" data-filter=".second">Wind Turbines</li>
                        <li class="mx-2" data-filter=".third">Hydropower Plants</li>
                    </ul>
                </div>
            </div>
            
          
    <%if(list.isEmpty()){ %>
		<script type="text/javascript">
			alert ("검색 결과가 존재하지 않습니다"); 
		</script>
	<%}else{ %>
		<%for(int i=0;i<pageSize;i++){ 
			if(num-- <1) break;
				  	
			StoreVO vo = list.get(curPos++);
		%>
			<div class="col-lg-4 col-md-6 portfolio-item first">
				<div class="portfolio-img rounded overflow-hidden">
					<img class="img-fluid" src="<%=vo.getPic() %>" alt="">
					<div class="portfolio-btn">
		                <a class="btn btn-lg-square btn-outline-light rounded-circle mx-1" href="SearchResult/<%=vo.getPic() %>" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
		                <a class="btn btn-lg-square btn-outline-light rounded-circle mx-1" href="detail1.jsp?no=<%=vo.getNo()%>"><i class="fa fa-link"></i></a>
	                </div>
				</div>
				<div class="pt-3">
					<hr class="text-primary w-25 my-2">
					<a href="#">
					<h5 class="lh-base"><%=vo.getName() %></h5>
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
    <!-- Projects End -->
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9p1sal6bpb"></script>
    <div class="container-fluid bg-light overflow-hidden my-5 px-lg-0">
    	<div id="map" style="width: 100%; height: 400px;">
		<script>
		//지도 생성 시에 옵션을 지정할 수 있습니다.
		var map = new naver.maps.Map('map', {
			//지도의 초기 중심 좌표 - 서울역
		   	center: new naver.maps.LatLng(37.55467884, 126.97060692), 
		   	zoom: 13, //지도의 초기 줌 레벨
		   	minZoom: 7, //지도의 최소 줌 레벨
		   	zoomControl: true, //줌 컨트롤의 표시 여부
		   	zoomControlOptions: { //줌 컨트롤의 옵션
		    	position: naver.maps.Position.TOP_RIGHT
	   		}
		});
		
		//마커
			let markers = new Array();
			let infoWindows = new Array();
		<%
			for(int i=0;i<list.size();i++){ 
				StoreVO vo = list.get(i);
		%>
			var marker = new naver.maps.Marker({
			    position: new naver.maps.LatLng(<%=vo.getLocationlati()%>,<%=vo.getLocationlongi()%>),
			    map: map
			});
			
			//마커 정보
			var infowindow = new naver.maps.InfoWindow({
			    content: '<div style="width:300px;text-align:center;padding:10px;">'
			    +'<h4><%=vo.getName()%></h4>'
			    +'<p><%=vo.getAdd()%><br>'
			    +'<%=vo.getTel()%> <br> <%=vo.getKind()%><br>'
			    +'</p>'
			    +'</div>'
			});
			markers.push(marker);
			infoWindows.push(infowindow);
			//클릭시 정보 뜨도록
		<%
		} //for
			
		%>
		for (var i=0; i<markers.length; i++){
			naver.maps.Event.addListener(markers[i], "click", markEvent(i));
			
		}
		
		function markEvent(seq){
			return function(e){
				var marker = markers[seq];
				var infoWindow = infoWindows[seq];
				
				if(infoWindow.getMap()){
					infoWindow.close();
				}else{
					infoWindow.open(map,marker);
				}
			}
		}
		
		</script>
	</div> 

    <!-- Quote Start -->

                <div class="col-lg-6 quote-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 pe-lg-0">
                        <h6 class="text-primary">Free Quote</h6>
                        <h1 class="mb-4">Get A Free Quote</h1>
                        <p class="mb-4 pb-2">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo erat amet</p>
                        <form>
                            <div class="row g-3">
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" placeholder="Your Name" style="height: 55px;">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="email" class="form-control border-0" placeholder="Your Email" style="height: 55px;">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" placeholder="Your Mobile" style="height: 55px;">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <select class="form-select border-0" style="height: 55px;">
                                        <option selected>Select A Service</option>
                                        <option value="1">Service 1</option>
                                        <option value="2">Service 2</option>
                                        <option value="3">Service 3</option>
                                    </select>
                                </div>
                                <div class="col-12">
                                    <textarea class="form-control border-0" placeholder="Special Note"></textarea>
                                </div>
                                <div class="col-12">
                                    <button class="btn btn-primary rounded-pill py-3 px-5" type="submit">Submit</button>
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
</body>

</html>