<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<link href="../css/join.css" rel="stylesheet" type="text/css">
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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

			// 상태 변수
			let isIdConfirmed = false;  // 아이디 중복 확인 상태
			let isAuthCodeVerified = false;  // 인증번호 확인 상태


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




			// 아이디 유효성 확인
			function validateId() {
				// 아이디 정규 표현식
				const idRegex = /^[a-z][a-z0-9_]{3,11}$/; // 아이디: 소문자, _, 4~12글자
				var id = $("#user_id").val().trim();
				var idCheckMessage = $("#idCheckMessage");

				idCheckMessage.text(""); // 에러 메시지 초기화

				if (id === "") {
					showError("아이디를 입력해주세요.", "#idCheckMessage");
					return false;
				}

				if (id.length < 4 || id.length > 12) {
					showError("아이디는 4자 이상 12자 이하로 입력해주세요.", "#idCheckMessage");
					return false;
				}

				if (!idRegex.test(id)) {
					showError("아이디는 소문자로 시작하고, 소문자, 숫자, _ 만 허용됩니다.", "#idCheckMessage");
					return false;
				}

				return true;
			}

			// 아이디 중복 확인
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
							showError("중복된 아이디 입니다", "#idCheckMessage");
							isIdConfirmed = false;
						} else {
							idCheckMessage.text("사용 가능한 아이디입니다.").css("color", "green");
							isIdConfirmed = true;
						}
						enableSubmit();  // 상태 업데이트 후 submit 버튼 활성화 여부 확인
					}
				});
			}
			// 비밀번호 유효성 확인
			function validatePassword() {
				const pwRegex = /^[A-Za-z0-9_@!]{6,12}$/; // 비밀번호: 대소문자, 숫자, _, @, !, 6~12글자
				var password = $("#user_pw").val().trim();
				var pwCheckMessage = $("#pwCheckMessage"); // 비밀번호 입력 메시지

				// 에러 메시지 초기화
				pwCheckMessage.text("");

				if (password === "") {
					showError("비밀번호를 입력해주세요.", "#pwCheckMessage");
					$("#user_pw_confirm").attr("disabled", true); // 비밀번호 확인 비활성화
					return false;
				}

				if (password.length < 6 || password.length > 12) {
					showError("비밀번호는 6자 이상 12자 이하로 입력해주세요.", "#pwCheckMessage");
					// 비밀번호 확인 비활성화
					$("#user_pw_confirm").attr("disabled", true);
					return false;
				}

				// 입력 값이 정규 표현식에 맞지 않은 경우
				if (!pwRegex.test(password)) {
					showError("비밀번호는 대소문자, 숫자, !, _, @ 만 입력해주세요.", "#pwCheckMessage");
					$("#user_pw_confirm").attr("disabled", true);
					return false;
				}

				// 비밀번호가 유효하면 비밀번호 확인 활성화 및 성공 메시지 표시
				$("#user_pw_confirm").attr("disabled", false);
				pwCheckMessage.text("사용 가능한 비밀번호입니다.").css("color", "green");
				return true;
			}

			// 비밀번호 확인 유효성 확인
			function validatePasswordConfirm() {
				var password = $("#user_pw").val().trim();
				var passwordConfirm = $("#user_pw_confirm").val().trim();
				var pwConfirmMessage = $("#pwConfirmMessage"); // 비밀번호 확인 메시지

				pwConfirmMessage.text(""); // 에러 메시지 초기화

				if (password !== passwordConfirm) {
					showError("비밀번호가 일치하지 않습니다.", "#pwConfirmMessage");
					$("#submitBtn").attr("disabled", true); // 비밀번호가 일치하지 않으면 버튼 비활성화
					return false;
				}
				pwConfirmMessage.text("비밀번호가 일치합니다.").css("color", "green");

				return true;
			}



			function validateName() {
				// 정규 표현식
				const nameRegex = /^[가-힣]+$/; // 이름: 한글만 허용

				var name = $("#user_name").val().trim();
				var nameCheckMessage = $("#nameCheckMessage");

				nameCheckMessage.text(""); // 에러 메시지 초기화

				if (!nameRegex.test(name)) {
					showError("한글을 입력해주세요", "#nameCheckMessage");

					return false;
				}


				return true;
			}
			// 전화번호 유효성 확인
			function validatePhone() {
				const phoneRegex = /^\d{2,3}-\d{3,4}-\d{4}$/; // 전화번호: XXX-XXXX-XXXX 형식
				var phone = $("#user_tel").val().trim();
				var phoneCheckMessage = $("#phoneCheckMessage");

				phoneCheckMessage.text(""); // 에러 메시지 초기화

				if (!phoneRegex.test(phone)) {
					showError("-를 제외하고 입력해주세요", "#phoneCheckMessage");
					return false;
				}

				return true;
			}

			$(function () {
				//직접입력 인풋박스 기존에는 숨어있다가
				$("#user_email3").hide();
				$("#user_email2").change(function () {
					//직접입력을 누를 때 나타남
					if ($("#user_email2").val() == "direct") {
						$("#user_email3").show();
						$("#user_email2").css("width", "22px")
					} else {
						$("#user_email3").hide();
						$("#user_email2").css("width", ""); // 기본 크기로 되돌림
					}
				})
			});


			// 이메일 유효성 확인 및 전체 이메일을 user_email로 설정
			function validateEmail() {
				// const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; // 이메일: 기본적인 이메일 형식
				var email = $("#user_email1").val().trim();
				var emailDomain = $("#user_email2").val(); // 지정된 도메인 값
				var emailDirect = $("#user_email3").val().trim(); // 직접 입력한 도메인 값

				if (emailDomain == "direct") {
					// 직접 입력된 도메인 사용 
					emailDomain = emailDirect;
				}
				// 이메일 전체 합치기
				var fullEmail = email + "@" + emailDomain;
				var emailCheckMessage = $("#email_check");

				// 에러 메시지 초기화
				emailCheckMessage.text("");

				// 이메일 유효성 검사 정규식
				const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

				if (!emailRegex.test(fullEmail)) {
					showError("유효한 이메일 주소를 입력해주세요.", "#email_check");
					return false;
				}

				// 이메일이 유효하면 hidden input에 값을 설정
				$("#hidden_user_email").val(fullEmail);

				return true;
			}

			// 에러 메시지 출력 및 submit 버튼 비활성화
			function showError(message, elementId) {
				$(elementId).text(message).css("color", "red");
				$("#submitBtn").attr("disabled", true);
			}

			// submit 버튼 활성화
			function enableSubmit() {
				if (isIdConfirmed && isAuthCodeVerified && validateId() && validatePassword() && validatePasswordConfirm() && validatePhone() && validateEmail()) {
					$("#submitBtn").attr("disabled", false);
				} else {
					$("#submitBtn").attr("disabled", true);
				}
			}
			// 이벤트 핸들러
			$(document).ready(function () {
				$("#user_id").on("input", function () {
					validateId();
					confirmId();  // 아이디 중복 확인 호출
				});

				$("#user_pw").on("input", function () {
					validatePassword();
					enableSubmit();
				});

				$("#user_pw_confirm").on("input", function () {
					validatePasswordConfirm();
					enableSubmit();
				});

				$("#user_name").on("input", function () {
					validateName();
					enableSubmit();
				});

				$("#user_tel").on("input", function () {
					validatePhone();
					enableSubmit();
				});

				$("#user_email1, #user_email2, #user_email3").on("input", function () {
					validateEmail();
					enableSubmit();
				});


				$("#verifyAuthCodeBtn").on("click", verifyAuthCode);
			});


			// 이메일 인증 
			function emailCheck() {

				var emailCheckMessage = $("#email_check");

				$.ajax({
					url: '/view_jm/sendAuthCode',
					type: 'POST',
					data: { 'user_email': $("#hidden_user_email").val() },
					success: function (response) {
						emailCheckMessage.text("인증번호가 전송 되었습니다").css("color", "green");
					},
					error: function () {
						emailCheckMessage.text("인증번호가  전송 실패하였습니다.").css("color", "red");
					}
				});
			}

			// 인증번호 확인
			function verifyAuthCode() {
				var authCode = $("#auth_code").val().trim();
				$.ajax({
					url: '/view_jm/verifyAuthCode',
					type: 'POST',
					data: { 'auth_code': authCode },
					success: function (response) {
						if (response.valid) {
							$("#verifyAuthCodeMessage").text("인증번호가 확인되었습니다.");
							$("#verifyAuthCodeMessage").css("color", "green");
							isAuthCodeVerified = true;
						} else {
							$("#verifyAuthCodeMessage").text("인증번호가 틀렸습니다.");
							$("#verifyAuthCodeMessage").css("color", "red");
							isAuthCodeVerified = false;
						}
						enableSubmit();  // 상태 업데이트 후 submit 버튼 활성화 여부 확인
					},
					error: function () {
						alert("인증번호 확인 중 오류가 발생했습니다.");
					}
				});
			}

			const hypenTel = (target) => {
				target.value = target.value
					.replace(/[^0-9]/g, '')
					.slice(0, 11)                 // 최대 11자리까지만 입력

				// 입력된 값에 맞춰 하이픈 추가
				if (target.value.length > 10) {
					// XXX-XXXX-XXXX 형식 (11자리)
					target.value = target.value.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
				} else if (target.value.length > 9) {
					// XX-XXXX-XXXX 형식 (10자리)
					target.value = target.value.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
				} else if (target.value.length > 8) {
					// XX-XXX-XXXX 형식 (9자리)
					target.value = target.value.replace(/(\d{2})(\d{3})(\d{4})/, '$1-$2-$3');
				}
			};
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
					<form method="post" name="frm" action="/view_jm/join">

						<!--  아이디 -->
						<div class="form-group">
							<label for="user_id">아이디</label>
							<input type="text" id="user_id" name="user_id">
							<button type="button" id="id_check_btn" onclick="confirmId()">중복확인</button>
							<p class="check_font" id="idCheckMessage"></p>
						</div>

						<!--  비밀번호 -->
						<div class="form-group">
							<label for="user_pw">비밀번호</label>
							<input type="password" id="user_pw" name="user_pw">
							<p class="check_font" id="pwCheckMessage"></p>
						</div>

						<!-- 비밀번호 확인 -->
						<div class="form-group">
							<label for="user_pw_confirm">비밀번호 확인</label>
							<input type="password" id="user_pw_confirm" name="user_pw_confirm">
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
							<p class="check_font" id="phoneCheckMessage"></p>
						</div>

						<!-- 우편 번호 -->
						<div class="form-group">
							<label for="user_zipcode">우편번호</label>
							<input type="text" id="user_zipcode" name="user_zipcode">
							<button type="button" onclick="findAddr()">주소 검색</button>
						</div>

						<!-- 주소 -->
						<div class="form-group">
							<label for="user_addr1">주소</label>
							<input type="text" id="user_addr1" name="user_addr1">
						</div>

						<!-- 상세 주소 -->
						<div class="form-group">
							<label for="user_addr2">상세주소</label>
							<input type="text" id="user_addr2" name="user_addr2">
						</div>

						<!-- 이메일  -->
						<div class="form-group">
							<label for="user_email">이메일</label>
							<input type="text" id="user_email1" name="user_email1"
								style="width: 30px;">
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
							<p class="check_font" id="email_check"></p>
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
								<a href="/view_jm/buyerJoinAgree"><button id="backBtn" type="reset" >이전</button></a>
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