<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management</title>
<style>
body, html {
	margin: 0;
	padding: 0;
	font-family: 'Pretendard';
}

.contents {
	display: flex;
	justify-content: flex-start;
	background-color: #f5f5f5;
	height: auto;
}

.content {
	background-color: #ffffff;
	padding: 20px;
}

/* 사이드 메뉴 스타일 */
.nav_menu {
	display: flex;
	flex-direction: column;
	background-color: #ff4714;
	width: 300px;
	padding: 20px;
	height: 700px;
	color: white;
	font-weight: bold;
}

.nav_menu a button {
    border: none;
    background-color: #ff4714;
    color: #fafafa;
    padding: 10px;
    margin: 5px 0;
    cursor: pointer;
    width: 100%;
    font-size: 16px;
    font-weight: bold;
}

/* 버튼 hover 효과 */
.nav_menu a button:hover {
    background-color: #e03a12;
    color: #ffffff;
}
.container {
	width: 100%;
	background-color: #fafafa;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

/* 테이블 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
	background-color: white;
}

th, td {
	text-align: center;
	padding: 20px;
}

tr {
	border-bottom: 1px solid #ddd;
}

tr:hover{
	background-color: rgba(0, 0, 0, 0.1);
}


th {
	color: gray;
	font-weight: bold;
}

#deleteBtn {
	background-color: #ff4714;
	border: none;
	color: #fafafa;
	margin: 0 10px;
	padding: 10px 20px;
}

#deleteBtn:hover {
	color: #ffffffcc;
}
.userType {
	background-color: #fafafa;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	border: none;
	color: black;
	margin: 20px;
	padding: 15px;
	font-weight: bold;
	cursor: pointer;
}
.hidden {
	display: none;
}

</style>
</head>
<script type="text/javascript" src="../js/jquery.js"></script>
<script>
	

	function goToDetail(userId) {
		window.location.href = 'userDetail?user_id=' + userId;
	}
	
	function filterUserType(type) {
	    // 모든 행을 숨김
	    $("#userTable tbody tr").addClass("hidden");
	    
	    if (type === 'all') {
	        // 모든 사용자 유형을 표시
	        $("#userTable tbody tr").removeClass("hidden");
	    } else {
	        // 선택된 사용자 유형의 행만 표시
	        $("#userTable tbody tr[data-type='" + type + "']").removeClass("hidden");
	    }
	}
	
	$(document).ready(function() {
		// 페이지 로드 시 모든 사용자 유형 표시
		filterUserType('all');
	});
	
</script>

<body>
	<%@ include file="../header_white.jsp"%>
	<div class="contents">
		<div class="content">
			<!-- 사이드 메뉴 -->
			<div class="nav_menu">
				<a href="/view_ad/adminPage">
					<button>회원 관리</button>
				</a> 
				<a href="/view_ad/userApprovalManagement">
					<button>가입 요청 관리</button>
				</a>
			</div>
		</div>

		<div class="content">
			<!-- 테이블 컨테이너 -->
			<div class="container">
				<div class="button-group">
					<button class="userType" onclick="filterUserType('all')">전체</button> <!-- 모든 사용자 보기 버튼 추가 -->
					<button class="userType" onclick="filterUserType('S')">판매자</button>
					<button class="userType" onclick="filterUserType('P')">전문가</button>
				</div>
				<table id="userTable">
					<thead>
						<tr>
							<th>사용자 유형</th>
							<th>아이디</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>이메일</th>
							<th>가입일</th>
							<th>작업</th>
							<th>승인 요청</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="users" items="${userList }">
							<tr data-type="${users.user_type }" onclick="goToDetail('${users.user_id }')"> <!-- data-type 속성 추가 -->
								<td>${users.user_type }</td>
								<td>${users.user_id }</td>
								<td>${users.user_name }</td>
								<td>${users.user_tel }</td>
								<td>${users.user_email }</td>
								<td><fmt:formatDate value="${users.user_regdate}" pattern="yyyy년 MM월 dd일" /></td>
								<td><button id="deleteBtn">승인</button></td>
								<td>${users.approval}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
