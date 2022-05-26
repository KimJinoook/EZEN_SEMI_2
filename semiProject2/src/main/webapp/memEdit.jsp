<%@page import="java.sql.SQLException"%>
<%@page import="com.semi2.mem.model.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>

<jsp:useBean id="memService" class="com.semi2.mem.model.MemService" scope="session"></jsp:useBean>
<%
	String userid=(String)session.getAttribute("userid");

	MemVO vo=null;
	try{
		vo=memService.selectByUserid(userid);		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	String zipcode=vo.getMem_zipcode();
	String add=vo.getMem_add();
	String add2=vo.getMem_add2();
	String birth=vo.getMem_birth();
	String tel=vo.getMem_tel();
	
	if(zipcode==null) zipcode="";
	if(add==null) add="";
	if(add2==null) add2="";
	if(birth==null) birth="";
	if(tel==null) tel="";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" href="css/style.css">

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
    

<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#btnJoin').click(function() {
				if ($.trim($('#pwd').val()).length < 1) {
				alert("비밀번호를 입력해주세요.");
				$('#pwd').focus();
				event.preventDefault();

			} else if ($.trim($('#pwd').val()) != $.trim($('#pwd2').val())) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#pwd2').focus();
				event.preventDefault();
						
			}else if(!validate_birth($('#birth').val())){
				alert("생년월일은 숫자만 입력해주세요.");
				$('#birth').focus();
				event.preventDefault();
			}else if(!validate_tel($('#tel').val())){
				alert("휴대전화는 숫자만 입력해주세요.");
				$('#tel').focus();
				event.preventDefault();				
			}
		});
		
		$('#btnChkId').click(function(){
			var id = $('#userid').val();
			
			console.log(id);
						
			window.open("checkUserid.do?userid="+id,"idcheck",
				"width=450,height=200,location=yes,resizable=yes,top=100,left=50");
		});
		
	});

	function validate_userid(id) {
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(id);		
	}

	function validate_tel(tel) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(tel);
	}
	function validate_birth(birth) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(birth);
	}
	
	/** 우편번호 찾기 */
	function execDaumPostcode() {
	    daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	              $("#postcode").val(data.zonecode);
	              $("#address").val(data.roadAddress);
	            }
	        }).open();
	    });
	}
</script>
</head>
<body>
	<!-- header -->
	<!-- Navbar Start -->
	<%@include file="navbar.jsp"%>
	<!-- Navbar End -->
	<!-- 상단 배너 -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
        	<br><br>
            <h1 class="display-3 text-white mb-3 animated slideInDown">이젠 먹으러 갑니다</h1>
            <br><br>
            <br><br>
        </div>
    </div>

	<!-- wrapper -->


	<div id="wrapper">

		<!-- content-->
		<div id="content">
			<form name="frm1" method="post" action="memEdit_ok.jsp" enctype="multipart/form-data">
				<!-- ID -->
			<h3 class="title">회원정보 수정</h3><br><br>
				<div>
	     
				
					<div class="testimonial-item text-center">
							<img class="img-fluid rounded-circle mx-auto mb-5" src="<%=vo.getMem_pic()%>"  onerror="this.onerror=null; this.src='img/mem/user.png'" style="max-width: 150px;">
							<input type="file" class="form-control border-0" name = "fileName" placeholder="사진 등록" style="height: 55px;" accept="image/gif, image/jpg, image/JPG, image/jpeg, image/png, image/PNG">
							<input type="hidden" name="mem_pic" value="<%=vo.getMem_pic()%>">
					</div>
					<br>
					<h3 class="join_title">
						<label for="id">아이디</label>
					</h3>
					<span class="box int_id2">
					<input type="text" name="mem_id" id="userid" class="int" maxlength="20"
					value="<%=userid %>" readonly="readonly" style="color: gray">					
					</span>
				</div>

				<!-- PW1 -->
				<div>
					<h3 class="join_title">
						<label for="pwd">비밀번호</label>
					</h3>
					<span class="box int_pass">
					<input type="password" name="mem_pw" id="pwd" class="int" maxlength="20">
					</span>
				</div>

				<!-- PW2 -->
				<div>
					<h3 class="join_title">
						<label for="pwd2">비밀번호 재확인</label>
					</h3>
					<span class="box int_pass_check">
					<input type="password" id="pwd2" class="int" maxlength="20">
					</span> <span class="error_next_box"></span>
				</div>

				<!-- NAME -->
				<div>
					<h3 class="join_title">
						<label for="name">이름</label>
					</h3>
					<span class="box int_name">
					<input type="text" name="mem_name" id="name" class="int" maxlength="20"
						value="<%=vo.getMem_name() %>" readonly="readonly" style="color: gray">					
					</span>
				</div>

				<!-- BIRTH -->
				<div>
					<h3 class="join_title">
						<label for="birth">생년월일</label>
					</h3>

					<div id="bir_wrap">
						<!-- BIRTH -->
							<span class="box">
							<input type="text" name="mem_birth" id="birth" class="int"
								maxlength="8" placeholder="예) 19930119" value="<%=birth%>">
							</span>

						</div>
						</div>
				<!-- ADDRESS -->
				<div>
					<h3 class="join_title">
						<label for="address">주소<span class="optional"></span></label>
					</h3>
					<span class="box int_zipcode">
					<input type="text" name="mem_zipcode" id="postcode" class="int" readonly="readonly" maxlength="100" placeholder="우편번호"
						value="<%=zipcode%>">
					</span>
					<span>
						<input type="button" value="우편번호 찾기" id="btnZipcode" onclick="execDaumPostcode()" title="새창열림">
					</span>
					<span class="box int_address">
					<input type="text" name="mem_add" id="address" class="int" maxlength="100" placeholder="주소"
						value="<%=add%>">
					</span>
					<span class="box int_address">
					<input type="text" name="mem_add2" id="addressDetail" class="int" maxlength="100" placeholder="상세주소"
						value="<%=add2%>">
					</span>
				</div>

				<!-- MOBILE -->
				<div>
					<h3 class="join_title">
						<label for="phoneNo">휴대전화</label>
					</h3>
					<span class="box int_mobile">
					<input type="tel" name="mem_tel" id="tel" class="int" maxlength="16" placeholder="전화번호 입력"
						value="<%=tel%>">
					</span>
				</div>

				<!-- JOIN BTN-->
				<div class="btn_area">
					<input type="submit" id="btnJoin" value="수정하기">
				</div>
			</form>

		</div>
		<!-- content-->

	</div>
	<!-- wrapper -->
</body>
</html>