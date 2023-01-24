<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItemAdminList</title>
<style type="text/css">
table {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	width: 1200px;
	display: block;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

thead, tbody, tfoot, tr, td, th {
	border-color: inherit;
	border-style: solid;
	width: 1250px;
}

/* 가로 중앙 정렬 */
.div-center {
	display: block;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	margin-top: 20px;
}

.outputContainer {
		padding-top: 50px;
		padding-left: 50px;
		padding-right: 50px;
	}
</style>
</head>
<body>
	<div class="outputContainer">
		<h4 class="fw-bold py-3 mb-4">품목 목록 조회</h4>
		<sec:authorize access="hasRole('admin')">
			<div class="alert alert-primary" role="alert"
				style="width: 70px; text-align: center; height: 40px; translate: 1330px 100px; padding: 9px 2px 0px 1px; font-weight: bold;">
				<a href="/admin/ItemAdminInsert">추가</a>
			</div>
		</sec:authorize>

		<div class="card"
			style="width: 1250px; translate: 150px 100px; text-align: center;">
			<div class="table-responsive text-nowrap">
				<table class="table">
					<thead>
						<tr>
							<th>품번</th>
							<th>HS코드</th>
							<th>품명</th>
							<th>생산 여부</th>
						</tr>
					</thead>
					<tbody class="table-border-bottom-0">
						<tr>
							<c:set var="num" value="${page.total-page.start+1 }" />
							<c:forEach var="ial" items="${itemAdminList }">
								<tr>
									<td>${ial.item_no }</td>
									<td>${ial.hs_code }</td>
									<td><a href="/user/ItemAdminSelect?item_no=${ial.item_no}">${ial.item_name }</a></td>
									<td>${ial.item_check }</td>
								</tr>
							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!--/ Basic Bootstrap Table -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center"
				style="translate: -85px 130px;">
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<li class="page-item"><a class="page-link"
						href="/user/ItemAdminList?currentPage=${i}">${i}</a></li>
				</c:forEach>
			</ul>
		</nav>
	</div>


	<%-- <div class="subulContainer">
		<table>
			<thead>
				<tr>
					<th>품목 목록 조회</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>품번</th>
					<th>HS코드</th>
					<th>품명</th>
					<th>생산 여부</th>
				</tr>
				<c:set var="num" value="${page.total-page.start+1 }" />
				<c:forEach var="ial" items="${itemAdminList }">
					<tr>
						<td>${ial.item_no }</td>
						<td>${ial.hs_code }</td>
						<td><a href="/user/ItemAdminSelect?item_no=${ial.item_no}">${ial.item_name }</a></td>
						<td>${ial.item_check }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<sec:authorize access="hasRole('admin')">
			<button type="button"
				onclick="location.href='/admin/ItemAdminInsert'">추가</button>
		</sec:authorize>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<li class="page-item"><a class="page-link"
						href="/user/ItemAdminList?currentPage=${i}">${i}</a></li>
				</c:forEach>
			</ul>
		</nav>
	</div>
</body> --%>
</html>