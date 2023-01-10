<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
	.col-sm-10 {
	    flex: 0 0 auto;
	    width: 50%;
	}
	
	.form-label, .col-form-label {
	    font-size: 0.75rem;
	    text-transform: uppercase;
	    letter-spacing: inherit;
	    width: 80px;
	}
</style>
</head>
<body>
	<h1 style="translate: 70px 100px;">생산실적 상세정보</h1>
	<!-- Basic Layout -->
    <div class="col-xl" style="width:500px; justify-content: center;">
      <div class="card mb-2" style="translate: 460px 100px; width:400px;">
        <div class="card-body">
          <form id="output" name="frm" action="registerOutput" method="post">
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-name">생산번호</label>
              <label class="col-sm-2 col-form-label" for="basic-default-name">${output.prod_no}</label>
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-phone">공장코드</label>
              	<select name="factory_no" style="translate: 10px; width:100px;">
              		<c:forEach var="fac" items="${factoryList}">
              			<option value="${fac.factory_no}">${fac.factory_no}</option>
              		</c:forEach>
              	</select>
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-company">품번</label>
              <label class="col-sm-2 col-form-label" for="basic-default-name">${output.item_no}</label>
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-company">품명</label>
              <label class="col-sm-10 col-form-label" for="basic-default-name" style="width: 250px;">${output.item_name}</label>
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-email">사원번호</label>
              <select name="emp_no" style="translate: 12px; width: auto;">
              	<c:forEach var="emp" items="${empList}">
              		<option value="${emp.emp_no}">${emp.emp_no}</option>
              	</c:forEach>
               </select>
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-message">작업일시</label>
              <label class="col-sm-2 col-form-label" for="basic-default-name" style="width: 250px;">${output.finish_date}</label>
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-message">생산수량</label>
              <label class="col-sm-2 col-form-label" for="basic-default-name">${output.prod_amount}</label>
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-message">불량수량</label>
              <label class="col-sm-2 col-form-label" for="basic-default-name">${output.poor_quantity}</label>
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label text-right font-weight-bold num_only" for="basic-default-message">수율</label>
              <label class="col-sm-2 col-form-label" for="basic-default-name">${output.yield}%</label>
            </div>
            <div class="row justify-content-end" style="translate: -40px;">
              <div class="col-sm-10">
                <input type="button" value="수정" class="btn btn-primary" style="translate: -45px;" onclick="location.href='updateOutput?prod_no=${output.prod_no}'">
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
</body>
</html>