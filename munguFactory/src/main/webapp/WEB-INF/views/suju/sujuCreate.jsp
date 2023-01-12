<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- bootStrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<meta charset="UTF-8">
<title >Insert title here</title>
<style type="text/css">
input[type=checkbox]
{
  /* Double-sized Checkboxes */
  -ms-transform: scale(2); /* IE */
  -moz-transform: scale(2); /* FF */
  -webkit-transform: scale(2); /* Safari and Chrome */
  -o-transform: scale(2); /* Opera */
  padding: 10px;
}
.SujuContainer th {
	font-size: 18px; 

}
.Orders-first-table, .Orders-second-table  {
	width: 1480px;
	text-align: center;
}
.table-hover:not(.SujuContainer table)

</style>
<script type="text/javascript">

	// 거래처 리스트
	function accountList(){
		alert("거래처 조회시작");
		$.ajax({
				url : "/sujuAccountList",
				dataType: "json",
				success : function(data){
					alert("거래처 조회성공");
					var jsonStr = JSON.stringify(data);
					alert("jsonStr->"+jsonStr);
					var html = "";
					var html2 = "";
					var pageStartNum = data.page.startPage;
					var pageEndNum = data.page.endPage;
					alert("pageStartNum -> "+ pageStartNum + "pageEndNum -> "+ pageEndNum);
					if(data.list.length > 0) {
						$.each(data.list, function(index, obj){
							html+="<tr>";
							html+="<td>"+obj.account_no+"</td>";
							html+="<td>"+obj.account_name+"</td>";
							html+="<td>"+obj.account_type+"</td>";
							html+="<td>"+obj.acc_telnum+"</td>";
							html+="<td>";
							html+="<input type='radio' name='radioBox' class='"+ index + "' value='"+obj.account_no+','+obj.account_name+"' required='required'>";
							html+="</td>";
							html+="</tr>";
						});
						
						$("#ajaxAccountList").html(html);
					}
					html2+= "<nav aria-label='Page navigation example'>";
					html2+= "<ul class='pagination justify-content-center' style='text-align: center;'>";
					for(var i = 1; i <= pageEndNum; i++){
						html2+= "<button type='button' class='page-link' id='page' style='margin: 10px;' onclick='pageNum(this)' value="+i+">"+i+"</button>";
					}
					html2+="</ul>";
					html2+="</nav>";
					$("#ajaxAccountPage").html(html2);
				},
				error : function(){
					alert("거래처 조회 실패");

				}
		});
	}
	
	function pageNum(value){
		var value = $(value).val();
		$.ajax({
			url : "/sujuAccountList?currentPage="+value,
			dataType: "json",
			success : function(data){
				var jsonStr = JSON.stringify(data);
				var html = "";
				var html2 = "";
				var pageStartNum = data.page.startPage;
				var pageEndNum = data.page.endPage;
				if(data.list.length > 0) {
					$.each(data.list, function(index, obj){
						html+="<tr>";
						html+="<td>"+obj.account_no+"</td>";
						html+="<td>"+obj.account_name+"</td>";
						html+="<td>"+obj.account_type+"</td>";
						html+="<td>"+obj.acc_telnum+"</td>";
						html+="<td>";
						html+="<input type='radio' name='radioBox' class='"+ index + "' value='"+obj.account_no+','+obj.account_name+"' required='required'>";
						html+="</td>";
						html+="</tr>";
					});
					
					$("#ajaxAccountList").html(html);
				}
				html2+= "<nav aria-label='Page navigation example'>";
				html2+= "<ul class='pagination justify-content-center' style='text-align: center;'>";
				for(var i = 1; i <= pageEndNum; i++){
					html2+= "<button type='button' class='page-link' id='page' style='margin: 10px;' onclick='pageNum(this)' value="+i+">"+i+"</button>";
				}
				html2+="</ul>";
				html2+="</nav>";
				$("#ajaxAccountPage").html(html2);
			},
			error : function(){
				alert("거래처 조회 실패");

			}		
		
		});
	};
	
	// 거래처 정보 넣기
	function selectAccount(){
		var accountInfo = $('input:radio[name="radioBox"]:checked').val();
		var account_no = accountInfo.split(',')[0];
		var account_name = accountInfo.split(',')[1];
		$('input[name=accountNo]').attr('value', account_no);
		$('input[name=accountName]').attr('value', account_name);
		$('#exampleModal').modal('hide');
	}
</script>
</head>
<body>
<div class="SujuContainer">
	<div style="color: green;" class="">
		<h1>
			<i class="bi bi-briefcase"></i>
			수주 등록
		</h1>
	</div>
	<form action="sujuSave">
	<div>
		<table class="table table-bordered Orders-first-table">
			<tr style="border: solid 1px ;">
				<th style="border: solid 1px ;">
				거래처
				</th>
				<td style="border: 1px solid;">
				<input type="text" name="accountName" id="accountName" readonly="readonly" size="1" style="width: 80%;">
				<input type="hidden" name="accountNo" id="accountNo">
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="accountList()">
					<i class="bi bi-search"></i>
				</button>
				</td>
				<th>
				수주일
				</th>
				<td>
				<input type="date" name="dates" style="width: 100%;"/>
				</td>
			</tr>
			<tr>
				<th>
					비고
				</th>
				<td colspan="3">
				<textarea rows="7" style="width: 100%; resize: none;"></textarea>
				</td>
			</tr>
		</table>
		<!-- =============Modal Start==================== -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content" style="width: 820px;">
					<div class="modal-header">
						<h4 class="modal-title" id="exampleModalLabel" style="border: 3px;">거래처 목록</h4>
						<button type="button" class="btn-close"
							data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="col-12 rounded-bottom overflow-auto bg-light p-3"  style="min-height: 550px;">
	
						<table class="table table-hover">
							<thead>
								<tr>
									<th>거래처코드</th>
									<th>거래처명</th>
									<th>거래처유형</th>
									<th>전화번호</th>
									<th>선택</th>
								</tr>
							</thead>
							<tbody id="ajaxAccountList">
							</tbody>
						</table>
						</div>
						<div id="ajaxAccountPage">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" onclick="selectAccount()">등록</button>
					</div>
				</div>
			</div>
		</div>
			<!-- =================Modal end====================== -->
	</div>
	<hr>
	<h2><i class="bi bi-list"></i> 상세 정보</h2>
	<div class="Orders-detail-item-button">
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="">
		품번 검색
		</button>
	</div>
	<div class="Orders-detail-content"> 
		<table class="table table-bordered Orders-second-table" >
			<thead>
			<tr>
				<th><input type="checkbox" ></th>
				<th>품번</th>
				<th>품명</th>
				<th>수주수량</th>
				<th><button style="padding: 0; border: none; font: inherit; color: inherit; background-color: transparent; cursor: pointer;">
						<i class="bi bi-plus-square-fill" style="font-size: 30px;"></i>
					</button>
				</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<th width="180">
					<input type="checkbox" >
				</th>
				<td width="180">
					<input type="text" name="item_no" id="item_no" readonly="readonly" size="1" style="width: 100%;">
				</td>
				<td width="180">
					<input type="text" name="item_name" id="item_name" readonly="readonly" size="1" style="width: 100%;">
				</td>
				<td width="180">
					<input type="number" name="suju_amount" id="suju_amount" >
				</td>
				<td width="180">
					<button style="padding: 0; border: none; font: inherit; color: inherit; background-color: transparent; cursor: pointer;">
						<i class="bi bi-dash-square-fill" style="font-size: 30px;"></i>
					</button>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
	</form>
</div>	
</body>
</html>