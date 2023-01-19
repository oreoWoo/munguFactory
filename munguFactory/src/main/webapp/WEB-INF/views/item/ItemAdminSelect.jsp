<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ItemAdminSelect</title>
<!-- <script type="text/javascript">
	function deleteChk(item_no) {
		if (confirm("품목을 삭제하시겠습니까?")) {
			location.href="ItemAdminDelete?item_no="+item_no;
		}
		
	}
</script> -->
</head>
<body>
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="fw-bold py-3 mb-4">
			<span class="text-muted fw-light">품목 관리 /</span> 품목 조회
		</h4>
		<c:set var="ias" value="${itemAdminSelect}" />
		<div class="row">
			<div class="col-xl-6">
				<!-- HTML5 Inputs -->
				<div class="card mb-4" style="width: 500px;">
					<div class="card-body">
						<div class="mb-3 row">
							<label for="html5-text-input" class="col-md-2 col-form-label">품번</label>
							<div class="col-md-10" style="width: 350px;">${ias.item_no }
							</div>
						</div>
						<div class="mb-3 row">
							<label for="html5-text-input" class="col-md-2 col-form-label">HS코드</label>
							<div class="col-md-10" style="width: 350px;">${ias.hs_code }
							</div>
						</div>
						<div class="mb-3 row">
							<label for="html5-text-input" class="col-md-2 col-form-label">공장명</label>
							<div class="col-md-10" style="width: 350px;">
								${ias.factory_name}</div>
						</div>
						<div class="mb-3 row">
							<label for="html5-text-input" class="col-md-2 col-form-label">품명</label>
							<div class="col-md-10" style="width: 350px;">
								${ias.item_name }</div>
						</div>
						<div class="mb-3 row">
							<label for="html5-text-input" class="col-md-2 col-form-label">재고
								단위</label>
							<div class="col-md-10" style="width: 350px;">
								${ias.stock_unit}</div>
						</div>
						<div class="mb-3 row">
							<label for="html5-text-input" class="col-md-2 col-form-label">생산
								여부</label>
							<div class="col-md-10" style="width: 350px;">
								${ias.item_check}</div>
						</div>
						<div class="demo-inline-spacing">
							<button type="button" class="alert alert-primary">
								<a href="/user/ItemAdminList">목록</a>
							</button>
							<sec:authorize access="hasRole('admin')">
								<button type="button" class="alert alert-primary">
									<a href="/admin/ItemAdminUpdate?item_no=${ias.item_no}">수정</a>
								</button>
								<button type="button" class="alert alert-primary">
									<a href="/admin/ItemAdminDelete?item_no=${ias.item_no}">삭제</a>
								</button>
							</sec:authorize>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%-- 	<div class="subulContainer">
		<c:set var="ias" value="${itemAdminSelect}" />
		<table>
			<thead>
				<tr>
					<th>품목 조회</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>품번</th>
					<td>${ias.item_no }</td>
				</tr>
				<tr>
					<th>HS코드</th>
					<td>${ias.hs_code }</td>
				</tr>
				<tr>
					<th>공장명</th>
					<td>${ias.factory_name }</td>
				</tr>
				<tr>
					<th>품명</th>
					<td>${ias.item_name }</td>
				</tr>
				<tr>
					<th>재고 단위</th>
					<td>${ias.stock_unit }</td>
				</tr>
				<tr>
					<th>생산 여부</th>
					<td>${ias.item_check }</td>
				</tr>
			</tbody>
		</table>
		<button type="button" onclick="location.href='/user/ItemAdminList'">목록</button>
		<sec:authorize access="hasRole('admin')">
			<button type="button"
				onclick="location.href='/admin/ItemAdminUpdate?item_no=${ias.item_no}'">수정</button>
			<button type="button"
				onclick="location.href='/admin/ItemAdminDelete?item_no=${ias.item_no}'">삭제</button>
		</sec:authorize>
		<button type="button" onclick="deleteChk(${ias.item_no})'">삭제</button>
	</div> --%>


</body>
</html>