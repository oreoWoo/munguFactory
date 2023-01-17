<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItemAdminInsert</title>
</head>
<body>
	<div class="subulContainer">
		<form action="/admin/ItemAdminInsertConfirm" method="post">
			<table>
				<thead>
					<tr>
						<th>품목 등록</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>HS코드</th>
						<td><input type="text" name="hs_code" maxlength="300"
							required="required"></td>
					</tr>
					<tr>
						<th>공장명</th>
						<td><select name="factory_no" class="form">
								<c:forEach var="fl" items="${factoryList }">
									<option value="${fl.factory_no }">${fl.factory_name}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<th>품명</th>
						<td><input type="text" name="item_name" maxlength="300"
							required="required"></td>
					</tr>
					<tr>
						<th>재고 단위</th>
						<td><input type="number" min="1" name="stock_unit"
							maxlength="30" required="required"></td>
					</tr>
					<tr>
						<th>생산 여부</th>
						<td><select name="item_check" class="form">
								<option value="생산">생산</option>
								<option value="생산 중단">생산 중단</option>
						</select></td>
					</tr>
				</tbody>
			</table>
			<button type="submit">등록</button>
		</form>
	</div>
</body>
</html>