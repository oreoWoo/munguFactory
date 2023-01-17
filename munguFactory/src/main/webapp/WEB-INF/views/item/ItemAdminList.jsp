<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItemAdminList</title>
</head>
<body>
	<div class="subulContainer">
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
</body>
</html>