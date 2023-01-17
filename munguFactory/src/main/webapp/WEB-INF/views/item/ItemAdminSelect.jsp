<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItemAdminSelect</title>
<!-- <script type="text/javascript">
	function deleteChk(item_no) {
		if (confirm("품목을 삭제하시겠습니까?")) {
			location.href="ItemAdminDelete?item_no="+item_no;
		}
		
	}
</script> -->
</head>
<body>
	<div class="subulContainer">
		<c:set var="ias" value="${itemAdminSelect}" />
		<table>
			<thead>
				<tr>
					<th>품목 조회</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>품번</th>
					<td>${ias.item_no }</td>
				</tr>
				<tr>
					<th>HS코드</th>
					<td>${ias.hs_code }</td>
				</tr>
				<tr>
					<th>공장명</th>
					<td>${ias.factory_name }</td>
				</tr>
				<tr>
					<th>품명</th>
					<td>${ias.item_name }</td>
				</tr>
				<tr>
					<th>재고 단위</th>
					<td>${ias.stock_unit }</td>
				</tr>
				<tr>
					<th>생산 여부</th>
					<td>${ias.item_check }</td>
				</tr>
			</tbody>
		</table>
		<button type="button" onclick="location.href='/user/ItemAdminList'">목록</button>
		<sec:authorize access="hasRole('admin')">
		<button type="button" onclick="location.href='/admin/ItemAdminUpdate?item_no=${ias.item_no}'">수정</button>
		<button type="button" onclick="location.href='/admin/ItemAdminDelete?item_no=${ias.item_no}'">삭제</button>
		</sec:authorize>
		<%-- <button type="button" onclick="deleteChk(${ias.item_no})'">삭제</button> --%>
	</div>
</body>
</html>