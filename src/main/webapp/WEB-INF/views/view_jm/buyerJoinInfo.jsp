<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<link href="../css/join.css" rel="stylesheet" type="text/css">
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>개인회원 개인정보</title>
		<style>
			#user_email3 {
				width: 50px;
			}


			footer {
				position: relative;
				top: 900px;
			}
		</style>
		<script type="text/javascript" src="/js/jquery.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">

			// 주소찾기 다음 api
			function findAddr() {
				new daum.Postcode({
					oncomplete: function (data) {
						var roadAddr = data.roadAddress;
						var jibunAddr = data.jibunAddress;
						document.getElementById('user_zipcode').value = data.zonecode;
						if (roadAddr !== '') {
							document.getElementById("user_addr1").value = roadAddr;
						} else if (jibunAddr !== '') {
							document.getElementById("user_addr2").value = jibunAddr;
						}
						// 상세 주소에 자동 포커스
						document.getElementById("user_addr2").focus();
					}
				}).open();
			}

			let isValid = true; // 제출 확인 여부
			let isIdConfirmed = false; // 아이디 중복 확인 여부


			// 아이디 유효성 확인
			function validateId() {
				// 아이디 정규 표현식
				const idRegex = /^[a-z][a-z0-9_]{3,11}$/; // 아이디: 소문자, _, 4~12글자
				var id = $("#user_id").val().trim();
				var idCheckMessage = $("#idCheckMessage");

				idCheckMessage.text(""); // 에러 메시지 초기화
				isValid = true; // 초기화

				if (id.length < 4 || id.length > 12) {
					idCheckMessage.text("아이디는 4-12자의 소문자 및 숫자, _로 이루어져야 합니다.").css("color", "red");
					isValid = false;
				} else if (!idRegex.test(id)) {
					idCheckMessage.text("아이디는 소문자로 시작해야 하며, 소문자, 숫자, _만 포함할 수 있습니다.").css("color", "red");
					isValid = false;
				}

				return isValid; // 결과 반환
			}

			function confirmId() {
				if (!validateId()) return;

				$.ajax({
					url: '/view_jm/confirmId',
					type: 'GET',
					dataType: 'json',
					data: { 'user_id': $("#user_id").val() },
					success: function (data) {
						var idCheckMessage = $("#idCheckMessage");
						if (data === 1) {
							// 유효하지 않은 경우
							idCheckMessage.text("중복된 아이디 입니다").css("color", "red");
							isIdConfirmed = false;
						} else {
							idCheckMessage.text("사용 가능한 아이디입니다.").css("color", "green");
							isIdConfirmed = true;
						}
					}
				});
			}

			// 비밀번호 유효성 확인
			function validatePw() {
				const pwRegex = /^[A-Za-z0-9_@!]{6,12}$/; // 비밀번호: 대소문자, 숫자, _, @, !, 6~12글자
				var password = $("#user_pw").val().trim();
				var pwCheckMessage = $("#pwCheckMessage"); // 비밀번호 입력 메시지


				isValid = true; // 초기화
				// 에러 메시지 초기화
				pwCheckMessage.text("");

				if (password === "") {
					pwCheckMessage.text("비밀번호를 입력해주세요.").css("color", "red");
					$("#user_pw_confirm").attr("disabled", true); // 비밀번호 확인 비활성화
					isValid = false;
				}

				if (password.length < 6 || password.length > 12) {
					pwCheckMessage.text("비밀번호는 6자 이상 12자 이하로 입력해주세요.").css("color", "red");
					// 비밀번호 확인 비활성화
					$("#user_pw_confirm").attr("disabled", true);
					isValid = false;
				}

				// 입력 값이 정규 표현식에 맞지 않은 경우
				if (!pwRegex.test(password)) {
					pwCheckMessage.text("비밀번호는 6자 비밀번호는 대소문자, 숫자, !, _, @ 만 입력해주세요.").css("color", "red");
					$("#user_pw_confirm").attr("disabled", true);
					isValid = false;
				}

				// 비밀번호가 유효하면 비밀번호 확인 활성화 및 성공 메시지 표시
				$("#user_pw_confirm").attr("disabled", false);
				pwCheckMessage.text("사용 가능한 비밀번호입니다.").css("color", "green");


				return isValid
			}

			// 비밀번호 확인 유효성 확인
			function validatePwConfirm() {
				var password = $("#user_pw").val().trim();
				var passwordConfirm = $("#user_pw_confirm").val().trim();
				var pwConfirmMessage = $("#pwConfirmMessage"); // 비밀번호 확인 메시지

				isValid = true; // 초기화
				pwConfirmMessage.text(""); // 에러 메시지 초기화

				if (password !== passwordConfirm) {
					pwConfirmMessage.text("비밀번호가 일치하지 않습니다.").css("color", "red");
					isValid = false;
				} else {
					pwConfirmMessage.text("비밀번호가 일치합니다.").css("color", "green");
				}

				return isValid;
			}






			function chkValue() {
				var user_id = $("#user_id").val().trim();
				var user_pw = $("#user_pw").val().trim();
				var user_pw_comfirm = $("#user_pw_confirm").val().trim();
				var user_name = $("#user_name").val().trim();
				var user_tel = $("#user_tel").val().trim();
				var user_zipcode = $("#user_zipcode").val().trim();
				var user_addr1 = $("#user_addr1").val().trim();
				var user_addr2 = $("#user_addr2").val().trim();
				var hidden_user_email = $("#hidden_user_email").val().trim();
				var auth_code = $("#auth_code").val().trim();

				var idCheckMessage = $("#idCheckMessage");
				var pwCheckMessage = $("#pwCheckMessage");
				var pwConfirmMessage = $("#pwConfirmMessage");
				var nameCheckMessage = $("#nameCheckMessage");
				var telCheckMessage = $("#telCheckMessage");
				var zipcodeCheckMessage = $("#zipcodeCheckMessage");
				var addr1CheckMessage = $("#addr1CheckMessage");
				var addr2CheckMessage = $("#addr2CheckMessage");
				var emailCheckMessage = $("#emailCheckMessage");
				var verifyAuthCodeMessage = $("#verifyAuthCodeMessage");

				// 기본적인 비어있는지 여부 확인
				if (!isValid) {
					return false
				}

				// 중복 확인 상태 체크
				if (!isIdConfirmed) {
					$("#idCheckMessage").text("아이디 중복 확인을 해주세요.").css("color", "red");
					$("#user_id").focus();
					return false; // 중복 확인이 안 되었으므로 제출 금지
				}

				if (user_id === "") {
					idCheckMessage.text("아이디를 입력해주세요.").css("color", "red");
					$("#user_id").focus();
					isValid = false;
					return false;
				} else {
					idCheckMessage.text("")
				}


				if (user_pw === "") {
					pwCheckMessage.text("비밀번호를 입력해주세요.").css("color", "red");
					$("#user_pw").focus();
					isValid = false;
					return false;
				} else {
					pwCheckMessage.text("")
				}


				if (user_name === "") {
					pwConfirmMessage.text("비밀번호 확인을 위해 입력해주세요.").css("color", "red");
					$("#user_pw_confirm").focus();
					isValid = false;
					return false;
				} else {
					pwConfirmMessage.text("")
				}


				if (user_name === "") {
					nameCheckMessage.text("이름을 입력해주세요.").css("color", "red");
					$("#user_name").focus();
					isValid = false;
					return false;
				} else {
					nameCheckMessage.text("")
				}

				if (user_tel === "") {
					telCheckMessage.text("전화번호를 입력해주세요.").css("color", "red");
					$("#user_tel").focus();
					isValid = false;
					return false;
				} else {
					telCheckMessage.text("")
				}
				if (user_zipcode === "") {
					zipcodeCheckMessage.text("우편번호를 입력해주세요.").css("color", "red");
					$("#user_zipcode").focus();
					isValid = false;
					return false;
				} else {
					zipcodeCheckMessage.text("")
				}
				if (user_addr1 === "") {
					addr1CheckMessage.text("주소를 입력해주세요.").css("color", "red");
					$("#user_addr1").focus();
					isValid = false;
					return false;
				} else {
					addr1CheckMessage.text("")
				}
				if (user_addr2 === "") {
					addr2CheckMessage.text("상세주소를 입력해주세요.").css("color", "red");
					$("#user_addr2").focus();
					isValid = false;
					return false;
				} else {
					addr2CheckMessage.text("")
				}

				if (hidden_user_email === "") {
					emailCheckMessage.text("이메일을 입력해주세요.").css("color", "red");
					isValid = false;
					return false;
				} else {
					emailCheckMessage.text("")
				}

				if (auth_code === "") {
					verifyAuthCodeMessage.text("인증번호를 입력해주세요").css("color", "red");
					$("#auth_code").focus();
					isValid = false;
					return false;
				} else {
					verifyAuthCodeMessage.text("")
				}

				return isValid;

			}
		</script>
	</head>

	<body>
		<header>
			<%@ include file="../header_white.jsp" %>
		</header>
		<div class="contents">
			<div class="content">
				<h1>회원가입</h1>
			</div>
			<div class="content">
				<ul class="join_step">
					<li>
						<img src="<%=request.getContextPath()%>/images/main/joinAgree_after.png">
						<span>약관동의</span>
					</li>
					<li>
						<img src="<%=request.getContextPath()%>/images/main/joinInfo.png">
						<span>회원 정보 입력</span>
					</li>
					<li>
						<img src="<%=request.getContextPath()%>/images/main/joinOk_before.png">
						<span>가입신청</span>
					</li>
				</ul>
			</div>
			<div class="content">
				<div class="container">
					<form method="post" name="frm" action="/view_jm/join" onsubmit="return chkValue();">

						<!--  아이디 -->
						<div class="form-group">
							<label for="user_id">아이디</label>
							<input type="text" id="user_id" name="user_id" oninput="validateId()">
							<button type="button" id="id_check_btn" onclick="confirmId()">중복확인</button>
							<p class="check_font" id="idCheckMessage"></p>
						</div>

						<!--  비밀번호 -->
						<div class="form-group">
							<label for="user_pw">비밀번호</label>
							<input type="password" id="user_pw" name="user_pw" oninput="validatePw()">
							<p class="check_font" id="pwCheckMessage"></p>
						</div>

						<!-- 비밀번호 확인 -->
						<div class="form-group">
							<label for="user_pw_confirm">비밀번호 확인</label>
							<input type="password" id="user_pw_confirm" name="user_pw_confirm"
								oninput="validatePwConfirm()">
							<p class="check_font" id="pwConfirmMessage"></p>
						</div>

						<!-- 이름 -->
						<div class="form-group">
							<label for="user_name">이름</label>
							<input type="text" id="user_name" name="user_name">
							<p class="check_font" id="nameCheckMessage"></p>
						</div>

						<!-- 휴대폰 번호 -->
						<div class="form-group">
							<label for="user_tel">휴대폰 번호</label>
							<input type="text" id="user_tel" name="user_tel" oninput="hypenTel(this)">
							<p class="check_font" id="telCheckMessage"></p>
						</div>

						<!-- 우편 번호 -->
						<div class="form-group">
							<label for="user_zipcode">우편번호</label>
							<input type="text" id="user_zipcode" name="user_zipcode">
							<button type="button" onclick="findAddr()">주소 검색</button>
							<p class="check_font" id="zipcodeCheckMessage"></p>
						</div>

						<!-- 주소 -->
						<div class="form-group">
							<label for="user_addr1">주소</label>
							<input type="text" id="user_addr1" name="user_addr1">
							<p class="check_font" id="addr1CheckMessage"></p>
						</div>

						<!-- 상세 주소 -->
						<div class="form-group">
							<label for="user_addr2">상세주소</label>
							<input type="text" id="user_addr2" name="user_addr2">
							<p class="check_font" id="addr2CheckMessage"></p>
						</div>

						<!-- 이메일  -->
						<div class="form-group">
							<label for="user_email">이메일</label>
							<input type="text" id="user_email1" name="user_email1" style="width: 30px;">
							&nbsp;@&nbsp;
							<input type="text" id="user_email3" name="selboxDirect" />
							<select id="user_email2" name="email_domain">
								<option value="naver.com">naver.com</option>
								<option value="naver.com">daum.net</option>
								<option value="naver.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="direct">직접입력</option>
							</select>
							<button type="button" onclick="emailCheck()">인증번호 전송</button>
							<p class="check_font" id="emailCheckMessage"></p>
							<!-- hidden input to hold the full email value -->
							<input type="hidden" id="hidden_user_email" name="user_email" />
						</div>

						<!-- 이메일 인증 번호 -->
						<div class="form-group">
							<label for="auth_code">인증번호</label>
							<input type="text" id="auth_code" name="auth_code">
							<button type="button" id="verifyAuthCodeBtn">인증번호 확인</button>
							<p class="check_font" id="verifyAuthCodeMessage"></p>
						</div>

						<!-- 제출 버튼 -->
						<div class="form-gruop">
							<div class="moveBtn">
								<a href="/view_jm/buyerJoinAgree"><button id="backBtn"
										onclick="history.back();">이전</button></a>
								<a href="/view_jm/buyerJoinInfo"><button type="submit" id="submitBtn">회원가입</button></a>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>

	</body>
	<footer>
		<%@ include file="../footer.jsp" %>
	</footer>

	</html>