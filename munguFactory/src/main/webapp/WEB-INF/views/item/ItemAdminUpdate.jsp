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
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="fw-bold py-3 mb-4">
			<span class="text-muted fw-light">품목 관리 /</span> 품목 수정
		</h4>
		<form action="/admin/ItemAdminUpdateConfirm" method="post">
			<div class="row">
				<div class="col-xl-6">

					<div class="card mb-4" style="width: 500px;">
						<div class="card-body">
							<c:forEach var="iaus" items="${ItemAdminUpSelect }">
								<div class="mb-3 row">
									<label for="html5-text-input" class="col-md-2 col-form-label">품번</label>
									<div class="col-md-10" style="width: 350px;">
										<input name="item_no" type="hidden" value="${iaus.item_no }">${iaus.item_no }
									</div>
								</div>
								<div class="mb-3 row">
									<label for="html5-search-input" class="col-md-2 col-form-label">HS코드</label>
									<div class="col-md-10" style="width: 350px;">
										<input class="form-control" type="text" name="hs_code"
											maxlength="300" required="required" value="${iaus.hs_code }">
									</div>
								</div>
								<div class="mb-3 row">
									<label for="html5-email-input" class="col-md-2 col-form-label">공장명</label>
									<div class="col-md-10" style="width: 350px;">
										<select name="factory_no"
											class="btn btn-outline-primary dropdown-toggle"
											data-bs-toggle="dropdown" aria-expanded="false">
											<c:forEach var="fl" items="${factoryList }">
												<c:if test="${iaus.factory_no == fl.factory_no }">
													<option value="${fl.factory_no }" selected="selected">${fl.factory_name }</option>
												</c:if>
												<c:if test="${iaus.factory_no != fl.factory_no }">
													<option value="${fl.factory_no }">${fl.factory_name }</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="mb-3 row">
									<label for="html5-url-input" class="col-md-2 col-form-label">품명</label>
									<div class="col-md-10" style="width: 350px;">
										<input class="form-control" type="text" name="item_name"
											maxlength="300" required="required" id="html5-text-input"
											value="${iaus.item_name }">
									</div>
								</div>
								<div class="mb-3 row">
									<label for="html5-url-input" class="col-md-2 col-form-label">재고단위</label>
									<div class="col-md-10" style="width: 350px;">
										<input class="form-control" type="number" min="1"
											name="stock_unit" maxlength="30" required="required"
											id="html5-url-input" value="${iaus.stock_unit }">
									</div>
								</div>
								<div class="mb-3 row">
									<label for="html5-tel-input" class="col-md-2 col-form-label">생산
										여부</label>
									<div class="col-md-10" style="width: 350px;">
										<select name="item_check"
											class="btn btn-outline-primary dropdown-toggle"
											data-bs-toggle="dropdown" aria-expanded="false">
											<c:if test="${iaus.item_check == '생산'}">
												<option value="생산" selected="selected">생산</option>
												<option value="생산 중단">생산 중단</option>
											</c:if>
											<c:if test="${iaus.item_check == '생산 중단'}">
												<option value="생산">생산</option>
												<option value="생산 중단" selected="selected">생산 중단</option>
											</c:if>

										</select>
									</div>
								</div>

								<button type="submit" class="alert alert-primary">등록</button>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>



<%-- 	<form action="/admin/ItemAdminUpdateConfirm" method="post">
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
	</form> --%>
	</div>
</body>
</html>