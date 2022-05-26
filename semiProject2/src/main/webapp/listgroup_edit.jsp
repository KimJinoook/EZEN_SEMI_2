<%@page import="com.semi2.list.model.ListService"%>
<%@page import="com.semi2.listGroup.model.ListGroupService"%>
<%@page import="com.semi2.list.model.ListVO"%>
<%@page import="java.util.List"%>
<%@page import="com.semi2.listGroup.model.ListGroupVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String groupNo = request.getParameter("no");

	ListGroupVO groupVo = (ListGroupVO)request.getAttribute("groupVo");

	List<ListVO> listVoList = (List<ListVO>)request.getAttribute("listVoList");

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
		$('#list_edit').click(function(){
			window.open('list_edit.do?group_no=<%=groupNo%>','리스트관리','width=600px, height=800px,scrollbars=yes');
		});
		
		$('form[name=frmlistadd]').submit(function(){
			var f = $('#inputlistimg').val();
			var n = $('#inputlistname').val();
			var c = $('#inputlistcomment').val();
			if(f.length<1){
				alert('리스트 사진을 입력해야합니다');
				event.preventDefault();
				event.stopPropagation();
			}else if(n.length<1){
				alert('리스트 이름을 입력해야합니다');
				event.preventDefault();
				event.stopPropagation();
			}else if(c.length<1){
				alert('리스트 코멘트를 입력해야합니다');
				event.preventDefault();
				event.stopPropagation();
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
                
                        <div class="position-relative h-100">
                        <img class="position-absolute img-fluid w-100 h-100" src="img/aboutEzen.jpg" style="object-fit: cover;" alt="">
                    </div>
          
                </div>
                <div class="col-lg-6 quote-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 pe-lg-0">
                    <h1 class="mb-4">리스트 이름 변경</h1>
                        <form method="post" action="listgroup_edit_ok.do?groupNo=<%=groupNo%>">
                            <div class="row g-3">
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" name = "group_name" placeholder="<%=groupVo.getGroup_name() %>" style="height: 55px;">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <button class="btn btn-primary rounded-pill py-3 px-5" type="submit">이름 변경</button>
                                </div>      
                            </div>
                        </form>
                        <br><br><br>
                        <h1 class="mb-4">하위 리스트 관리</h1>
                        <form method="post" action="list_add.jsp?groupNo=<%=groupNo%>" enctype="multipart/form-data" name="frmlistadd">
                            <div class="row g-3">
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" name = "list_name" placeholder="리스트 이름" style="height: 55px;" id="inputlistname">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="file" class="form-control border-0" name = "fileName" placeholder="사진 등록" style="height: 55px;" accept="image/gif, image/jpg, image/JPG, image/jpeg, image/png, image/PNG" id="inputlistimg">
                                </div>
                                
                                <div class="col-12">
                                    <textarea class="form-control border-0" name = "list_comment" placeholder="리스트 코멘트" id="inputlistcomment"></textarea>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <button class="btn btn-primary rounded-pill py-3 px-5" type="submit">리스트 추가</button>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <button class="btn btn-primary rounded-pill py-3 px-5" type="button" id="list_edit">리스트 관리</button>
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