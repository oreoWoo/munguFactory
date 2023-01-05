<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 table {
 	border: 1px solid black;
 	border-collapse: collapse;
 	translate: 109px -600px;
 	text-align: center;
 	width: 1200px;
 }

</style>
</head>
<body>
	<div style="translate: 70px 100px;">
		<h1>생산실적</h1>
		<!-- 생산실적 등록 -->
		<a href="writeFormOutput">등록</a>
	</div>
	
	<!-- 생산실적 관련 정보 조회 -->
<!-- 	<form>
		<select name="search">
			<option value="s_">생산 번호 조회</option>
			<option value="s_">품번 조회</option>
			<option value="s_">품명 조회</option>
			
		</select>
	</form> -->
	
	
	
	
	<c:set var="num" value="${page.total - page.startPage + 1}"></c:set>
	
	<table>
		<tr>
			<th>번호</th>
			<th>생산번호</th>
			<th>품번</th>
			<th>품명</th>
			<th>사원번호</th>
			<th>공장코드</th>
			<th>작업일시</th>
			<th>생산수량</th>
			<th>불량수량</th>
			<th>수율</th>
		</tr>
		<c:forEach var="output" items="${listOutput}">
			<tr>
				<td>1${num}</td>
				<td>2${output.prod_no}</td>
				<td>3${output.item_mo}</td>
				<td>4${output.item_name}</td>
				<td style="width:100px;">5${output.emp_no}</td>
				<td>6${output.factory_no}</td>
				<td>7${output.finish_date}</td>
				<td>8${output.prod_amount}</td>
				<td>9${output.poor_quantity}</td>
				<td>10${output.yield}</td>
			</tr>
			
			<c:set var="num" value="${num-1}"></c:set>
		</c:forEach>
	</table>
	
	
	<!-- 페이징 처리 -->
	<c:if test="${page.startPage > page.pageBlock }">
		<a href="listOutput?currentPage=${page.startPage - page.pageBlock}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		<a href="listOutput?currentPage=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${page.endPage > page.totalPage }">
		<a href="listOutput?currentPage=${page.startPage + page.pageBlock}">[다음]</a>
	</c:if>
	
</body>
</html>