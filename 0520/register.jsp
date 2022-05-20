<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" href="css/style.css">
<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#btnJoin').click(function() {
			if (!validate_userid($('#userid').val())) {
				alert("아이디는 영문, 숫자, _(밑줄문자)만 가능합니다.");
				$('#userid').focus();
				event.preventDefault();
			
			} else if ($.trim($('#pwd').val()).length < 1) {
				alert("비밀번호를 입력해주세요.");
				$('#pwd').focus();
				event.preventDefault();

			} else if ($.trim($('#pwd').val()) != $.trim($('#pwd2').val())) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#pwd2').focus();
				event.preventDefault();
						
			} else if ($.trim($('#name').val())=="") {
				alert("이름을 입력해주세요.");
				$('#name').focus();
				event.preventDefault();
						
			}else if(!validate_birth($('#birth').val())){
				alert("생년월일은 숫자만 입력해주세요.");
				$('#birth').focus();
				event.preventDefault();
			}else if(!validate_tel($('#tel').val())){
				alert("휴대전화는 숫자만 입력해주세요.");
				$('#tel').focus();
				event.preventDefault();				
			}else if ($('#chkId').val() != 'Y') {
				alert("아이디 중복확인을 해주세요.");
				$('#btChkId').focus();
				event.preventDefault();
			}
		});
		
		$('#btnChkId').click(function(){
			var id = $('#userid').val();
						
			window.open("checkUserid.jsp?userid="+id,"idcheck",
				"width=450,height=200,location=no,resizable=no,top=100,left=50");
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
            <h1 class="display-3 text-white mb-3 animated slideInDown">이젠 먹으러 갑니다</h1>
        </div>
    </div>

	<!-- wrapper -->
	<div id="wrapper">

		<!-- content-->
		<div id="content">
			<form name="frm1" method="post" action="register_ok.jsp">
				<!-- ID -->
				<h3 class="title">회원가입</h3>
				<div>
					<h3 class="join_title">
						<label for="id">아이디</label>
					</h3>
					<span class="box int_id">
					<input type="text" name="mem_id" id="userid" class="int" maxlength="20"> <span class="step_url"></span>
					</span>
					<input type="button" value="중복확인" id="btnChkId" title="새창열림">
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
					<input type="text" name="mem_name" id="name" class="int" maxlength="20">
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
								maxlength="8" placeholder="예) 19930119">
							</span>

						</div>
						</div>
				<!-- ADDRESS -->
				<div>
					<h3 class="join_title">
						<label for="address">주소<span class="optional"></span></label>
					</h3>
					<span class="box int_zipcode">
					<input type="text" name="mem_zipcode" id="postcode" class="int" readonly="readonly" maxlength="100" placeholder="우편번호">
					</span>
					<span>
						<input type="button" value="우편번호 찾기" id="btnZipcode" onclick="execDaumPostcode()" title="새창열림">
					</span>
					<span class="box int_address">
					<input type="text" name="mem_add" id="address" class="int" maxlength="100" placeholder="주소">
					</span>
					<span class="box int_address">
					<input type="text" name="mem_add2" id="addressDetail" class="int" maxlength="100" placeholder="상세주소">
					</span>
				</div>

				<!-- MOBILE -->
				<div>
					<h3 class="join_title">
						<label for="phoneNo">휴대전화</label>
					</h3>
					<span class="box int_mobile">
					<input type="tel" name="mem_tel" id="tel" class="int" maxlength="11" placeholder="'-'를 제외한 전화번호 입력">
					</span>
				</div>

				<!-- JOIN BTN-->
				<div class="btn_area">
					<input type="submit" id="btnJoin" value="가입하기">
				</div>
				<input type ="text" name="chkId" id="chkId">
			</form>

		</div>
		<!-- content-->

	</div>
	<!-- wrapper -->
</body>
</html>