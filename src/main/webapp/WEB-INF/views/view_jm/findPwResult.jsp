<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	min-height: 100vh; /* 화면 높이에 맞추어 최소 높이 설정 */
	font-family: Pretendard;
}

.contents {
	align-items: center; /* 수직 중앙 정렬 */
	height: 100vh; /* 뷰포트 높이 100%로 설정 */
	padding-bottom: 100px;
}

.content {
	display: flex;
	flex-direction: column; /* 세로 방향으로 배치 */
	align-items: center; /* 수평 중앙 정렬 */
	justify-content: center; /* 수직 중앙 정렬 */
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
	padding: 100px; /* 컨테이너 내부 여백 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 박스 그림자 설정 */
	background-color: #fdfdfd; /* 박스 배경색 */
	top: 250px;
	width: 600px;
	height: auto;
}

.form-group {
	display: flex; /* 폼 그룹 내의 항목들을 플렉스 박스로 배치합니다. */
	justify-content: center;
	
}
.form-group span {
	text-align: center;
	color: gray;
	font-size: 20px;
}



.form-group button {
	background-color: #ff4714; /* 버튼의 배경색을 주황색으로 설정합니다. */
	color: #fff; /* 버튼의 글씨 색을 흰색으로 설정합니다. */
	border: none; /* 버튼의 기본 테두리를 제거합니다. */
	padding: 10px; /* 입력 필드의 내부 여백을 설정합니다. */
	margin-top: 60px;
	font-size: 19px;
}


.submit_btn button {
	background-color: #ff4714; /* 버튼의 배경색을 주황색으로 설정합니다. */
	color: #fff; /* 버튼의 글씨 색을 흰색으로 설정합니다. */
	border: none; /* 버튼의 기본 테두리를 제거합니다. */
	padding: 8px; /* 입력 필드의 내부 여백을 설정합니다. */
	
}

select {
	padding: 8px; /* 입력 필드의 내부 여백을 설정합니다. */
	border: 1px solid #ccc;
	/* 입력 필드의 테두리 색을 연한 회색으로 설정합니다. */
}

button:hover {
	color: #ffffffcc;
}

.submit_btn button {
	position: relative;
	width: calc(100% - 70%);
	text-align: center;
	height: 40px;
	font-size: 20px;
}

</style>
<script type="text/javascript" src="/js/jquery.js"></script>

<body>
	<header>
		<%@ include file="../header_white.jsp"%>
	</header>
	<div class="contents">
		<div class="content">
			<h1>비밀번호 찾기</h1>
		</div>
		<div class="content">
			<div class="container">
				<form action="/view_jm/tempPassword" method="post">
				<input type="hidden" name="user_id" value="${user_id}">
					<div class="form-group">
						<label for="userCheck"></label> 
						<span id="userCheckMessage">${userCheckMessage}</span>
					</div>
					<div class="form-group">
						<c:choose>
							<c:when test="${not empty user_id}">
								<!-- 사용자가 확인되었으면 임시 비밀번호 발급 버튼 표시 -->
									<a href="/view_jm/tempPassword">
										<button type="submit" id="findPw">임시비밀번호 이메일로 발급하기</button>
									</a>
							</c:when>
							<c:otherwise>
								<!-- 사용자가 확인되지 않았으면 비밀번호 찾기로 이동하는 버튼 표시 -->
									<a href="/view_jm/findPw">
										<button type="button" id="findPw">다시 비밀번호 찾기</button>
									</a>
								
							</c:otherwise>
						</c:choose>
					</div>
				</form>
			</div>
		</div>
	</div>
	<footer>
		<%@ include file="../footer.jsp"%>
	</footer>
</body>
</html>