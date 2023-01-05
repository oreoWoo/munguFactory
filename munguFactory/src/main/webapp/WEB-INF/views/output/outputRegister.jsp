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
</style>
</head>
<body>
	<h1 style="translate: 70px 100px;">생산실적 등록</h1>
                <!-- Basic Layout -->
                <div class="col-xl" style="width:500px; justify-content: center;">
                  <div class="card mb-2" style="translate: 460px 100px; width:400px;">
                    <div class="card-body">
                      <form id="output" name="frm" action="registerOutput" method="post">
                        <div class="row mb-3" style="translate: 20px;">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">생산번호</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" id="basic-default-name" style="width:210px;"/>
                          </div>
                        </div>
                        <div class="row mb-3" style="translate: 20px;">
                          <label class="col-sm-2 col-form-label" for="basic-default-phone">공장코드</label>
                          <div class="col-sm-10">
                            <select name="factory">
                            	<c:forEach var="output" items="${factoryList}">
                            		<option value="${factory.factory_no}">${factory.factory_name}</option>
                            	</c:forEach>
                            </select>
                          </div>
                        </div>
                        <div class="row mb-3" style="translate: 20px;">
                          <label class="col-sm-2 col-form-label" for="basic-default-company">품번</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" id="basic-default-company" style="width:210px;"/>
                          </div>
                        </div>
                        <div class="row mb-3" style="translate: 20px;">
                          <label class="col-sm-2 col-form-label" for="basic-default-message">품명</label>
                          <div class="col-sm-10">
                            <input type="text" id="basic-default-phone"
                              class="form-control phone-mask"
                              aria-label="658 799 8941"
                              aria-describedby="basic-default-phone"
                              style="width:210px;"
                            />
                          </div>
                        </div>
                        <div class="row mb-3" style="translate: 20px;">
                          <label class="col-sm-2 col-form-label" for="basic-default-email">사원번호</label>
                          <div class="col-sm-10">
                            <div class="input-group input-group-merge" style="width:210px;">
                              <input type="text" id="basic-default-email" class="form-control"/>
                            </div>
                          </div>
                        </div>
                        <div class="row mb-3" style="translate: 20px;">
                          <label class="col-sm-2 col-form-label" for="basic-default-message">작업일시</label>
                          <div class="col-sm-10">
                            <input type="datetime-local"
                              value="2023-01-05T12:30"
                              id="meeting-time"
                              min="2023-01-02T00:00"
                              max="2023-01-31T00:00"
                              class="form-control phone-mask"
                              aria-label="658 799 8941"
                              aria-describedby="basic-default-phone"
                              style="width:210px;"
                            />
                          </div>
                        </div>
                        <div class="row mb-3" style="translate: 20px;">
                          <label class="col-sm-2 col-form-label" for="basic-default-message">생산수량</label>
                          <div class="col-sm-10">
                            <input type="number" id="fn_prod_amount" name="fn_prod_amount"
                              min="1"
                              class="form-control phone-mask num_only"
                              aria-label="658 799 8941"
                              aria-describedby="basic-default-phone"
                              style="width:210px;"
                            />
                          </div>
                        </div>
                        <div class="row mb-3" style="translate: 20px;">
                          <label class="col-sm-2 col-form-label" for="basic-default-message">불량수량</label>
                          <div class="col-sm-10">
                            <input type="number" id="fn_poor_quantity" name="fn_poor_quantity"
                              min="0" max="fn_prod_amount"
                              class="form-control phone-mask num_only"
                              aria-label="658 799 8941"
                              aria-describedby="basic-default-phone"
                              style="width:210px;"
                            />
                          </div>
                        </div>
                        <div class="row mb-3" style="translate: 20px;">
                          <label class="col-sm-2 col-form-label text-right font-weight-bold num_only" for="basic-default-message">수율</label>
                          <div class="col-sm-10">
                            <input type="text"
                              id="fn_yield"
                              name="fn_yield"
                              value=""
                              class="form-control phone-mask num_only"
                              aria-label="658 799 8941"
                              aria-describedby="basic-default-phone"
                              style="width:210px;"
                            />
                          </div>
                        </div>
                        <div class="row justify-content-end">
                          <div class="col-sm-10">
                            <input type="submit" class="btn btn-primary" style="translate: -45px;">
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
</body>
<script type="text/javascript">

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