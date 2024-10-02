<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="../css/join.css" rel="stylesheet" type="text/css">
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<style>

		.form-group input:focus{
				border-color: #ff4714;
				outline: none;
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

		.form-group label #fileUpload {
				background-color: #ff4714;
				/* 버튼의 배경색을 주황색으로 설정합니 다. */
				color: #fdfdfd;
				/* 버튼의 글씨 색을 흰색으로 설정합니다. */
				border: none;
				/* 버튼의 기본 테두리를 제거합니다. */
				padding: 8px;
				/* 입력 필드의 내부 여백을 설정합니다. */
				margin-left: 20px;
				height: 53px;
				font-size: 12px;
				font-weight: bold;
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



		
		footer {
				position: relative;
				top: 400px;
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
            $("#submitBtn").attr("disabled", false);
        } else {
            $("#submitBtn").attr("disabled", true);
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
							<label for="fileUpload" style="font-weight: normal; height: 20px; font-size: 15px;" id="fileUpload1">파일찾기</label>
							<input type="file" id="fileUpload" name="fileUpload">
							<p class="check_font" id="certFileCheckMessage"></p>
						</div>

						<!-- 제출 버튼 -->
						<div class="form-gruop">
							<div class="moveBtn">
								<a href="/view_jm/buyerJoinAgree"><button id="backBtn" type="reset" >이전</button></a>
								<a href="/view_jm/profJoinInfo_2"><button type="submit" id="submitBtn">다음</button></a>
							</div>
						</div>
<!-- /form-->
				</div>
			</div>
		</div>
		<footer>
			<%@include file="../footer.jsp" %>
		</footer>
	</body>
	</html>