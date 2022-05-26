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
	String stno = request.getParameter("stno");
	
	ReviewDAO reviewDao = new ReviewDAO();
	List<ReviewVO> reviewList = reviewDao.selectReview(Integer.parseInt(stno));
	StoreDAO storeDao = new StoreDAO();
	StoreVO storeVo = storeDao.selectByNo(Integer.parseInt(stno));
	MemDAO memDao = new MemDAO();
	
	int curUserNo = 0;
	String R_userid=(String)session.getAttribute("userid");
	if(R_userid!=null && !R_userid.isEmpty()){
		curUserNo = (int)session.getAttribute("userno");		
	}
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
    
    <link rel="stylesheet" type="text/css" href="css/board/mainstyle.css" />
	<link rel="stylesheet" type="text/css" href="css/board/clear.css" />
	<link rel="stylesheet" type="text/css" href="css/board/formLayout4.css" />
	<link rel="stylesheet" type="text/css" href="css/board/mystyle.css" />
    
    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">	
	$(function(){
		$('form').submit(function(){	
			var a = $('#review').val();
			var b = $('#score').val();
			if($('#id').val() =="null"){
				alert('로그인이 필요합니다.');
				event.preventDefault(); 
			}else if(a.length<1){
				alert('리뷰를 입력해야 합니다.');
				event.preventDefault(); 
			}else if(b == -1){
				alert('평점을 입력해야 합니다');
				event.preventDefault(); 
			}
		}); 

		

		 $('td > input[type="button"]').click(function(){

			 	var reno = $(this).next().val();

		 				location.href='review_del.jsp?reno='+reno
		 						+'&stno='+<%=stno%>;	
		 			
		 		
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
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
        
            <h1 class="display-3 text-white mb-3 animated slideInDown"><%=storeVo.getName() %></h1>
           
        </div>
    </div>
    <!-- Carousel End -->
    
    
<div style="width=100%">
    <div class="col-lg-6 quote-text py-5 wow fadeIn" data-wow-delay="0.5s" style="margin :0 auto">
                    <div class="p-lg-5 pe-lg-0">
    <form method="post" action="review2_ok.jsp"  name="reviewfrm">
                            <div class="row g-3">
                               
                                <input type="hidden" id="stno" name="stno"  value="<%=stno%>"/>
                                <input type="hidden" id="id" name="id"  value="<%=session.getAttribute("userid") %>"/>
                                <input type="hidden" id="memno" name="memno"  value="<%=curUserNo%>"/>
                                <div class="col-12" >
                                    <textarea class="form-control"  name = "review" placeholder="리뷰" id="review" ></textarea>
                                </div>
                               
                                
                                <div class="col-12 col-sm-6">
                                    <select class="form-select" style="height: 55px;" name="score" id="score">
                                        <option value = "-1" selected>별점</option>
                                        <option value="0">0</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                                
                               
                                <div class="col-12 col-sm-6">
                                    <button class="btn btn-primary rounded-pill py-3 px-5" type="submit">리뷰 등록</button>
                                </div>
                                
                            </div>
                        </form>
                        </div></div></div>
	<!-- 리뷰 시작! -->
	<div class="divComment">
			<div class="ctb">
				<table id="comentTb" border="1px soild black">
					<tbody>

					<!-- 댓글 내용 반복문 시작 -->
						<%for(int i=0; i<reviewList.size(); i++) {
							ReviewVO reviewVo = reviewList.get(i);
							MemVO memVo = memDao.selectByNo(reviewVo.getMemno());
							%>
							<div>
							<%-- <input type="hidden" id="r_memno" value="<%=reviewVo.getMemno() %>"> --%>
							</div>					
							<tr height = "150px;">
							<td class="writer"><img class="img-fluid rounded-circle mx-auto" src="<%=memVo.getMem_pic() %>" width="50px" height="20px" onerror="this.onerror=null; this.src='img/mem/user.png'" style="margin-bottom: 0px; padding-bottom: 0px"></td>
							<td class="writer"><%=memVo.getMem_id() %></td>
							<td class="content"><%=reviewVo.getReview() %></td>
							<td><img width="100px" src="img/<%=reviewVo.getScore()%>.png"><%=reviewVo.getScore()%></td>
							<%if(curUserNo==memVo.getMem_no()){
								%>
							<td class="btnX"><input type="button" value="x"><input type="hidden" id="r_no" value="<%=reviewVo.getReno() %>"></td>
						<%	}%>
							
							</tr>
						<%}//for %>
					<!-- 반복 끝 -->
				
				</tbody>
			</table>
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