<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management</title>
<div class="header_continer"><%@ include
		file="../header_white.jsp"%></div>
<div class="menu_continer"><%@ include file="../manager_menu.jsp"%></div>
<style>
body {
	font-family: 'Pretendard';
	margin: 0;
	padding: 0;
	box-sizing: border-box;

}

.header_continer {
    position: relative; /* No fixed position, it will scroll naturally */
    width: 100%;
    top: 0;
    z-index: 1001; /* Still higher than the menu */
}

.menu_continer {
    position: fixed;
    top: 0; /* Stays fixed at the top */
    z-index: 1000; /* Lower than the header */
    height: 100vh; /* Full viewport height */
}

.manager_container {
	display: grid;
	grid-template-columns: minmax(auto, 1320px);
	justify-content: center;
	max-width: 100%;
	margin: 0px auto;
	background-color: #f7f7f7;
	height: auto;
	
	
}

.manager_menu {
	background: #fdfdfd;
	box-shadow: 0 0 10px 5px rgb(0,0,0,0.06);
	width: 100%;
	max-width: 200px;
	height: auto;
	margin: 40px 0 20px;
}

.manager_header {
	display: flex;
	margin: 20px 0;
	justify-content: space-between;
	align-items: center;
}

.manager_header_h1{
	font-size: 24px;
	font-weight: 550;
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

tr:hover {
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
			$("#userTable tbody tr[data-type='" + type + "']").removeClass(
					"hidden");
		}
	}

	$(document).ready(function() {
		// 페이지 로드 시 모든 사용자 유형 표시
		filterUserType('all');
	});
</script>

<body>
	<div class="manager_container">
		<div class="manager_gogi">
			<div class="button-group">
				<button class="userType" onclick="filterUserType('all')">전체</button>
				<!-- 모든 사용자 보기 버튼 추가 -->
				<button class="userType" onclick="filterUserType('S')">판매자</button>
				<button class="userType" onclick="filterUserType('P')">전문가</button>
			</div>
		</div>
		<div class="manager_header">
			<div class="manager_header_h1">가입 승인 요청</div>
			<div class="manager_header_gene">
			</div>
		</div>
		<div class="manager_CS_list">
			<div class="container_nav">
			</div>
			<div class="content">
				<!-- 테이블 컨테이너 -->
				<div class="container">
					<div class="button-group"></div>
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
								<tr data-type="${users.user_type }"
									onclick="goToDetail('${users.user_id }')">
									<!-- data-type 속성 추가 -->
									<td>${users.user_type }</td>
									<td>${users.user_id }</td>
									<td>${users.user_name }</td>
									<td>${users.user_tel }</td>
									<td>${users.user_email }</td>
									<td><fmt:formatDate value="${users.user_regdate}"
											pattern="yyyy년 MM월 dd일" /></td>
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
