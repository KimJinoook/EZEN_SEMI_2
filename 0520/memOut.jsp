<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/login.css">
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#btnOut').click(function(){
			if(confirm('정말로 탈퇴하시겠습니까?')){
				if($('#pwd').val().length<1){
					alert('비밀번호를 입력해주세요.');
					$('#pwd').focus();
					event.preventDefault();
				}else if($.trim($('#pwd').val()) != $.trim($('#pwd2').val())) {
					alert("비밀번호가 일치하지 않습니다.");
					$('#pwd2').focus();
					event.preventDefault();
				}
			}else{
				event.preventDefault();
			}
		});
	});
</script>
</head>
<body>
<form name="frmOut" action="memOut_ok.jsp" method="post">
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
<div id="content">
    <h3 class="out">회원탈퇴</h3>	
	<!-- PW1 -->
	<div>
		<h3 class="join_title">
		<label for="pwd">비밀번호</label>
		</h3>
		<span class="box int_pass">
		<input type="password" id="pwd" name="mem_pw" class="int" maxlength="20">
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
	<!-- JOIN BTN-->
	<div class="btn_area">
		<input type="submit" id="btnOut" value="탈퇴하기">
	</div>
	
	<!-- content-->
	</div>
	</form>
</body>
</html>