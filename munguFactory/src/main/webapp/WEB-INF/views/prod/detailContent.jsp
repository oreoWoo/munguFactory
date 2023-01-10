<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BhTeacherAdd</title>
<script type="text/javascript">
	function updateChk() {
		return confirm("생산을 지시하시겠습니까?");
	}
</script>
</head>
<body>

<div class="container">
	<div class="col-xl-10 my-5 mx-3">
		<span class="fs-2 fw-semibold mx-5 ">생산지시 </span>
	</div>
	
	<form action="AddConfirmList"
		method="post" onsubmit="return updateChk() ">
			<input name="sujuNo" type="hidden" value="${prodDto.sujuNo}">
			<table class="table caption-top my-5" style="margin-left: 100; text-align: center; text-align:left;">
				<tr>
					<th>수주번호</th>
					<td>${prodDto.sujuNo}</td>
				</tr>
				<tr>
					<th>품번</th>
					<td>${prodDto.itemNo}</td>
				</tr>
				<tr>
					<th>품명</th>
					<td>${prodDto.itemName}</td>
				</tr>
				<tr>
					<th>공장코드</th>
					<td>${prodDto.factoryNo}</td>
				</tr>
				<tr>
					<th>생산수량</th>
					<td>${prodDto.prodAmount}</td>
				</tr>
				<tr>
					<th>담당자</th>
					
				</tr>
				<tr>
					<th>생산지시일</th>
					<td><input type="date" name="startDate" required="required"></td>
				</tr>
				<tr>
					<th>생산완료일</th>
					<td><input type="date" name="finishDate" required="required"></td>
				</tr>
			<!-- 	<tr>
					<th>비고</th>
					<td><input type="text" name="afterContent" maxlength="330" required="required"></td>
				</tr> -->
				<tr>
					<th></th>
					<th class="d-flex justify-content-end">
						<button type="button" class="btn btn-outline-secondary mx-2"
						onclick="location.href='/ProdList?sujuNo=${prodDto.sujuNo}'">
						목록 보기</button>	

						<button type="submit" class="btn btn-outline-secondary  mx-2 justify-content-end">지시 하기</button>
					</th>
				</tr>

			</table>
	</form>
</div>
</body>
</html>