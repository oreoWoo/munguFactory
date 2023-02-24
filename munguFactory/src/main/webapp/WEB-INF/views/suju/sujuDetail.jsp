<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.inventoryManagementContainer{
	width: 80%;
	margin :5% 10% 10% 10%;
	padding: 2%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-content: center;
}

.sujuDetailContainer{
	background-color:white; 
	padding : 10px;
}
.searchPlace{
	display: flex;
	justify-content: space-between;
}
</style>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(function(){
		if('${not empty msg}' && '${msg}' != ''){
			alert("${msg}");
		}
	});
	
	
	function deleteOrder(suju_no){
		location.href = "/user/sujuDelete?suju_no=" + suju_no + "&emp_no=${orders.emp_no }";
	}

</script>


<body>
		<%-- <table class="table table-striped table-hover ajaxContents">
			<thead>
					<tr>
						<th>품번</th>
						<th>품명</th>
						<th>수주수량</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ordersDetail" items="${orders.ordersDetailDTOs }">
						<tr>
							<td>${ordersDetail.item_no }</td>
							<td>${ordersDetail.item_name }</td>
							<td>${ordersDetail.suju_amount }개</td>
							<td>${ordersDetail.prod_state }</td>
						</tr>
					</c:forEach>
				</tbody>
		</table> --%>
		
		<div class="inventoryManagementContainer">
			<h1>수주 상세</h1>
			<div class="sujuDetailContainer">
			<form action="sujuModifyForm" method="post">
				<input type="hidden" name="suju_no" value="${orders.suju_no }">
				<input type="hidden" name="emp_no" value="${orders.emp_no }">
				<input type="hidden" name="emp_name" value="${orders.emp_name }">
				<input type="hidden" name="account_no" value="${orders.account_no }">
				<input type="hidden" name="account_name" value="${orders.account_name }">
				<input type="hidden" name="suju_date" value="${orders.suju_date }">
				<input type="hidden" name="last_date" value="${orders.last_date }">
				<input type="hidden" name="order_note" value="${orders.order_note }">
				<div class="category">
					<table class="table table-hover ajaxContents table-bordered">
						<tbody>
								<tr>
									<td>거래처</td>
									<td>${orders.account_name }</td>
									<td>수주일</td>
									<td>${orders.suju_date }</td>
								</tr>
								<tr>
									<td>등록자</td>
									<td>${orders.emp_name }</td>
									<td>마감일</td>
									<td>${orders.last_date }</td>
								</tr>
								<tr>
									<td>비고</td>
									<td colspan="3">${orders.order_note }</td>
								</tr>
						</tbody>
					</table>
				</div>
			<h3>상세 정보</h3>
				<div class="searchBox">
					<table class="table table-hover ajaxContents table-bordered">
						<thead>
								<tr>
									<th>품번</th>
									<th>품명</th>
									<th>수주수량</th>
									<th>제작 상태</th>
									<th>발주 상태</th>
								</tr>
						</thead>
						<tbody>
							<c:forEach var="ordersDetail" items="${orders.ordersDetailDTOs }" varStatus="status">
							<input type="hidden" name="ordersDetailDTOs[${status.index}].suju_no" value="${ordersDetail.suju_no }">
							<input type="hidden" name="ordersDetailDTOs[${status.index}].item_no" value="${ordersDetail.item_no }">
							<input type="hidden" name="ordersDetailDTOs[${status.index}].item_name" value="${ordersDetail.item_name }">
							<input type="hidden" name="ordersDetailDTOs[${status.index}].suju_amount" value="${ordersDetail.suju_amount }">
							<input type="hidden" name="ordersDetailDTOs[${status.index}].prod_state" value="${ordersDetail.prod_state }">
							
								<tr>
									<td>${ordersDetail.item_no }</td>
									<td>${ordersDetail.item_name }</td>
									<td>${ordersDetail.suju_amount }개</td>
									<td>${ordersDetail.prod_state }</td>
									<td>
										<c:choose>
											<c:when test="${not empty ordersDetail.balju_no}">발주 완료</c:when>
											<c:otherwise>발주 전</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div style="float: right;">
					<input type="submit" value="수주 수정"  class="btn btn-outline-primary">
					<input type="button" value="수주 삭제"  class="btn btn-outline-primary" onclick="deleteOrder(${orders.suju_no })">
				</div>
			</form>
		</div>
		</div>
</body>
</html>