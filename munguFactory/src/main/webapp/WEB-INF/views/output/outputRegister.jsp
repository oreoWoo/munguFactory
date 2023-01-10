<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	
	
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}
</style>
</head>
<body>
	<h1 style="translate: 70px 100px;">생산실적 등록</h1>
                <!-- Basic Layout -->
                <div class="col-xl" style="width:500px; justify-content: center;">
                  <div class="card mb-2" style="translate: 460px 100px; width:400px;">
                    <div class="card-body">
                      <form action="registerOutput" id="output" name="frm" method="post">
                        <div class="row mb-3" style="translate: 20px;">
                          <label class="col-sm-2 col-form-label" for="basic-default-phone">공장코드</label>
                          <div class="col-sm-10">
                          	<select name="factory_no" style="translate: 0 4.5px;">
                          		<c:forEach var="fac" items="${factoryList}">
                          			<option value="${fac.factory_no}">${fac.factory_no}</option>
                          		</c:forEach>
                          	</select>
                          </div>
                        </div>
                        <div class="row mb-3" style="translate: 20px;">
                          <label class="col-sm-2 col-form-label" for="basic-default-message">품번</label>
                          <input type="number"
                              id="meeting-time"
                              class="form-control phone-mask input"
                              value=""
                              name="item_no"
                              aria-label="658 799 8941"
                              aria-describedby="basic-default-phone"
                              style="width:210px; translate: 12px;"
                          >
                        </div>
                        <div class="row mb-3" style="translate: 20px;">
                          <label class="col-sm-2 col-form-label" for="basic-default-message">품명</label>
                          <input type="text"
                              id="meeting-time"
                              class="form-control phone-mask"
                              value=""
                              name="item_name"
                              aria-label="658 799 8941"
                              aria-describedby="basic-default-phone"
                              style="width:210px; translate: 12px;"
                          />
                        </div>
                        <div class="row mb-3" style="translate: 20px;">
                          <label class="col-sm-2 col-form-label" for="basic-default-email">사원번호</label>
                          	<select name="emp_no" style="translate: 12px; width: auto;">
                          		<c:forEach var="emp" items="${empList}">
                          			<option value="${emp.emp_no}">${emp.emp_no}</option>
                          		</c:forEach>
                          	</select>
                        </div>
<!--                         <div class="row mb-3" style="translate: 20px;">
                          <label class="col-sm-2 col-form-label" for="basic-default-message">작업일시</label>
                          <div class="col-sm-10">
                            <input type="datetime-local"
                              value="2023-01-05T12:30"
                              name="finish_date"
                              id="meeting-time"
                              min="2023-01-02T00:00"
                              max="2023-01-31T00:00"
                              class="form-control phone-mask"
                              aria-label="658 799 8941"
                              aria-describedby="basic-default-phone"
                              style="width:210px;"
                            />
                          </div>
                        </div> -->
                        <div class="row mb-3" style="translate: 20px;">
                          <label class="col-sm-2 col-form-label" for="basic-default-message">생산수량</label>
                          <div class="col-sm-10">
                            <input type="number" id="fn_prod_amount" name="prod_amount"
                              value=""
                              min="1"
                              class="form-control phone-mask num_only"
                              aria-label="658 799 8941"
                              aria-describedby="basic-default-phone"
                              style="width:210px;" required
                            />
                          </div>
                        </div>
                        <div class="row mb-3" style="translate: 20px;">
                          <label class="col-sm-2 col-form-label" for="basic-default-message">불량수량</label>
                          <div class="col-sm-10">
                            <input type="number" id="fn_poor_quantity" name="poor_quantity"
                              value=""
                              min="0" max="fn_prod_amount"
                              class="form-control phone-mask num_only"
                              aria-label="658 799 8941"
                              aria-describedby="basic-default-phone"
                              style="width:210px;"
                            />
                          </div>
                        </div>
<!--                         <div class="row mb-3" style="translate: 20px;">
                          <label class="col-sm-2 col-form-label text-right font-weight-bold num_only" for="basic-default-message">수율</label>
                          <div class="col-sm-10">
                            <input type="text" id="fn_yield" name="fn_yield" class="form-control phone-mask num_only" aria-label="658 799 8941"
                              aria-describedby="basic-default-phone"
                              style="width:210px;" required
                            />
                          </div>
                        </div> -->
                        <div class="row justify-content-end">
                          <div class="col-sm-10">
                            <input type="submit" class="btn btn-primary" style="translate: -45px;" required>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
                
</body>
<script type="text/javascript">


	// 수율 계산
	$(function() {
			$('input.num_only').on('keyup', function() {
				
				var prod_amount   = parseInt($("#fn_prod_amount").val() || 0);
				var poor_quantity = parseInt($("#fn_poor_quantity").val() || 0);

				var yield = (poor_quantity / prod_amount) * 100;
				
				$("#fn_yield").val(yield+'%');
			});
		});


</script>
</html>