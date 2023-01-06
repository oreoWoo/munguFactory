<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-xxl flex-grow-1 container-p-y" style="width: 1600px;">
<div class="card mb-6">
	<h4 class="fw-bold py-3 mb-4" style="padding-left: 80px; margin-top: 50px;">거래처 조회</h4>
	<div id="container" style="width: 1300px;" >
		<button id="accAdd" class="btn btn-primary" style="float: right;"  onclick="location.href='/accountAddFrom'">신규등록</button>
	<div class="input-group" style="width: 300px;float: right; padding-bottom: 50px;  padding-right: 20px; ">
		<input
	     	type="text"
	    	class="form-control"
	     	placeholder="거래처명을 입력하세요"
	 />
	<button class="btn btn-primary" type="button">검색</button>
	</div>
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
		<td>${account.accountCode}</td>
		<td>${account.accountName}</td>
		<td>${account.accountType}</td>
		<td>${account.accOwner}</td>
		<td>${account.accManager}</td>
		<td>${account.accTellnum}</td>
		<td>${account.accState}</td>
	</tr>
	</c:forEach>
	</tbody>
	</table>
	</div>
	<div style="margin-left: 550px; margin-bottom: 50px;">
	<nav aria-label="Page navigation">
      <ul class="pagination">
      	<li class="page-item prev">
        	<a class="page-link" href="javascript:void(0);">
        	<i class="tf-icon bx bx-chevrons-left"></i></a>
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
                              <a class="page-link" href="javascript:void(0);"
                                ><i class="tf-icon bx bx-chevrons-right"></i
                              ></a>
                            </li>
                          </ul>
                        </nav>
	</div>
</div>
</div>
</body>
</html>