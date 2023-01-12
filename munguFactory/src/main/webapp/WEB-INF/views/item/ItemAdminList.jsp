<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<c:forEach var="ial" items="${itemAdminList }">
					<tr>
						<td>${ial.item_no }</td>
						<td>${ial.hs_code }</td>
						<td><a href="ItemAdminSelect?item_no=${ial.item_no}">${ial.item_name }</a></td>
						<td>${ial.item_check }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="button" onclick="location.href='ItemAdminInsert'">추가
		</button>
	</div>
</body>
</html>