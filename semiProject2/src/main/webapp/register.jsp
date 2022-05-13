<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/register.css">
</head>
<body>
	<!-- header -->
	<div id="header">
		
	</div>

	<!-- wrapper -->
	<div id="wrapper">

		<!-- content-->
		<div id="content">

			<!-- ID -->
			<div>
				<h3 class="join_title">
					<label for="id">아이디</label></h3>
				<span class="box int_id">
				<input type="text" id="id" class="int" maxlength="20">
				<span class="step_url"></span>
				</span>
			</div>

			<!-- PW1 -->
			<div>
				<h3 class="join_title">
					<label for="pswd1">비밀번호</label>
				</h3>
				<span class="box int_pass">
				<input type="text" id="pswd1" class="int" maxlength="20">
				</span>
			</div>

			<!-- PW2 -->
			<div>
				<h3 class="join_title">
					<label for="pswd2">비밀번호 재확인</label>
				</h3> <span class="box int_pass_check">
				<input type="text" id="pswd2" class="int" maxlength="20">
				</span> <span class="error_next_box"></span>
			</div>

			<!-- NAME -->
			<div>
				<h3 class="join_title">
					<label for="name">이름</label>
				</h3>
				<span class="box int_name">
				<input type="text" id="name" class="int" maxlength="20">
				</span>
			</div>

			<!-- BIRTH -->
			<div>
				<h3 class="join_title">
					<label for="yy">생년월일</label>
				</h3>

				<div id="bir_wrap">
					<!-- BIRTH_YY -->
					<div id="bir_yy">
						<span class="box">
						<input type="text" id="yy" class="int" maxlength="4" placeholder="년(4자)">
						</span>
					</div>

					<!-- BIRTH_MM -->
					<div id="bir_mm">
						<span class="box"> <select id="mm" class="sel">
								<option>월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select>
						</span>
					</div>

					<!-- BIRTH_DD -->
					<div id="bir_dd">
						<span class="box">
						<input type="text" id="dd" class="int" maxlength="2" placeholder="일">
						</span>
					</div>

				</div>
				<span class="error_next_box"></span>
			</div>
			<!-- ADDRESS -->
			<div>
				<h3 class="join_title">
					<label for="address">주소<span class="optional"></span></label>
				</h3>
				<span class="box int_address">
				<input type="text" id="address"	class="int" maxlength="100" placeholder="주소 입력">
				</span>
			</div>

			<!-- MOBILE -->
			<div>
				<h3 class="join_title">
					<label for="phoneNo">휴대전화</label>
				</h3>
				<span class="box int_mobile">
				<input type="tel" id="mobile" class="int" maxlength="16" placeholder="전화번호 입력">
				</span>
			</div>

			<!-- JOIN BTN-->
			<div class="btn_area">
				<button type="button" id="btnJoin" onclick="location.href='register_ok.jsp'">
					<span>가입하기</span>
				</button>
			</div>

		</div>
		<!-- content-->

	</div>
	<!-- wrapper -->
	
</body>
</html>
