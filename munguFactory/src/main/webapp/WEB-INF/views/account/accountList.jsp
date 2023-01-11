<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	$(function(){
		if(${upMsg == 1}){
			 alert ("거래처 정보가 수정되었습니다");
		}
		if(${delMsg == 1}){
			 alert ("거래처 정보가 삭제되었습니다");
		}
		if(${inMsg == 1}){
			 alert ("거래처 정보가 등록 되었습니다");
		}
		
	});

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-xxl flex-grow-1 container-p-y" style="width: 1600px;">
<div class="card mb-6">
	<h4 class="fw-bold py-3 mb-4" style="padding-left: 80px; margin-top: 50px;">거래처 조회</h4>
	<div id="container" style="width: 1300px;" >
	<c:set var="num" value="${page.total-page.start+1 }"></c:set>
	<button id="accAdd" class="btn btn-primary" style="float: right;"  onclick="location.href='/accountAddFrom'">신규등록</button>
	<form action="/accountSearch">
	<div class="input-group" style="width: 300px;float: right; padding-bottom: 50px;  padding-right: 20px; ">
		<input
	     	type="text"
	     	name="searchString"
	    	class="form-control"
	    	aria-label="Search"
	     	placeholder="거래처명을 입력하세요"
	     	required="required"
	 />
	<input class="btn btn-primary" type="submit" value="검색">
	</div>
	</form>
	
	<table class="table" style="width: 1300px; margin-left:50px;  margin-top: 50px; margin-bottom: 50px;">
	<thead>
	<tr>
		<th>거래처코드</th>
		<th>거래처명</th>
		<th>거래처유형</th>
		<th>대표자명</th>
		<th>담당자명</th>
		<th>전화번호</th>
		<th>거래현황</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="account" items="${accountList}">
	<tr>
		<td><a href="/accountInfoDetail?account_no=${account.account_no}">${account.account_no}</td>
		<td>${account.account_name}</td>
		<td>${account.account_type}</td>
		<td>${account.acc_owner}</td>
		<td>${account.acc_manager}</td>
		<td>${account.acc_telnum}</td>
		<td>${account.acc_state == '0' ? 'Y' :'N' }</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}" >
		<li class="page-item">
			<a  class="page-link" href="/accountList?currentPage=${i}">${i}</a>
		</li>
	</c:forEach>
	</ul>
	</nav>
	</div>
	</div>
</div>
</body>
</html>