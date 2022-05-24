<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memVo" class="com.semi2.mem.model.MemVO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/login.css">

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
    
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">	
	$(function(){		
		$('#btnLogin').click(function(){
			if($.trim($('#userid').val()).length<1){
				alert("아이디를 입력하세요");
				$('#userid').focus();
				event.preventDefault();				
			}else if ($.trim($('#pwd').val()).length<1) {
				alert("비밀번호를 입력하세요");
				$('#pwd').focus();
				event.preventDefault();
			}
		});
	});
	function loginFormWithKakao(){
		Kakao.init('f86207cb3e373497b43b01dbe07eb389');

		Kakao.Auth.login({
	        success: function(authObj) {
	         
	          //2. 로그인 성공시, API 호출
	          Kakao.API.request({
	            url: '/v2/user/me',
	            success: function(res) {
	              console.log(res);
	              var id = res.id;
	              var account = res.kakao_account;
	              $('#form-kakao-login input[name=email]').val(account.email);
	              $('#form-kakao-login input[name=nick]').val(account.profile.nickname);
	              $('#form-kakao-login input[name=img]').val(account.profile.img);
				  scope : 'account_email';
				alert('로그인성공');
				document.querySelector('#form-kakao-login').submit();
			

	              
	        }
	          })
	          console.log(authObj);
	          var token = authObj.access_token;
	        },
	        fail: function(err) {
	          alert(JSON.stringify(err));
	        }
	      });
	};
</script>
</head>
<body>
<!-- Navbar Start -->
	<%@include file="navbar.jsp"%>
	<!-- Navbar End -->

    <!-- 상단 배너 -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown">이젠 먹으러 갑니다</h1>
        </div>
    </div>
    <!-- 상단 배너 끝 -->
    <!-- content-->
    <div>
	<form name="frmLogin" action="login_ok.do" method="post">
		<div id="content">
		    <!-- ID -->
			<div>
				<h3 class="join_title">
				<label for="id">아이디</label>
				</h3>
				<span class="box int_id">
				<input type="text" id="userid" name="userid" class="int" maxlength="20">
				</span>
				
			</div>
			
			<!-- PW1 -->
			<div>
				<h3 class="join_title">
				<label for="pwd">비밀번호</label>
				</h3>
				<span class="box int_pass">
				<input type="password" id="pwd" name="pwd" class="int" maxlength="20">
				</span>
			</div>
			<!-- JOIN BTN-->
			<div class="btn_area">
				<input type="submit" id="btnLogin" value="로그인">
					<span class="reg">아직 회원이 아닌가요? <a href="register.do">여기</a>를 눌러서 회원가입하기</span>
			<span class="other">――――――――――――― 또는 ―――――――――――――</span>
			<br>
			<div class="kakao_login">
	<a class="kakao" id="reauthenticate-popup-btn" href="javascript:loginFormWithKakao()">
		<img width="100%" src="img/kakaotalk_logo.png">
	</a>
    </div>
		</div>
	</div>
	</form>
	</div>
	
	<form id="form-kakao-login" method="post" action="kakaoLogin_ok.jsp">
		<input type="hidden" name="email"/>
		<input type="hidden" name="nick"/>
		<input type="hidden" name="img"/>
	</form>
	<!-- content-->
</body>
</html>