<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div id=setHtml>
	<table class="table table-striped table-hover ajaxContents">
		<thead>
			<tr>
				<th>등록번호</th>
				<th>고유번호</th>
				<th>물품번호</th>
				<th>수량</th>
				<th>구분</th>
				<th>담당자</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="subul" items="${subulList }">
				<tr>
					<td>${subul.subul_num }</td>
					<td>${subul.serial_no }</td>
					<td>${subul.item_no }</td>
					<td>${subul.amount }</td>
					<td>${subul.gubun }</td>
					<td>${subul.emp_name }</td>
					<td>${subul.date }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<nav aria-label="Page navigation ajaxContents">
		<ul class="pagination justify-content-center ajaxContents">
			<c:if test="${paging.startPage > paging.pageBlock }">
				<li class="page-item prev">
					<a class="page-link" onclick="ajaxChk(${paging.startPage - paging.pageBlock })"><i class="tf-icon bx bx-chevron-left"></i></a>
				</li>
			</c:if>
			<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
			<li class="page-item">
				<a class="page-link" onclick="ajaxChk(${num})">${num }</a>
			</li>
			</c:forEach>
			<c:if test="${paging.endPage < paging.totalPage }">
				<li class="page-item next">
					<a class="page-link" onclick="ajaxChk(${paging.startPage + paging.pageBlock })"><i class="tf-icon bx bx-chevron-right"></i></a>
				</li>
			</c:if>
		</ul>
	</nav>
</div>
</body>
</html>