<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function daumPostSearch(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            $("#inputAddress").val(data.address)
	            $("#inputzonecode").val(data.zonecode)
	        }
	    }).open();
	}
	
	
</script>

</head>
<body>
<div class="container-xxl flex-grow-1 container-p-y" style="width: 1600px;">
<div class="card mb-6">
<div id="container">
	<h4 class="fw-bold py-3 mb-4" style="padding-left: 80px; margin-top: 50px;">${account.account_name}(${account.account_no}) 정보수정</h4>	
	<form action="/updateAccount">
	<input type="hidden" name="account_no" value="${account.account_no}">
	<input type="hidden" name="acc_state" value="${account.acc_state}">
	<table class="table" style="width: 1300px; margin-left:50px;  margin-top: 50px; margin-bottom: 50px;">
	<tr>
		<th>거래처명</th>
		<td>
			<input type="text" class="form-control" id="basic-default-fullname" 
				   name="account_name"   value="${account.account_name}" >
		</td>
		<th>거래처유형</th>
		<td>
		<select class="form-select" id="exampleFormControlSelect1" name="account_type">
			<option value="대형마트" <c:if test ="${account.account_type eq '대형마트'}">selected="selected"</c:if>>대형마트</option>
			<option value="슈퍼마켓" <c:if test ="${account.account_type eq '슈퍼마켓'}">selected="selected"</c:if>>슈퍼마켓</option>
			<option value="문구점"<c:if test ="${account.account_type eq '슈퍼마켓'}">selected="selected"</c:if>>문구점</option>
			<option value="서점"<c:if test ="${account.account_type eq '서점'}">selected="selected"</c:if>>서점</option>
			<option value="온라인판매점"<c:if test ="${account.account_type eq '온라인판매점'}">selected="selected"</c:if>>온라인판매점</option>
			<%-- <input type="text" class="form-control" id="basic-default-fullname"
				   name="accountType" value="${account.accountType}"> --%>
		</select>
		</td>
	</tr>
	<tr>
		<th>사업자등록번호</th>
		<td colspan="4">${account.account_idno}</td>
	</tr>
	<tr>
		<th>업태</th>
		<td>
		<label>
			<input class="form-check-input" type="radio" name="acc_conditions" value="도매업" id="a"
			 <c:if test="${account.acc_conditions eq '도매업'}">checked="checked"</c:if>/><label for="a">&nbsp;&nbsp;도매업</label>
			 &nbsp;&nbsp;
			<input class="form-check-input" type="radio" name="acc_conditions" value="소매업" id="b"
			<c:if test="${account.acc_conditions eq '소매업'}">checked="checked"</c:if>/><label for="b">&nbsp;&nbsp;소매업</label>
			&nbsp;&nbsp;
			<input class="form-check-input" type="radio" name="acc_conditions" value="도소매업" id="c"
			<c:if test="${account.acc_conditions eq '도소매업'}">checked="checked"</c:if>/><label for="c">&nbsp;&nbsp;도소매업</label>
		</label>
		</td>
		<th>업종</th>
		<td>
			<input type="text" class="form-control" id="basic-default-fullname"
				   name="acc_category" value="${account.acc_category}">
		</td>
	</tr>
	<tr>
		<th>대표자명</th>
		<td colspan="4">
			<input type="text" class="form-control" id="basic-default-fullname"
				   name="acc_owner" value="${account.acc_owner}">
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="3">
			<input type="text" class="form-control" id="inputAddress"
				   name="acc_address" value="${account.acc_address}">
		</td>
		<td><input type="button" class="btn btn-primary" value="찾기" onclick="daumPostSearch()"></td>
	</tr>
	<tr>
		<th>상세주소</th>
		<td>
			<input type="text" class="form-control" id="basic-default-fullname"
				   name="acc_address2" value="${account.acc_address2}">
		</td>
		<th>우편번호</th>
		<td>
			<input type="text" class="form-control" id="inputzonecode"
				   name="acc_zipcode" value="${account.acc_zipcode}">
		</td>
	</tr>
	<tr>
		<th>담당자</th>
		<td>
			<input type="text" class="form-control" id="basic-default-fullname"
				   name="acc_manager" value="${account.acc_manager}">
		</td>
		<th>전화번호</th>
		<td>
			<input type="text" class="form-control" id="basic-default-fullname"
				   name="acc_telnum" value="${account.acc_telnum}"
			>
		</td>
	</tr>
	<tr>
		<th>거래만료일</th>
		<td>
			<input type="date" class="form-control" id="basic-default-fullname"
				   name="acc_enddate" value="${account.acc_enddate}">
		</td>
		<th>거래상태</th>
		<td>${account.acc_state== '0' ? 'Y' :'N' }</td>
	</tr>
	</table>
	<p>
	<p>
	
	<input  class="btn btn-primary" type="button" value="수정" style="margin-left: 500px;"
			data-bs-toggle="modal" data-bs-target="#modalToggle2">
	<input type="button" class="btn btn-primary"  style="margin-left: 30px;"
		   onclick="location.href='/accountList'" value="목록">
	<input type="button" class="btn btn-primary"  style="margin-left: 30px;"
		   data-bs-toggle="modal" data-bs-target="#modalToggle" value="삭제" >
	<!-- 수정 Modal -->
                        <div
                          class="modal fade"
                          id="modalToggle2"
                          aria-labelledby="modalToggleLabel"
                          tabindex="-1"
                          style="display: none"
                          aria-hidden="true"
                        >
                          <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="modalToggleLabel">${account.account_no} ${account.account_name}</h5>
                                <button
                                  type="button"
                                  class="btn-close"
                                  data-bs-dismiss="modal"
                                  aria-label="Close"
                                ></button>
                              </div>
                              <div class="modal-body">해당 거래처 정보를 수정하시겠습니까?</div>
                              <div class="modal-footer">
                             	 <input
                             	  type="submit"
                                  class="btn btn-primary"
                                  data-bs-target="#modalToggle2"
                                  data-bs-toggle="modal"
                                  data-bs-dismiss="modal"
                                  value="수정"
                                >
                                <button
                                  type="button"
                                  class="btn btn-primary"
                                  data-bs-dismiss="modal"
                                  aria-label="Close"
                                >
                                                                  취소
                                </button>
                              </div>
                            </div>
                          </div>
                        </div>
	</form>
	<!-- 삭제 Modal-->
                        <div
                          class="modal fade"
                          id="modalToggle"
                          aria-labelledby="modalToggleLabel"
                          tabindex="-1"
                          style="display: none"
                          aria-hidden="true"
                        >
                          <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="modalToggleLabel">${account.account_no} ${account.account_name}</h5>
                                <button
                                  type="button"
                                  class="btn-close"
                                  data-bs-dismiss="modal"
                                  aria-label="Close"
                                ></button>
                              </div>
                              <div class="modal-body">해당 거래처 정보를 삭제하시겠습니까?</div>
                              <div class="modal-footer">
                             	 <button
                                  class="btn btn-primary"
                                  data-bs-target="#modalToggle"
                                  data-bs-toggle="modal"
                                  data-bs-dismiss="modal"
                                  onclick="location.href='/accountDelete?account_no=${account.account_no}'"  
                                >
                                                                 삭제
                                </button>
                                <button
                                  type="button"
                                  class="btn btn-primary"
                                  data-bs-dismiss="modal"
                                  aria-label="Close"
                                >
                                                                  취소
                                </button>
                              </div>
                            </div>
                          </div>
                        </div>
                        
</div>
</div>
</div>
</body>
</html>