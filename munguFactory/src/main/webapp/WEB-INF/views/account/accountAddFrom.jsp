<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
<body>
<div class="container-xxl flex-grow-1 container-p-y" style="width: 1600px;">
<div class="card mb-6">
	<div id="container">
    <h4 class="fw-bold py-3 mb-4" style="padding-left: 80px; margin-top: 50px;">거래처등록</h4>	
    <form action="/accountAdd">
	<table class="table" style="width: 1300px; margin-left:50px;  margin-top: 50px; margin-bottom: 50px;">
	<tr>
		<th>거래처명</th>
		<td>
			<input type="text" class="form-control" id="basic-default-fullname" 
			       name="account_name" required="required">
		</td>
		<th>거래처유형</th>
		<td>
		<select class="form-select" id="exampleFormControlSelect1" name="account_type">
			<option value="대형마트">대형마트</option>
			<option value="슈퍼마켓">슈퍼마켓</option>
			<option value="문구점">문구점</option>
			<option value="서점">서점</option>
			<option value="온라인판매점">온라인판매점</option>
			<!-- <input type="text" class="form-control" id="basic-default-fullname" name="accountType"> -->
		</select>
		</td>
	</tr>
	<tr>
		<th>사업자등록번호</th>
		<td colspan="4">
			<input type="text" class="form-control" id="basic-default-fullname" 
				   name="account_idno" placeholder="'-'를 포함하여 입력하세요" required="required">
		</td>
	</tr>
	<tr>
		<th>업태</th>
		<td>
			<input class="form-check-input" type="radio" name="acc_conditions"  value="도매업" id="a"><label for="a">&nbsp;&nbsp;도매업</label>
			&nbsp;&nbsp;
			<input class="form-check-input" type="radio" name="acc_conditions" value="소매업" id="b"><label for="b">&nbsp;&nbsp;소매업</label>
			&nbsp;&nbsp;
			<input class="form-check-input" type="radio" name="acc_conditions" value="도소매업" id="c"><label for="c">&nbsp;&nbsp;도소매업</label>
		</td>
		<th>업종</th>
		<td>
			<input type="text" class="form-control" id="basic-default-fullname" name="acc_category">
		</td>
	</tr>
	<tr>
		<th>대표자명</th>
		<td colspan="4">
			<input type="text" class="form-control" id="basic-default-fullname" 
				   name="acc_owner" style="width: 400px;" required="required">
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="3">
			<input type="text" class="form-control"  id="inputAddress"
				   name="acc_address" required="required">
		</td>
		<td><input type="button" class="btn btn-primary" value="찾기"
		           onclick="daumPostSearch()" ></td>
	</tr>
	<tr>
		<th>상세주소</th>
		<td>
			<input type="text" class="form-control" id="basic-default-fullname" 
				   name="acc_address2" placeholder="상세주소를 입력하세요">
		</td>
		<th>우편번호</th>
		<td>
			<input type="text" class="form-control" id="inputzonecode" name="acc_zipcode">
		</td>
	</tr>
	<tr>
		<th>담당자</th>
		<td>
			<input type="text" class="form-control" id="basic-default-fullname" 
				   name="acc_manager" required="required">
		</td>
		<th>전화번호</th>
		<td>
			<input type="text" class="form-control" id="basic-default-fullname" 
				   name="acc_telnum" placeholder=" '-'를 포함하여 입력하세요">
		</td>
	</tr>
	<tr>
		<th>거래만료일</th>
		<td colspan="4">
			<input type="date" class="form-control" id="basic-default-fullname" 
				   name="acc_enddate" style="width: 400px;" required="required">
		</td>
	</tr>
	</table>
	<p>
	<p>
	<div style="margin-bottom: 50px;">
	<input  class="btn btn-primary" type="submit" value="등록" style="margin-left: 560px;">
	<input type="button" class="btn btn-primary"  style="margin-left: 30px;"
		   onclick="location.href='/accountList'" value="목록">
	</div>
	</form>
	</div>
</div>
</div>
</body>
</html>