<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-xxl flex-grow-1 container-p-y" style="width: 1600px;">
<div class="card mb-6">
	<div id="container">
    <h4 class="fw-bold py-3 mb-4" style="padding-left: 80px; margin-top: 50px;">${account.account_name}(${account.account_no})</h4>	
    <form action="">
    <sec:authorize access="hasRole('admin')" var="roleAdmin"/>
    <sec:authorize access="hasAnyRole('user','admin')" var="roleUser"/>	
    <input type="hidden" name="account_no" value="${account.account_no}">
	<table class="table" style="width: 1300px; margin-left:50px;  margin-top: 50px; margin-bottom: 50px;">
	<tr>
		<th>거래처명</th>
		<td>${account.account_name}</td>
		<th>거래처유형</th>
		<td>${account.account_type}</td>
	</tr>
	<tr>
		<th>사업자등록번호</th>
		<td colspan="4">${account.account_idno}</td>
	</tr>
	<tr>
		<th>업태</th>
		<td>${account.acc_conditions}</td>
		<th>업종</th>
		<td>${account.acc_category}</td>
	</tr>
	<tr>
		<th>대표자명</th>
		<td colspan="4">${account.acc_owner}</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="4">${account.acc_address}</td>
	</tr>
	<tr>
		<th>상세주소</th>
		<td>${account.acc_address2}</td>
		<th>우편번호</th>
		<td>${account.acc_zipcode}</td>
	</tr>
	<tr>
		<th>담당자</th>
		<td>${account.acc_manager}</td>
		<th>전화번호</th>
		<td>${account.acc_telnum}</td>
	</tr>
	<tr>
		<th>거래만료일</th>
		<td colspan="">${account.acc_enddate}</td>
		<th>거래상태</th>
		<td>${account.acc_state== '0' ? 'Y' :'N'}</td>
	</tr>
	</table>
	<p>
	<p>
	<div style="margin-bottom: 50px;">
	<input type="button" class="btn btn-primary"  style="margin-left: 560px;"
		   onclick="location.href='/user/accountList'" value="목록">
		   
	<sec:authorize access="hasRole('admin')">
	<input type="button" class="btn btn-primary"  style="margin-left: 30px;"
		   onclick="location.href='/admin/accountUpdateForm?account_no=${account.account_no}'" value="수정">
	</sec:authorize>
	
	</div>
	</form>
	</div>
</div>
</div>
</body>
</html>