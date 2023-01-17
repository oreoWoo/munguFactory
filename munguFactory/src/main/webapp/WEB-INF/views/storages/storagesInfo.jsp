<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<h1>${storagesInfo.get(0).factory_name } 창고</h1>
		<table class="table table-striped table-hover" style="text-align: center; width: 80%; align-self: center;">
			<thead>
				<tr>
					<th>물품명</th>
					<th>재고</th>
					<th>재고단위</th>
					<th>생산공장</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="si" items="${storagesInfo }">
					<tr>
						<td>${si.item_name }</td>
						<td>${si.stock_count }</td>
						<td>${si.stock_unit }</td>
						<td>${si.factory_name }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>