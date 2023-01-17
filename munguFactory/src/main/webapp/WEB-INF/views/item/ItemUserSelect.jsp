<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItemUserSelect</title>
</head>
<body>
	<div class="subulContainer">
		<c:set var="ius" value="${itemUserSelect}" />
		<table>
			<thead>
				<tr>
					<th>품목 조회</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>품번</th>
					<td>${ius.item_no }</td>
				</tr>
				<tr>
					<th>HS코드</th>
					<td>${ius.hs_code }</td>
				</tr>
				<tr>
					<th>공장명</th>
					<td>${ius.factory_name }</td>
				</tr>
				<tr>
					<th>품명</th>
					<td>${ius.item_name }</td>
				</tr>
				<tr>
					<th>재고 단위</th>
					<td>${ius.stock_unit }</td>
				</tr>
				<tr>
					<th>생산 여부</th>
					<td>${ius.item_check }</td>
				</tr>
			</tbody>
		</table>
		<button type="button" onclick="location.href='/user/ItemUserList'">목록</button>
	</div>
</body>
</html>