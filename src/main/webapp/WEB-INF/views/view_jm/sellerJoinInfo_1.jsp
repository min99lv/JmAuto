<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<link href="../css/join.css" rel="stylesheet" type="text/css">
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<style>
		.form-group input:focus {
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


		footer {
			position: relative;
			top: 400px;
		}
	</style>

	<!-- <script>
		function validateBuz_num() {
			// 사업자 번호 입력 필드의 값을 가져와 공백을 제거
			var buz_num = $("#buz_num").val().trim();
			const buz_numRegex = /^\d{10}$/;  // 정확히 10자리 숫자 정규 표현식

			// 사업자 번호가 유효한지 검사
			if (!buz_numRegex.test(buz_num)) {
				// 유효하지 않은 경우 경고 메시지 표시
				alert("사업자 번호는 10자리 숫자여야 합니다."); // 경고 메시지
				return false; // 유효하지 않으면 false 반환
			}

			return true; // 유효할 경우 true 반환
		}

		// 하이픈을 제외한 숫자만 입력되도록 하는 함수
		const restrictInput = (event) => {
			// 입력된 값이 숫자가 아닌 경우, 입력을 무시합니다.
			if (!/^\d*$/.test(event.target.value)) {
				event.target.value = event.target.value.replace(/[^0-9]/g, ''); // 숫자가 아닌 모든 문자를 제거
			}
		};

		// 예를 들어 입력 필드의 change 이벤트에 validateBuz_num 함수를 연계하여 사용
		$("#submit").on("click", function (event) {
			// validateBuz_num 함수 호출
			if (!validateBuz_num()) {
				event.preventDefault(); // 유효하지 않은 경우 폼 제출 방지
			}
		});
	</script> -->

	<!-- <script>
	$(document).ready(function(){
		// 모든 인풋 필드에서 입력이 발생할 때마다 유효성 검사 수행
		$("#buz_num , #buz_name,#buz_addr")
	})

	// 유효성 검사 함수
	function validateForm(){
		var buzNum = $("#buz_num").val().trim();
		var buzName = $("#buz_name").val().trim();
		var buzAddr = $("#buz_addr").val().trim();
		var fileUpload= $("#buz_num").val().trim();

		var buzNumCheckMessage = $("#buzNumCheckMessage");
		var buzNameCheckMessage = $("#buzNameCheckMessage");
		var buAddrCheckMessage = $("#buzAddrCheckMessage");
		var buzFileCheckMessage = $("#buzFileCheckMessage");

		var isValid = true;

		// 사업자 번호 유효성 검사
		var buzNumRegex = /^[0-10]{11}$/;



		// 사업자 상호명 이름 확인
		if(buzName === ""){
			buzNameCheckMessage.text("사업자 상호명을 입력해주세요").css("color", "red");
			isValid = false;
		} else {
			buzNameCheckMessage.text("");
		}


		// 사업자 확인
		if(buzAddr ===""){
			buzAddrCheckMessage.text("사업자 소재지를 입력해주세요").css("color","red");
			isValid = false;
		}else{
			buzAddrCheckMessage.text("");
		}



	}
 
	function chkValue(){
		if(frm.buz_num.value== ""){

		}


	}


</script> -->

	<script src="../js/jquery.js"></script>
	<script>
		function chkValue() {
			var buzNumCheckMessage = $("#buzNumCheckMessage");
			var buzNameCheckMessage = $("#buzNameCheckMessage");
			var buzAddrCheckMessage = $("#buzAddrCheckMessage");
			var buzFileCheckMessage = $("#buzFileCheckMessage");



			// 사업자 번호가 입력되지 않았을 때
			if (frm.buz_num.value.trim() === "") {
				buzNumCheckMessage.text("사업자 번호를 입력해주세요").css("color", "red");
				frm.buz_num.focus();
				return false;
			} else {
				buzNumCheckMessage.text("");  // 입력이 있으면 에러 메시지 초기화
			}
			if (frm.buz_name.value.trim() === "") {
				buzNameCheckMessage.text("사업자 상호명을 입력해주세요").css("color", "red");
				frm.buz_name.focus();
				return false;
			} else {
				buzNameCheckMessage.text("");  // 입력이 있으면 에러 메시지 초기화
			}
			if (frm.buz_addr.value.trim() === "") {
				buzAddrCheckMessage.text("사업자 번호를 입력해주세요").css("color", "red");
				frm.buz_Addr.focus();
				return false;
			} else {
				buzAddrCheckMessage.text("");  // 입력이 있으면 에러 메시지 초기화
			}

			// 파일이 첨부되지 않았을 때 (fileUpload 필드 확인)
			if (!frm.fileUploadName.value) {
				buzFileCheckMessage.text("사업자 등록증을 첨부해주세요").css("color", "red");
				return false;
			} else {
				buzFileCheckMessage.text("");  // 정상 입력 시 에러 메시지 초기화
			}

			// 모든 검사를 통과하면 true 반환 (폼 제출 가능)
			return true;
		}

		// 유효성 검사에 따라 제출 버튼 활성화
		$("input").on('input change', function () {
			var isValid = chkValue(); // 입력값 유효성 확인
			if (isValid) {
				$("#submit").attr("disabled", false);
			} else {
				$("#submit").attr("disabled", true);
			}
		});
		//파일 이름 및 확장자 분리 파일 형식 및 용량 제한
		$(function () {
			$("#fileUpload").on('change', function () {
				var fileName = $("#fileUpload").val();
				$("#fileUploadName").val(fileName);
				return;
			}); // 닫는 괄호 수정
		});

		$(document).ready(function () {
    // 각 입력 필드가 모두 입력되었는지 확인하는 함수
    function checkFormFilled() {
        // 입력 필드들의 값을 가져오기
        var buzNum = $("#buz_num").val().trim();
        var buzName = $("#buz_name").val().trim();
        var buzAddr = $("#buz_addr").val().trim();
        var fileUpload = $("#fileUpload").val().trim();

        // 모든 필드에 값이 있을 때만 true 반환
        if (buzNum !== "" && buzName !== "" && buzAddr !== "" && fileUpload !== "") {
            return true;
        } else {
            return false;
        }
    }

    // 입력 필드에 변경이 발생할 때마다 호출
    $("input").on('input change', function () {
        // 모든 필드가 입력되었는지 확인
        if (checkFormFilled()) {
            // 모든 필드가 입력되었으면 submit 버튼 활성화
            $("#submitBtn").attr("disabled", false);
        } else {
            // 하나라도 비어있으면 submit 버튼 비활성화
            $("#submitBtn").attr("disabled", true);
        }
    });

    // 초기 상태에서 submit 버튼 비활성화
    $("#submitBtn").attr("disabled", true);
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
					<li><img src="<%=request.getContextPath()%>/images/main/joinAgree_after.png"><span>약관동의</span></li>
					<li><img src="<%=request.getContextPath()%>/images/main/buzInfo.png"><span>사업자 정보 입력</span></li>
					<li><img src="<%=request.getContextPath()%>/images/main/joinInfo_before.png"><span>회원 정보 입력</span>
					</li>
					<li><img src="<%=request.getContextPath()%>/images/main/joinOk_before.png"><span>가입신청</span></li>
				</ul>
			</div>
			<div class="content">
				<div class="container">
					<form method="post" name="frm" action="/view_jm/sellerJoinInfo_2" enctype="multipart/form-data"
						onsubmit="return chkValue();">

						<!-- 사업자 번호  -->
						<div class="form-group">
							<label for="buz_num">사업자 번호</label>
							<input type="text" id="buz_num" name="buz_num" maxlength="14"> <!-- 하이픈 포함 길이 14 -->
							<p class="check_font" id="buzNumCheckMessage"></p>
						</div>

						<!-- 사업자 상호명 -->
						<div class="form-group">
							<label for="buz_name">사업자 상호명</label>
							<input type="text" id="buz_name" name="buz_name">
							<p class="check_font" id="buzNameCheckMessage"></p>
						</div>

						<!-- 사업자 주소 -->
						<div class="form-group">
							<label for="buz_addr">사업자 주소</label>
							<input type="text" id="buz_addr" name="buz_addr">
							<p class="check_font" id="buzAddrCheckMessage"></p>
						</div>

						<!-- 사업자 등록증  -->
						<div class="form-group">
							<label for="file">사업자 등록증</label>
							<input name="fileUploadName" id="fileUploadName">
							<label for="fileUpload" style="font-weight: normal;">파일찾기</label>
							<input type="file" id="fileUpload" name="fileUpload">
							<p class="check_font" id="buzFileCheckMessage"></p>
						</div>

						<!-- 제출 버튼 -->
						<div class="form-gruop">
							<div class="moveBtn">
								<a href="/view_jm/buyerJoinAgree"><button id="backBtn" type="reset">이전</button></a>
								<a href="/view_jm/sellerJoinInfo_2"><button type="submit" id="submitBtn">다음</button></a>
							</div>
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