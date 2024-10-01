<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<style>
		body {
			margin: 0;
			padding: 0;
			background-color: #fafafa;
			min-height: 100vh;
			/* 화면 높이에 맞추어 최소 높이 설정 */
			font-family: Pretendard;
		}

		.contents {
			align-items: center;
			/* 수직 중앙 정렬 */
			height: 100vh;
			/* 뷰포트 높이 100%로 설정 */
			padding-bottom: 100px;
		}

		.content {
			display: flex;
			flex-direction: column;
			/* 세로 방향으로 배치 */
			align-items: center;
			/* 수평 중앙 정렬 */
			justify-content: center;
			/* 수직 중앙 정렬 */
		}

		/* 제목 스타일 */
		h1 {
			position: absolute;
			top: 150px;
			text-align: center;
			color: #313131;
		}


		/* 회원가입 폼을 감싸는 컨테이너 스타일 */
		.container {
			display: flex;
			flex-direction: column;
			position: absolute;
			gap: 40px;
			/* 박스들 사이의 간격 */
			padding: 100px;
			/* 컨테이너 내부 여백 */
			box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
			/* 박스 그림자 설정 */
			background-color: #fdfdfd;
			/* 박스 배경색 */
			top: 250px;
			width: 600px;
			height: auto;
		}

		.form-group {
			margin-bottom: 30px;
			/* 각 폼 그룹의 하단 마진을 설정합니다. */
			display: flex;
			/* 폼 그룹 내의 항목들을 플렉스 박스로 배치합니다. */
			align-items: center;
			/* 폼 그룹 내 항목들을 수직 중앙에 정렬합니다. */
			flex-wrap: wrap;
			/* 줄바꿈을 허용 */
		}


		.check_font {
				position: relative;
				left: 165px;
				flex-basis: 100%;
				/* 이 요소만 한 줄을 차지하게 함 */
				margin-top: 0px;
				margin-bottom: 0px;
				font-size: 12px;
				/* 메시지 크기 조정 */
				color: red;
				/* 기본 메시지 색상 설정 */
				margin-top: 5px;
				/* 메시지와 입력 필드 사이의 여백 */
			}

		.form-group label {
			width: 150px;
			/* 라벨의 너비를 150px로 설정합니다. */
			margin-right: 10px;
			/* 라벨과 입력 필드 사이의 여백을 설정합니다. */
			font-weight: bold;
			/* 라벨의 글씨를 두껍게 설정합니다. */
		}

		.form-group input {
			flex: 1;
			/* 입력 필드가 남은 공간을 모두 차지하도록 설정합니다. */
			padding: 8px;
			/* 입력 필드의 내부 여백을 설정합니다. */
			border: 1px solid #ccc;
			/* 입력 필드의 테두리 색을 연한 회색으로 설정합니다. */
		}

		.form-group button {
			background-color: #ff4714;
			/* 버튼의 배경색을 주황색으로 설정합니다. */
			color: #fff;
			/* 버튼의 글씨 색을 흰색으로 설정합니다. */
			border: none;
			/* 버튼의 기본 테두리를 제거합니다. */
			padding: 8px;
			/* 입력 필드의 내부 여백을 설정합니다. */
			margin-left: 20px;
		}

		.form-group input {
			width: 200px;


		}


		.submit_btn button {
			background-color: #ff4714;
			/* 버튼의 배경색을 주황색으로 설정합니다. */
			color: #fff;
			/* 버튼의 글씨 색을 흰색으로 설정합니다. */
			border: none;
			/* 버튼의 기본 테두리를 제거합니다. */
			padding: 8px;
			/* 입력 필드의 내부 여백을 설정합니다. */
			margin-left: 20px;
		}

		select {
			padding: 8px;
			/* 입력 필드의 내부 여백을 설정합니다. */
			border: 1px solid #ccc;
			/* 입력 필드의 테두리 색을 연한 회색으로 설정합니다. */
		}

		button:hover {
			color: #ffffffcc;
		}

		.submit_btn button {
			position: relative;
			left: 30%;
			width: calc(100% - 70%);
			text-align: center;
			height: 40px;
		}

		.form-group lable button p {
			display: block;
		}
	</style>

	<script type="text/javascript" src="/js/jquery.js"></script>
	<script>
		// 이메일 인증 
		function emailCheck() {

			var emailCheckMessage = $("#email_check");

			$.ajax({
				url: '/view_jm/sendAuthCode',
				type: 'POST',
				data: { 'user_email': $("#user_email").val() },
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

		$(document).ready(function () {
			$("#verifyAuthCodeBtn").on("click", verifyAuthCode);
		});


	</script>

	<body>
		<header>
			<%@ include file="../header_white.jsp" %>
		</header>
		<div class="contents">
			<div class="content">
				<h1>비밀번호 찾기</h1>
			</div>
			<div class="content">
				<div class="container">
					<form method="post" name="frm" action="/view_jm/findPw">
						<div class="form-group">
							<label for="user_id">아이디</label> <input type="text" id="user_id" name="user_id"
								required="required">
						</div>
						<!-- 이메일 입력 -->
						<div class="form-group">
							<label for="user_email">이메일</label>
							<input type="text" id="user_email" name="user_email" required="required">
							<button type="button" onclick="emailCheck()">인증번호 전송</button>
							<p class="check_font" id="email_check"></p>
						</div>
						<!-- 이메일 인증 번호 -->
						<div class="form-group">
							<label for="auth_code">인증번호</label>
							<input type="text" id="auth_code" name="auth_code">
							<button type="button" id="verifyAuthCodeBtn">인증번호 확인</button>
							<p class="check_font" id="verifyAuthCodeMessage"></p>
						</div>

						<div class="submit_btn">
							<button type="submit" id="submit">회원 확인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<footer>
			<%@ include file="../footer.jsp" %>
		</footer>
	</body>

	</html>