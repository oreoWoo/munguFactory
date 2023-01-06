<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h4 class="fw-bold py-3 mb-4" style="padding-left: 80px; margin-top: 50px;">거래처 수정</h4>	
	<form action="/updateAccount">
	<table class="table" style="width: 1300px; margin-left:50px;  margin-top: 50px; margin-bottom: 50px;">
	<tr>
		<th>거래처명</th>
		<td>
			<input type="text" class="form-control" id="basic-default-fullname" 
				   name="accountName"   value="${account.accountName}">
		</td>
		<th>거래처유형</th>
		<td>
		<select class="form-select" id="exampleFormControlSelect1">
			<option value="">대형마트</option>
			<option value="">슈퍼마켓</option>
			<option value="">문구점</option>
			<option value="">서점</option>
			<option value="">온라인판매점</option>
			<%-- <input type="text" class="form-control" id="basic-default-fullname"
				   name="accountType" value="${account.accountType}"> --%>
		</select>
		</td>
	</tr>
	<tr>
		<th>사업자등록번호</th>
		<td colspan="4">
			<input type="text" class="form-control" id="basic-default-fullname"
				   name="accountNo" value="${account.accountNo}"	>
		</td>
	</tr>
	<tr>
		<th>업태</th>
		<td>
		<label>
			<input class="form-check-input" type="radio"
				   name="accConditions" value="${account.accConditions}">&nbsp;&nbsp;도매&nbsp;&nbsp;
			<input class="form-check-input" type="radio" 
				   name="accConditions" value="${account.accConditions}">&nbsp;&nbsp;소매&nbsp;&nbsp;
			<input class="form-check-input" type="radio" 
				   name="accConditions" value="${account.accConditions}">&nbsp;&nbsp;도소매&nbsp;&nbsp;
		</label>
		</td>
		<th>업종</th>
		<td>
			<input type="text" class="form-control" id="basic-default-fullname"
				   name="accCatecoory" value="${account.accCatecoory}">
		</td>
	</tr>
	<tr>
		<th>대표자명</th>
		<td colspan="4">
			<input type="text" class="form-control" id="basic-default-fullname"
				   name="accOwner" value="${account.accOwner}">
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="4">
			<input type="text" class="form-control" id="basic-default-fullname"
				   name="accAddress" value="${account.accAddress}">
		</td>
	</tr>
	<tr>
		<th>상세주소</th>
		<td>
			<input type="text" class="form-control" id="basic-default-fullname"
				   name="accAddress2" value="${account.accAddress2}">
		</td>
		<th>우편번호</th>
		<td>
			<input type="text" class="form-control" id="basic-default-fullname"
				   name="accZipcode" value="${account.accZipcode}">
		</td>
	</tr>
	<tr>
		<th>담당자</th>
		<td>
			<input type="text" class="form-control" id="basic-default-fullname"
				   name="accManager" value="${account.accManager}">
		</td>
		<th>전화번호</th>
		<td>
			<input type="text" class="form-control" id="basic-default-fullname"
				   name="accCallnum" value="${account.accCallnum}"
			>
		</td>
	</tr>
	<tr>
		<th>거래만료일</th>
		<td>
			<input type="date" class="form-control" id="basic-default-fullname"
				   name="accState" value="${account.accState}">
		</td>
		<th>거래상태</th>
		<td>
		</td>
	</tr>
	</table>
	<p>
	<p>
	<div style="margin-bottom: 50px;">
	<input  class="btn btn-primary" type="submit" value="수정" style="margin-left: 500px;">
	<input type="button" class="btn btn-primary"  style="margin-left: 30px;"
		   onclick="location.href='/accountList'" value="취소">
	<input type="button" class="btn btn-primary"  style="margin-left: 30px;"
		   value="삭제" data-bs-toggle="modal"     data-bs-target="#modalToggle">
		   <!-- Modal 1-->
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
           <h5 class="modal-title" id="modalToggleLabel">거래처 삭제</h5>
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
           >
                                 	삭제
                                </button>
                                <button
                                  class="btn btn-primary"
                                >
                                 	취소
                                </button>
                              </div>
                            </div>
                          </div>
                        </div>
	</div>
	</form>
</div>
</div>
</div>
</body>
</html>