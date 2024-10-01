<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<style>
		body,html {
			margin: 0;
				/* 브라우저 기본 여백을 제거 */
				padding: 0;
				/* 브라우저 기본 패딩을 제거 */
				height: 100%;
				/* 화면 높이를 100%로 설정 */
				background-color: #fafafa;
				/* 페이지의 배경색을 연한 회색으로 설정합니다. */
				font-family: Pretendard;
		}

		.contents {
			align-items: center;
			/* 수직 중앙 정렬 */
			height: 100vh;
			/* 뷰포트 높이 100%로 설정 */
			padding-bottom: 300px;
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

		.join_step {
			display: flex;
			position: absolute;
			/* 플렉스 박스 레이아웃 사용 */
			top: 200px;
			justify-content: center;
			/* 가로 가운데 정렬 */
			list-style: none;
			/* 리스트 스타일 제거 */
			padding: 0;
			/* 기본 패딩 제거 */
			margin-bottom: 30px;
		}

		.join_step li {
			margin: 0 10px;
			/* 항목 간의 간격 설정 */
			position: relative;
			/* 텍스트 위치를 조정하기 위해 relative 유지 */
		}

		.join_step li img {
			width: 150px;
			/* 리스트 항목 내 이미지의 크기를 설정 */
		}

		.join_step li span {
			position: absolute;
			/* 텍스트를 절대 위치로 설정 */
			bottom: 0;
			left: 50%;
			/* 텍스트를 중앙 하단에 위치 */
			color: #666;
			/* 텍스트 색상 설정 */
			line-height: 1.462em;
			/* 텍스트 줄 간격 설정 */
			white-space: nowrap;
			/* 텍스트가 줄바꿈되지 않도록 설정 */
			transform: translate(-50%, 0);
			/* 텍스트를 중앙 정렬 */
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
			top: 400px;
			width: 600px;
			height: auto;
		}

		.form-group {
			/* 각 폼 그룹의 하단 마진을 설정합니다. */
			margin-bottom: 30px;
			/* 폼 그룹 내의 항목들을 플렉스 박스로 배치합니다. */
			display: flex;
			/* 폼 그룹 내 항목들을 수직 중앙에 정렬합니다. */
			align-items: center;
			/* 줄바꿈을 허용 */
			flex-wrap: wrap;
		}

		.check_font {
			position: relative;
			left: 165px;
			flex-basis: 100%;
			/* 이 요소만 한 줄을 차지하게 함 */
			margin-top: 0px;
			margin-bottom: 0px;
		}

		.check_font {
			font-size: 12px;
			/* 메시지 크기 조정 */
			color: red;
			/* 기본 메시지 색상 설정 */
			margin-top: 5px;
			/* 메시지와 입력 필드 사이의 여백 */
		}

		.form-group label {
			/* 라벨의 너비를 150px로 설정합니다. */
			width: 150px;
			/* 라벨과 입력 필드 사이의 여백을 설정합니다. */
			margin-right: 10px;
			/* 라벨의 글씨를 두껍게 설정합니다. */
			font-weight: bold;
		}

		.form-group input {
			flex: 1;
			/* 입력 필드가 남은 공간을 모두 차지하도록 설정합니다. */
			padding: 8px;
			/* 입력 필드의 내부 여백을 설정합니다. */
			border: 1px solid #ccc;
			/* 입력 필드의 테두리 색을 연한 회색으로 설정합니다. */
		}

		.form-group input:focus{
				border-color: #ff4714;
				outline: none;
			}

		.file-upload label {
			display: inline-block;
			padding: 0.5em 0.75em;
			color: #999;
			font-size: inherit;
			line-height: normal;
			vertical-align: middle;
			background-color: #fdfdfd;
			cursor: pointer;
			border: 1px solid #ebebeb;
			border-bottom-color: #e2e2e2;
			border-radius: 0.25em;
		}

		.file-upload input[type="file"] {
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin: -1px;
			overflow: hidden;
			clip: rect(0, 0, 0, 0);
			border: 0;
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

		/* Date 입력 필드 스타일 */
		input[type="date"],
		input[type="file"] {
			font-family: "Pretendard", sans-serif;
			/* 원하는 글씨체로 설정 */
			font-size: 16px;
			/* 글씨 크기 설정 */
			color: #333;
			/* 글씨 색상 설정 */
		}

		/* 파일 업로드 레이블 스타일 (사용자에게 보이는 텍스트 부분) */
		.fileUpload label {
			font-family: "Pretendard", sans-serif;
			/* 원하는 글씨체로 설정 */
			font-size: 13px;
			/* 글씨 크기 설정 */
			color: #333;
			/* 글씨 색상 설정 */
		}

		.form-group label #fileUpload {
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

		#fileUpload {
			position: absolute;
			width: 0;
			height: 0;
			padding: 0;
			overflow: hidden;
			border: 0;
		}

		.form-group label[for="fileUpload"] {
			margin-left: 20px;
			background-color: #ff4714;
			margin-right: 0;
			/* 버튼의 배경색을 주황색으로 설정합니다. */
			color: #fff;
			/* 버튼의 글씨 색을 흰색으로 설정합니다. */
			border: none;
			/* 버튼의 기본 테두리를 제거합니다. */
			padding: 8px;
			/* 입력 필드의 내부 여백을 설정합니다. */
			text-align: center;
		}

		button:disabled {
			background-color: #d3d3d3;
			cursor: not-allowed;
		}
	</style>

	<script type="text/javascript" src="/js/jquery.js"></script>
	<script>
	$(document).ready(function () {
    // 모든 인풋 필드에서 입력이 발생할 때마다 유효성 검사 수행
    $("#cert_num, #cert_name, #cert_loc, #cert_date, #fileUpload").on("input change", function () {
        validateForm();
    });

    // 유효성 검사 함수
    function validateForm() {
        var certNum = $("#cert_num").val().trim();
        var certName = $("#cert_name").val().trim();
        var certLoc = $("#cert_loc").val().trim();
        var certDate = $("#cert_date").val().trim();
        var fileUpload = $("#fileUpload").val().trim();

        var certNumCheckMessage = $("#certNumCheckMessage");
        var certNameCheckMessage = $("#certNameCheckMessage");
        var certLocCheckMessage = $("#certLocCheckMessage");
        var certDateCheckMessage = $("#certDateCheckMessage");
        var certFileCheckMessage = $("#certFileCheckMessage");

        var isValid = true;

        // 자격증 번호 유효성 검사
        var certNumRegex = /^[0-9]{11}[A-Z]$/;
        if (!certNumRegex.test(certNum)) {
            certNumCheckMessage.text("숫자 11자리와 대문자 1자리로 입력해주세요").css("color", "red");
            isValid = false;
        } else {
            certNumCheckMessage.text("");
        }

        // 자격증 이름 확인
        if (certName === "") {
            certNameCheckMessage.text("자격증 이름을 입력해주세요").css("color", "red");
            isValid = false;
        } else {
            certNameCheckMessage.text("");
        }

        // 자격증 발행처 확인
        if (certLoc === "") {
            certLocCheckMessage.text("자격증 발행처를 입력해주세요").css("color", "red");
            isValid = false;
        } else {
            certLocCheckMessage.text("");
        }

        // 자격증 발행일 확인
        if (certDate === "") {
            certDateCheckMessage.text("자격증 발행일을 선택해주세요").css("color", "red");
            isValid = false;
        } else {
            certDateCheckMessage.text("");
        }

        // 파일 업로드 확인
        if (fileUpload === "") {
            certFileCheckMessage.text("자격증 파일을 업로드해주세요").css("color", "red");
            isValid = false;
        } else {
            certFileCheckMessage.text("");
        }

        // 모든 입력 값이 유효하면 버튼 활성화, 아니면 비활성화
        if (isValid) {
            $("#submit").attr("disabled", false);
        } else {
            $("#submit").attr("disabled", true);
        }

        // 폼 제출 가능 여부 반환 (true이면 제출, false이면 제출 막음)
        return isValid;
    }

    // 입력 필드에 maxlength 속성 추가
    $("#cert_num").attr("maxlength", 12);
});

		// 입력 필드에 maxlength 속성 추가
		$("#cert_num").attr("maxlength", 12); // 11자리 숫자 + 1자리 알파벳
		//파일 이름 및 확장자 분리 파일 형식 및 용량 제한
		$(function () {
			$("#fileUpload").on('change', function () {
				var fileName = $("#fileUpload").val();
				$("#fileUploadName").val(fileName);
				return;
			}); // 닫는 괄호 수정
		});

	</script>

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
						<img src="<%=request.getContextPath()%>/images/main/certInfo.png">
						<span>자격증 인증</span>
					</li>
					<li>
						<img src="<%=request.getContextPath()%>/images/main/joinInfo_before.png">
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

<!-- form -->
					<form method="post" name="frm" action="/view_jm/profJoinInfo_2" enctype="multipart/form-data" onsubmit="return validateForm()">

						<!-- 자격증 번호 -->
						<div class="form-group">
							<label for="cert_num">자격증 번호</label>
							<input type="text" id="cert_num" name="cert_num"  maxlength="12">
							<p class="check_font" id="certNumCheckMessage"></p>
						</div>

						<!-- 자격증 이름 -->
						<div class="form-group">
							<label for="cert_name">자격증 이름</label>
							<input type="text" id="cert_name" name="cert_name" >
							<p class="check_font" id="certNameCheckMessage"></p>
						</div>

						<!-- 자격증 발행처 -->
						<div class="form-group">
							<label for="cert_loc">자격증 발행처</label>
							<input type="text" id="cert_loc" name="cert_loc" >
							<p class="check_font" id="certLocCheckMessage"></p>
						</div>

						<!-- 자격증 발행일 -->
						<div class="form-group">
							<label for="cert_date">자격증 발행일</label>
							<input type="date" id="cert_date" name="cert_date" >
							<p class="check_font" id="certDateCheckMessage"></p>
						</div>

						<!-- 자격증 파일  -->
						<div class="form-group">
							<label for="file">자격증 파일</label>
							<input  name="fileUploadName" id="fileUploadName">
							<label for="fileUpload" style="font-weight: normal;">파일찾기</label>
							<input type="file" id="fileUpload" name="fileUpload">
							<p class="check_font" id="certFileCheckMessage"></p>
						</div>

						<!-- 제출 버튼 -->
						<div class="submit_btn">
							<button type="submit" id="submit" disabled>다음</button>
						</div>
					</form>
<!-- /form-->
				</div>
			</div>
		</div>
		<footer>
			<%@include file="../footer.jsp" %>
		</footer>
	</body>
	</html>