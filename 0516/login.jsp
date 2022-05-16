<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memVo" class="com.semi2.db.MemVO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/style.css">
<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/login.css">
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
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
</script>
</head>
<body>
<form name="frmLogin" action="login_ok.jsp" method="post">
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
    <!-- 상단 배너 끝 -->
    <!-- content-->
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
		<input type="button" onclick="location.href='register.jsp'" id="btnRegister" value="회원가입">
	</div>
	
	<!-- content-->
	</div>
</form>
</body>
</html>