<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="com.semi2.db.ListVO"%>
<%@page import="com.semi2.db.ListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.요청 파라미터 없음
	//2. db
	ListDAO dao = new ListDAO();
	List<ListVO> list= null;
	
	try{
		list=dao.selectRegion();
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>이젠 먹으러 갑니다</title>
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
<meta charset="UTF-8">
<title>지역리스트</title>
</head>
<body>

    <!-- 지역리스트 -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <h6 class="text-primary">맛집 리스트</h6>
                <h1 class="mb-4">특별한 날,당신을 위한 맛집리스트</h1>
            </div>
            
            <div class="row g-4">
            <!-- 반복 시작 -->
				<%for(int i=0; i<list.size(); i++){
						ListVO vo = list.get(i);	%>
                <div class="col-md-6 col-lg-4 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="service-item rounded overflow-hidden">
                        <img class="img-fluid" src="img/ham.jpg" alt="">
                        <div class="position-relative p-4 pt-0">
                            <div class="service-icon">
                                <i class="fa fa-lightbulb fa-3x"></i>
                            </div>
                            <h4 class="mb-3">
                            <input type="hidden" name="List_no" value=" <%=vo.getList_no() %>">
                            </h4>
                            
                            <h4 class="mb-3"><%=vo.getList_name() %> 맛집 베스트</h4>
                            <p><%=vo.getList_coment() %></p>
                            
                             <%if(vo.getList_no()==1){ %>
                            <a class="small fw-medium"  href="1종로">
                            <%}else if(vo.getList_no()==2){ %>
                            <a class="small fw-medium"  href="2마포">
                            <%}else if(vo.getList_no()==3){ %>
                            <a class="small fw-medium"  href="3서대문">
                            <%}else if(vo.getList_no()==4){ %>
                            <a class="small fw-medium"  href="4송파">
                            <%}else if(vo.getList_no()==5){ %>
                            <a class="small fw-medium"  href="5양천">
                            <%}else if(vo.getList_no()==6){ %>
                            <a class="small fw-medium"  href="6중구">
                            <%}else if(vo.getList_no()==7){ %>
                            <a class="small fw-medium"  href="7강남">
                            <%}else{ %>
                            <a class="small fw-medium"  href="8강서">
                            <%} %>
                            더보기<i class="fa fa-arrow-right ms-2"></i>
                            </a>
                        </div>
                    </div>
                </div>
              <%}//for %>
			<!-- 반복 끝 -->
                
            </div>
        </div>
    </div>
    <!-- Service End -->

</body>
</html>