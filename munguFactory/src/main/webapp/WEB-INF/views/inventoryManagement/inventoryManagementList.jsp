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
<% String context = request.getContextPath(); %>
</head>
<body>
<div id=setHtml>
	<table class="table table-striped table-hover ajaxContents">
		<thead>
			<tr>
				<th>등록번호</th>
				<th>수주/생산번호</th>
				<th>물품번호</th>
				<th>수량</th>
				<th>구분</th>
				<th>날짜</th>
				<th>등록자</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>222</td>
				<td>222</td>
				<td>222</td>
				<td>222</td>
				<td>222</td>
				<td>222</td>
				<td>222</td>
			</tr>
			<tr>
				<td>222</td>
				<td>222</td>
				<td>222</td>
				<td>222</td>
				<td>222</td>
				<td>222</td>
				<td>222</td>
			</tr>
			<tr>
				<td>222</td>
				<td>222</td>
				<td>222</td>
				<td>222</td>
				<td>222</td>
				<td>222</td>
				<td>222</td>
			</tr>
			<tr>
				<td>222</td>
				<td>222</td>
				<td>222</td>
				<td>222</td>
				<td>222</td>
				<td>222</td>
				<td>222</td>
			</tr>
		</tbody>
	</table>
	<nav aria-label="Page navigation ajaxContents">
		<ul class="pagination justify-content-center ajaxContents">
			<li class="page-item prev">
				<a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-left"></i></a>
			</li>
			<li class="page-item">
				<a class="page-link" href="javascript:void(0);">1</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="javascript:void(0);">2</a>
			</li>
			<li class="page-item active">
				<a class="page-link" href="javascript:void(0);">3</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="javascript:void(0);">4</a>
			</li>
			<li class="page-item">
				<a class="page-link" href="javascript:void(0);">5</a>
			</li>
			<li class="page-item next">
				<a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevron-right"></i></a>
			</li>
		</ul>
	</nav>
	<div class="ajaxContents">
	<c:set var="resultd" value="${subString }"/>
	<h1>${resultd }</h1>
	</div>
</div>
</body>
</html>