<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	$(function(){
		if(${upMsg == 1}){
			 alert ("거래처 정보가 수정되었습니다");
		}
		if(${inMsg == 1}){
			 alert ("거래처 정보가 등록 되었습니다");
		}
		
	});

</script>

<script type="text/javascript">

	$(function(){
		if(${delMsg} == 0) {
			alert("해당 거래처를 삭제 할 수 없습니다. ");
		} else {
			alert("거래처 정보가 삭제 되었습니다.");
		}
		
	});

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-xxl flex-grow-1 container-p-y" style="width: 1600px;">
<h4 class="fw-bold py-3 mb-4">거래처 리스트</h4>
<div class="card mb-6">
	<div id="container" style="width: 1300px;" >
	<sec:authorize access="hasRole('admin')" var="roleAdmin"/>
    <sec:authorize access="hasAnyRole('user','admin')" var="roleUser"/>	
	<c:set var="num" value="${page.total-page.start+1 }"></c:set>
	<sec:authorize access="hasRole('admin')">
	<button id="accAdd" class="btn btn-primary" style="float: right; margin-top: 50px;"  onclick="location.href='/admin/accountAddFrom'">신규등록</button>
	</sec:authorize>
	<form action="/user/accountSearch">
	<div class="input-group" style="width: 300px;float: right; padding-bottom: 50px;  padding-right: 20px; padding-top: 50px;">
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
		<td><a href="/user/accountInfoDetail?account_no=${account.account_no}">${account.account_no}</td>
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
			<a  class="page-link" href="/user/accountList?currentPage=${i}">${i}</a>
		</li>
	</c:forEach>
	</ul>
	</nav>
	</div>
	</div>
</div>
</body>
</html>