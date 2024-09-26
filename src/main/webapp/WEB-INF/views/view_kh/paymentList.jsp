<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
table {

}

</style>
</head>
	<body>
		<table>
			<tr>
				<th>승인번호</th>
				<th>결제일시</th>
				<th>차량매물번호</th>
				<th>전문가리뷰번호</th>
				<th>결제금액</th>
				<th>환불수수료(결제금액의 20%)</th>
			</tr>
		<c:forEach var="paymentList" items="${paymentList }">
			<tr>
				<td>
					<a href="/KH/pay/refundPayment?approval_num=${paymentList.approval_num }">${paymentList.approval_num }</a>
				</td>
				<td>${paymentList.approval_date }</td>
				<td>${paymentList.sell_num }</td>
				<td>${paymentList.expert_review_num }</td>
				<td>${paymentList.total_price } 원</td>
				<td>${paymentList.total_price * 0.2 } 원</td>
			</tr>
		</c:forEach>
		
		</table>
	</body>
</html>