<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<div><%@ include file="../header_white.jsp"%></div>
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
	background-color: #fafafa;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

/* 테이블 스타일 */
table {
	width: 1400px;
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

.button-group button {
	background-color: #fafafa;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	border: none;
	color: black;
	margin: 20px;
	padding: 15px;
	font-weight: bold;
	cursor: pointer; /* 버튼에 커서 스타일 추가 */
}

.button-group button:hover {
	background-color: rgba(0, 0, 0, 0.1);
}

.hidden {
	display: none; /* 숨기기 위한 클래스 */
}

/* 모달 기본 스타일 */
.modal {
	display: none; /* 기본적으로 숨김 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

/* 모달 콘텐츠 스타일 */
.modal-content {
	background-color: #fff;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

#addAdminBtn {
	float: right;
	background-color: #ff4714;
	border: none;
	color: #fafafa;
	width: 200px;
}

.container_nav {
	display: flex;
	width: auto;
}

.searchBox {
	padding: 20px;
	float: right;
}

#search_input {
	width: px; /* 너비 설정 */
	height: 20px; /* 높이 설정 */
	border: 1px solid #ccc; /* 기본 테두리 */
	padding: 5px 10px; /* 내부 패딩 */
	font-size: 16px; /* 글자 크기 */
	box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1); /* 내부 그림자 */
}

#search_btn {
	width: 50px;
	height: 32px;
}
</style>
</head>
<script type="text/javascript" src="../js/jquery.js"></script>
<script>
    
    // 모달 열기 함수
    function openModal() {
        document.getElementById("adminModal").style.display = "block";
    }

    // 모달 닫기 함수
    function closeModal() {
        document.getElementById("adminModal").style.display = "none";
    }

    // 모달 외부를 클릭했을 때 닫기
    window.onclick = function(event) {
        var modal = document.getElementById("adminModal");
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    
    function userDeactive(userId) {
		alert("userid>> " + userId); // alert에 userId를 올바르게 출력
		$.ajax({
			url : '/view_ad/userDeactive',
			type : 'GET',
			dataType : 'json',
			data : {
				'user_id' : userId
			}, // userId로 데이터 전송
			success : function(response) {
				alert("사용자가 성공적으로 비활성화 되었습니다.");
				location.reload(); // 페이지 새로고침
			},
			error : function(error) {
				console.error("비활성화 중 오류 발생", error);
				alert("삭제 중 오류가 발생했습니다.");
			}
		});
	}

	function userActive(userId) {
		alert("userid>> " + userId); // alert에 userId를 올바르게 출력
		$.ajax({
			url : '/view_ad/userActive',
			type : 'GET',
			dataType : 'json',
			data : {
				'user_id' : userId
			}, // userId로 데이터 전송
			success : function(response) {
				alert("사용자가 성공적으로 활성화 되었습니다.");
				location.reload(); // 페이지 새로고침
			},
			error : function(error) {
				console.error("활성화 중 오류 발생", error);
				alert("삭제 중 오류가 발생했습니다.");
			}
		});
	}
    
	function filterUserType(userType) {
	    const rows = document.querySelectorAll("tbody tr");
	    const adminBtn = document.getElementById("addAdminBtn"); // 관리자 추가 버튼

	    rows.forEach(row => {
	        const rowUserType = row.cells[0].innerText; // 첫 번째 셀에 사용자 유형이 있다고 가정
	        // 사용자 버튼 클릭 시 P, S, B 표시
	        if (userType === 'USER' && ['P', 'S', 'B'].includes(rowUserType)) {
	            row.style.display = ""; // 보이도록 설정
	            adminBtn.classList.add('hidden'); // 사용자일 때 관리자 추가 버튼 숨기기
	        }
	        // 관리자 버튼 클릭 시 A만 표시
	        else if (userType === 'ADMIN' && rowUserType === 'A') {
	            row.style.display = ""; // 보이도록 설정
	            adminBtn.classList.remove('hidden'); // 관리자일 때 관리자 추가 버튼 표시
	        } else {
	            row.style.display = "none"; // 숨김
	        }
	    });
	}

        
    	$(document).ready(function() {
    		// 페이지 로드 시 모든 사용자 유형 표시
    		filterUserType('USER');
    	});
    </script>
</head>
<body>

	<div class="manager_container">
		<div class="manager_gogi">
			<div class="manager_menu">
<div class="button-group">
						<button class="userTypeBtn" onclick="filterUserType('USER')">사용자</button>
						<!-- 사용자 버튼 -->
						<button class="userTypeBtn" onclick="filterUserType('ADMIN')">관리자</button>
						<!-- 관리자 버튼 -->
			
					</div>
			</div>
			<div class="manager_header">
				<div class="manager_header_h1">회원목록</div>
				<div class="manager_header_gene">
						<!-- 모달 열기 버튼 -->
					<button id="addAdminBtn" class="hidden" onclick="openModal()">관리자
							추가</button>
				</div>
			</div>
			<div class="manager_CS_list">
				<div class="container_nav">
					
					<div class="searchBox">
						<input id="search_input" name="keyword" placeholder="">
						<button id="search_btn">검색</button>
					</div>
				</div>
				<table>
					<thead>
						<tr>
							<th>사용자 유형</th>
							<th>아이디</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>이메일</th>
							<th>가입일</th>
							<th>작업</th>
							<th>탈퇴 여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="users" items="${userList }">
							<tr>
								<td>${users.user_type }</td>
								<td>${users.user_id }</td>
								<td>${users.user_name }</td>
								<td>${users.user_tel }</td>
								<td>${users.user_email }</td>
								<td><fmt:formatDate value="${users.user_regdate}"
										pattern="yyyy년 MM월 dd일" /></td>
								<td>
									<button id="deleteBtn"
										onclick="userDeactive('${users.user_id }')">비활성화</button>
									<button id="deleteBtn"
										onclick="userActive('${users.user_id }')">활성화</button>
								</td>
								<td>${users.del_state}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>



	<!-- 모달 -->
	<div id="adminModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<h2>관리자 추가</h2>
			<form action="/view_ad/addAdmin" method="post">
				<label for="adminId">아이디:</label> <input type="text" id="adminId"
					name="adminId" required><br> <br> <label
					for="adminName">이름:</label> <input type="text" id="adminName"
					name="adminName" required><br> <br> <label
					for="adminEmail">이메일:</label> <input type="email" id="adminEmail"
					name="adminEmail" required><br> <br> <label
					for="adminTel">전화번호:</label> <input type="tel" id="adminTel"
					name="adminTel" required><br> <br>
				<button type="submit">추가</button>
			</form>
		</div>
	</div>
</body>
</html>