<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    String stno = request.getParameter("st_no");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			var n = $('input[name=name]').val();
			var l = $('input[name=price]').val();
			var f = $('#inputstoreimg').val();
			if(n.length<1){
				alert('메뉴 이름을 입력해야합니다');
				event.preventDefault();
				event.stopPropagation();
			}else if(l.length<1){
				alert('가격을 입력해야합니다');
				event.preventDefault();
				event.stopPropagation();
			}else if(f.length<1){
				alert('사진을 등록해야합니다');
				event.preventDefault();
				event.stopPropagation();
			}
		});
		
	});
</script>
<form method="post" action="menu_add_ok.jsp" enctype="multipart/form-data" name="frmstoreadd">
                            <div class="row g-3">
                                  
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" name = "name" placeholder="메뉴 이름" style="height: 55px;" id="inputlistname"  >
                                    <input type="hidden" class="form-control border-0" name = "stno" placeholder="메뉴 이름" style="height: 55px;" id="inputlistname" value = "<%=stno %>"  >
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="file" class="form-control border-0" name = "fileName" placeholder="사진 등록" style="height: 55px;" accept="image/gif, image/jpg, image/JPG, image/jpeg, image/png, image/PNG" id="inputstoreimg">
                               
                                </div>
                             
                                
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control border-0" name = "price" placeholder="가격대" style="height: 55px;" id="inputlistname">
                                </div>
                                
                                <div class="col-12 col-sm-6">
                                    <button class="btn btn-primary rounded-pill py-3 px-5" type="submit">메뉴 등록</button>
                                </div>
                             
                            </div>
                        </form>
</body>
</html>