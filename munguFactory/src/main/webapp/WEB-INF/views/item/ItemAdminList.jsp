<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<tr>
					
					<%-- <c:forEach var="ial" items="${itemAdminList }">
						<td>${ial.item_no }</td>
						<td>${ial.hs_code }</td>
						<td>${ial.item_name }</td>
						<td>${ial.item_check }</td>
					</c:forEach> --%>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>