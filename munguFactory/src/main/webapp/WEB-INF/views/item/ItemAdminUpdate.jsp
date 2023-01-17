<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItemAdminUpdate</title>
</head>
<body>
	<div class="subulContainer">
		<form action="/admin/ItemAdminUpdateConfirm" method="post">
			<c:forEach var="iaus" items="${ItemAdminUpSelect }">
				<table>
					<thead>
						<tr>
							<th>품목 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>품번</th>
							<td><input name="item_no" type="hidden"
								value="${iaus.item_no }">${iaus.item_no }</td>
						</tr>
						<tr>
							<th>HS코드</th>
							<td><input type="text" name="hs_code" maxlength="300"
								required="required" value="${iaus.hs_code }"></td>
						</tr>
						<tr>
					        		<th>공장명</th>
							<td><select name="factory_no">
									<c:forEach var="fl" items="${factoryList }">
										<c:if test="${iaus.factory_no == fl.factory_no }">
											<option value="${fl.factory_no }" selected="selected">${fl.factory_name }</option>
										</c:if>
										<c:if test="${iaus.factory_no != fl.factory_no }">
											<option value="${fl.factory_no }">${fl.factory_name }</option>
										</c:if>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<th>품명</th>
							<td><input type="text" name="item_name" maxlength="300"
								required="required" value="${iaus.item_name }"></td>
						</tr>
						<tr>
							<th>재고 단위</th>
							<td><input type="number" min="1" name="stock_unit"
								maxlength="30" required="required" value="${iaus.stock_unit }"></td>
						</tr>
						<tr>
							<th>생산 여부</th>
							<td><select name="item_check">
							<c:if test="${iaus.item_check == '생산'}">
								<option value="생산" selected="selected">생산</option>
								<option value="생산 중단">생산 중단</option>
							</c:if>
							<c:if test="${iaus.item_check == '생산 중단'}">
								<option value="생산">생산</option>
								<option value="생산 중단" selected="selected">생산 중단</option>
							</c:if>
							</select></td>
						</tr>
					</tbody>
				</table>
			</c:forEach>
			<button type="submit">등록</button>
		</form>
	</div>
</body>
</html>