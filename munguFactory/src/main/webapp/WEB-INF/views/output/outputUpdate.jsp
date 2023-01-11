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
	<h1 style="translate: 70px 100px;">생산실적 수정</h1>
	<!-- Basic Layout -->
    <div class="col-xl" style="width:500px; justify-content: center;">
      <div class="card mb-2" style="translate: 460px 100px;width: 476px;">
        <div class="card-body">
          <form action="updateOutput" method="post">
            <div class="row mb-3 form-inline form-group" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-name">생산번호</label>
              <input type="text" class="form-control" readonly="readonly" name="prod_no" value="${output.prod_no}" style="width: 100px; height: 25px; translate: 10px 2px;">
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-phone">공장코드</label>
              	<select name="factory_no" style="translate: 10px 6px;width:100px;height: 20px;">
              		<c:forEach var="fac" items="${factoryList}">
              			<option value="${fac.factory_no}">${fac.factory_no}</option>
              		</c:forEach>
              	</select>
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-name">품번</label>
              <input type="text" class="form-control" disabled="disabled" name="item_no" value="${output.item_no}" style="width: 100px; height: 25px; translate: 10px 2px;">
            </div>
            <div class="row mb-3" style="translate: 20px;">
	            <label class="col-sm-2 col-form-label" for="basic-default-name">품명</label>
	            <input type="text" class="form-control virtual_dom" style="width:327px; translate: 10px 2px; height:25px;" readonly="readonly" name="item_name" value="${output.item_name}">
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
            	<label class="col-sm-2 col-form-label" for="basic-default-name">작업일시<input type="text" disabled="disabled" name="prod_amount" value="<fmt:formatDate value="${output.finish_date}" pattern="yyyy-MM-dd HH:mm:ss"/>"></label>
            </div>
            <div class="row mb-3" style="translate: 20px; float:left;">
            	<label class="col-sm-2 col-form-label" for="basic-default-name">생산수량<input type="text" disabled="disabled" name="prod_amount" value="${output.prod_amount}" style="width: 50px; text-align: center;"></label>
            </div>
            <div class="row mb-3" style="translate: 20px; float:left;">
            	<label class="col-sm-2 col-form-label" for="basic-default-name" style="translate:10px;">불량수량<input type="text" disabled="disabled" name="poor_quantity" value="${output.poor_quantity}" style="width: 50px; text-align: center;"></label>
            </div>
            <div class="row mb-3" style="translate: 20px;">
            	<label class="col-sm-2 col-form-label" for="basic-default-name" style="width: 50px;text-align: center;translate: 19px;">수율<input type="text" disabled="disabled" name="yield" value="${output.yield}%" style="width: 50px; text-align: center; translate: -12px;"></label>
            </div>
            <div class="row justify-content-end" style="translate: -40px;">
              <div class="col-sm-10">
                <input type="submit" value="확인" class="btn btn-primary" style="translate: -13px;">
                <!-- onclick="location.href='updateOutput?prod_no=${output.prod_no}'" -->
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
</body>
</html>