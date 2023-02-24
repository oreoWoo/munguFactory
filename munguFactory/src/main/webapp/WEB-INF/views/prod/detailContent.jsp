<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산지시</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
	// 브라우저가 새로 뜰 때 ready가 실행되고, 이벤트 등록은 그 안에서 추가해야함 
	$(document).ready(function(){
		
		// 지시하기 버튼 이벤트 등록
		$("#updateChk").on("click", function(){
			
			if(confirm("생산을 지시하시겠습니까?")){
				var frm = $("#frm").serialize();
				console.log("frm : " + frm);
	
				$.ajax({
					type: "post",
					url : '/user/modContent',
					data: frm,
					dataType: "text",
					success : function(data){
						if (data == 0){
							alert("생산지시를 실패하였습니다.");
						}else{
							alert("생산지시가 완료되었습니다.");
						}
						opener.location.reload();
						self.close();
					}
				});
			}
		});
	});

	//항상 실행하게 하는 구문
$(function(){
	makeFinishDate();
	
})

function makeFinishDate() {
	/* 수주일 받아오기 */
	let finishDate = "${prodDto.prod_date}";
	console.log("수주날짜받아와? : "+finishDate);
	$('#finish_date').prop('min', finishDate);
}	 
	
</script>
<script type="text/javascript">

$(document).ready(function(){
	
	// 지시하기 버튼 이벤트 등록
	$("#delChk").on("click", function(){
		if(confirm("생산지시를 삭제 하시겠습니까?")){
			var frm = $("#frm").serialize();
			console.log("frm : " + frm);

			$.ajax({
				type: "post",
				url : '/user/delete',
				data: frm,
				dataType: "text",
				 success : function(data){
					if (data == 0){
						alert("삭제를 실패하였습니다.");
					}else{
						alert("삭제가 완료되었습니다.");
					} 
					opener.location.reload();
					self.close();
				}
			});
		}
	});
});


/* function delChk(){
	if(confirm("생산지시를 삭제 하십니까?")){
		location.href="/user/delete?suju_no=${prodDto.suju_no}"
	}                  
} */

</script>
<script type="text/javascript">
$(document).ready(function(){
	
	// 지시하기 버튼 이벤트 등록
	$("#ListChk").on("click", function(){
		if(confirm("생산지시 전 입니다. 목록으로 이동하시겠습니까? ")){
			var frm = $("#frm").serialize();
			console.log("frm : " + frm);

			$.ajax({
				type: "post",
				url : '/user/ProdList',
				/* data: frm, */
				dataType: "text",
				success : function(data){
					if (data == 0){
						alert("이동 완료");
					}else{
						alert("이동 완료");
					} 
					opener.location.reload();
					self.close();
				}
			});
		}
	});
});



</script>

</head>
<body>

<div class="container">
	<div class="col-xl-10 my-5 mx-3">
		<span class="fs-2 fw-semibold mx-5 ">생산지시 </span>
	</div>
	<!-- controller 이동 -->
	<!-- <form id="frm" action="/modContent" method="post"> -->
	<form id="frm" onsubmit="return false">
		<input name="suju_no" id="suju_no"  type="hidden" value="${prodDto.suju_no}" >
		<input name="item_no" id="item_no"  type="hidden" value="${prodDto.item_no}">
		<input name="emp_no" type="hidden" value="${prodDto.emp_no}">

		
		<table class="table caption-top my-5" style="margin-left: 100; text-align: center; text-align:left;">
			<tr>
				<th>수주번호</th>
				<td>${prodDto.suju_no}</td>
			</tr>
			<tr>
				<th>품번</th>
				<td>${prodDto.item_no}</td>
			</tr>
			<tr>
				<th>품명</th>
				<td>${prodDto.item_name}</td>
			</tr>
			<tr>
				<th>공장코드</th>
				<td>${prodDto.factory_no}</td>
			</tr>
			<tr>
				<th>생산수량</th>
				<td><input name="prod_amount" id="prod_amount" required="required" value="${prodDto.prod_amount}"></td>
			</tr>
			<tr>
				<th>담당자</th>
				<td>${prodDto.emp_no}</td>
			</tr>
			<tr>
				<th>수주일</th>
				<td><input type="date" name="prod_date" value="${prodDto.prod_date}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>생산지시일</th>
				<td><input type="date" name="finish_date" id="finish_date"  value="${prodDto.finish_date}" min=""></td>
<!-- 				<td><input type="date" name="finishDate" required="required"></td>
 -->					
			</tr>
		<!-- 	<tr>
				<th>비고</th>
				<td><input type="text" name="afterContent" maxlength="330" required="required"></td>
			</tr> -->
			<tr>
				<th></th>
				<th class="d-flex justify-content-end">
					<button id="ListChk" class="btn btn-outline-secondary mx-2"
					<%-- onclick="location.href='/user/ProdList?suju_no=${prodDto.suju_no}'" --%>>
					목록 보기</button>	
					
					<button id="delChk" class="btn btn-outline-secondary  mx-2 justify-content-end">삭제</button>

					<button id="updateChk" class="btn btn-outline-secondary  mx-2 justify-content-end">지시 하기</button>
				</th>
			</tr>

		</table>
	</form>
</div>
</body>
</html>