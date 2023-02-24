<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- bootStrap Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input[type=checkbox] {
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

.Orders-first-table, .Orders-second-table {
	width: 1480px;
	text-align: center;
}
.table-hover
:not
(
.SujuContainer
 
table
)


</style>
<script type="text/javascript">
	// 유효성 검사
	function submitCheck(f){
		var suju_date = $("#suju_date").val();
		var last_date = $("#last_date").val();
		var today = new Date();
		suju_date = new Date(suju_date);
		last_date = new Date(last_date);

		if(isNaN(suju_date) || isNaN(last_date)){
			alert("날짜를 선택해주세요.");
			return false;
		} else if(suju_date > today){
			alert("수주일을 다시 확인해주세요.");
			} else if(last_date < today ){
				alert("마감일 다시 확인해주세요.");
			} else {
				 $(".itemList").each(
							function(index, item) {
								$(this).attr("name", "ordersDetailDTOs["+index+"].item_no")
								});
				 $(".itemList2").each(
							function(index, item) {
								$(this).attr("name", "ordersDetailDTOs["+index+"].item_name")
								});
				 $(".itemList3").each(
							function(index, item) {
								$(this).attr("name", "ordersDetailDTOs["+index+"].suju_amount")
								});
				$("#ajaxAccountList").empty();
				$("#ajaxItemList").empty();
				return true;
			}
	}

	// 거래처 리스트
	function accountList() {
		alert("거래처 조회시작");
		$
				.ajax({
					url : "/sujuAccountList",
					dataType : "json",
					success : function(data) {
						var jsonStr = JSON.stringify(data);
						var html = "";
						var html2 = "";
						var pageStartNum = data.page.startPage;
						var pageEndNum = data.page.endPage;
						if (data.list.length > 0) {
							$
									.each(
											data.list,
											function(index, obj) {
												html += "<tr>";
												html += "<td>" + obj.account_no
														+ "</td>";
												html += "<td>"
														+ obj.account_name
														+ "</td>";
												html += "<td>"
														+ obj.account_type
														+ "</td>";
												html += "<td>" + obj.acc_telnum
														+ "</td>";
												html += "<td>";
												html += "<input type='radio' name='radioBox' class='"+ index + "' value='"+obj.account_no+','+obj.account_name+"'>";
												html += "</td>";
												html += "</tr>";
											});

							$("#ajaxAccountList").html(html);
						}
						html2 += "<nav aria-label='Page navigation example'>";
						html2 += "<ul class='pagination justify-content-center' style='text-align: center;'>";
						for (var i = 1; i <= pageEndNum; i++) {
							html2 += "<button type='button' class='page-link' style='margin: 10px;' onclick='pageNum(this)' value="
									+ i + ">" + i + "</button>";
						}
						html2 += "</ul>";
						html2 += "</nav>";
						$("#ajaxAccountPage").html(html2);
					},
					error : function() {
						alert("거래처 조회 실패");

					}
				});
	}

	// 거래처 페이징
	function pageNum(value) {
		var value = $(value).val();
		$
				.ajax({
					url : "/sujuAccountList?currentPage=" + value,
					dataType : "json",
					success : function(data) {
						var html = "";
						var html2 = "";
						var pageStartNum = data.page.startPage;
						var pageEndNum = data.page.endPage;
						if (data.list.length > 0) {
							$
									.each(
											data.list,
											function(index, obj) {
												html += "<tr>";
												html += "<td>" + obj.account_no
														+ "</td>";
												html += "<td>"
														+ obj.account_name
														+ "</td>";
												html += "<td>"
														+ obj.account_type
														+ "</td>";
												html += "<td>" + obj.acc_telnum
														+ "</td>";
												html += "<td>";
												html += "<input type='radio' name='radioBox' class='"+ index + "' value='"+obj.account_no+','+obj.account_name+"'>";
												html += "</td>";
												html += "</tr>";
											});

							$("#ajaxAccountList").html(html);
						}
						html2 += "<nav aria-label='Page navigation example'>";
						html2 += "<ul class='pagination justify-content-center' style='text-align: center;'>";
						for (var i = 1; i <= pageEndNum; i++) {
							html2 += "<button type='button' class='page-link' id='page' style='margin: 10px;' onclick='pageNum(this)' value="
									+ i + ">" + i + "</button>";
						}
						html2 += "</ul>";
						html2 += "</nav>";
						$("#ajaxAccountPage").html(html2);
					},
					error : function() {
						alert("거래처 조회 실패");

					}

				});
	};

	// 거래처 정보 넣기
	function selectAccount() {
		var accountInfo = $('input:radio[name="radioBox"]:checked').val();
		var account_no = accountInfo.split(',')[0];
		var account_name = accountInfo.split(',')[1];
		$('input[name=account_no]').attr('value', account_no);
		$('input[name=account_name]').attr('value', account_name);
		$('#exampleModal').modal('hide');
	}

	// 품목 조회
	function itemList() {
		if (!($("#ajaxItemList tr").html())) {
			$
					.ajax({
						url : "/sujuItemList",
						dataType : "json",
						success : function(data) {
							var jsonStr2 = JSON.stringify(data);
							var html3 = "";
							if (data.length > 0) {
								$.each(
												data,
												function(index, obj) {
													html3 += "<tr>";
													html3 += "<td>"
															+ obj.item_no
															+ "</td>";
													html3 += "<td>"
															+ obj.hs_code
															+ "</td>";
													html3 += "<td>"
															+ obj.item_name
															+ "</td>";
													html3 += "<td>"
															+ obj.item_check
															+ "</td>";
													html3 += "<td>";
													if (obj.item_check == "생산 중단") {
														html3 += "<input type='checkbox' name='checkbox2' class='"+ index + "' value='"+obj.item_no+','+obj.item_name+"'  disabled='disabled'>";
													} else {
														html3 += "<input type='checkbox' name='checkbox2' class='"+ index + "' value='"+obj.item_no+','+obj.item_name+"'>";
													}
													html3 += "</td>";
													html3 += "</tr>";
												});

								$("#ajaxItemList").html(html3);
							}
						},
						error : function() {
							alert("품목 조회 실패");
						}
					});
		} else {
		}

	}

	// 품목 정보 생성
	function selectItem() {

		var selectItem = [];
		$('.itemList').each(function(index, item) {
			selectItem.push($(item).val());

		});
		$('input:checkbox[name="checkbox2"]:checked')
				.each(
						function(index, item) {
							$(item).val();
							var itemInfo = $(item).val();

							var item_no = itemInfo.split(',')[0];
							var item_name = itemInfo.split(',')[1];
							if ($.inArray(item_no, selectItem) != -1) {
								selectItem.splice($
										.inArray(item_no, selectItem), 1);
							} else {
								var html4 = "<tr id='"+item_no+"'><td width='180'>"
										+ "<input type='text' id='ordersDetailDTOs.item_no' class='itemList' readonly='readonly' size='1' style='width: 100%;' value='"
										+ item_no
										+ "'>"
										+ "</td><td width='180'><input type='text'  id='ordersDetailDTOs.item_name' class='itemList2' readonly='readonly' size='1' style='width: 100%;' value='"
										+ item_name
										+ "'>"
										+ "</td><td width='180'><input type='number'  id='ordersDetailDTOs.suju_amount' class='itemList3' required = 'required' ></td>";
								$('#itemselect').append(html4);
							}

						});
		for (var i = 0; i < selectItem.length; i++) {
			$('#' + selectItem[i]).remove();
		}
		$('#exampleModal2').modal('hide');

	}
</script>
</head>
<body>
	<div class="SujuContainer container-xxl flex-grow-1 container-p-y">
		<div class="SujuContainer-title" style="position: relative; right: 120px; margin-bottom: 30px;">
			<h1>
				<i class="bi bi-briefcase"></i> 수주 수정
			</h1>
		</div>
		<form action="/user/sujuModify" onsubmit="return submitCheck(this)" method="post">
<input type="hidden" id="emp_no" name="emp_no" value="${ordersDTO.emp_no }">
			<input type="hidden" id="emp_name" name="emp_name" value="${ordersDTO.emp_name }">
			<input type="hidden" id="suju_no" name="suju_no" value="${ordersDTO.suju_no }">
			<div class="card">
				<div class="card-body">
					<div class="table-responsive text-nowrap">
				<table class="table table-bordered">
					<tr >
						<th style="width: 100px;">거래처</th>
						<td nowrap style="width: 300px;">
						<input type="text" name="account_name" id="account_name" readonly="readonly" size="1"
							   style="width: 80%;" required="required" value="${ordersDTO.account_name }"> 
						<input type="hidden" name="account_no" id="account_no" value="${ordersDTO.account_no }">
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#exampleModal"
								onclick="accountList()">
								<i class="bi bi-search"></i>
							</button></td>
						<th style="width: 100px;">수주일</th>
						<td style="width: 300px;"><input type="date" id="suju_date" name="suju_date" style="width: 100%;" value="${ordersDTO.suju_date }"/></td>
						<th style="width: 100px;">마감일</th>
						<td style="width: 300px;"><input type="date" id="last_date" name="last_date" style="width: 100%;" value="${ordersDTO.last_date }"/></td>
					</tr>
					<tr>
						<th>비고</th>
						<td colspan="5"><textarea rows="7"
								style="width: 100%; resize: none;" id="order_note" name="order_note">${ordersDTO.order_note }</textarea></td>
					</tr>
				</table>
					</div>
				</div>
			</div>
				<!-- =============Modal Start==================== -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content" style="width: 820px;">
							<div class="modal-header">
								<h4 class="modal-title" id="exampleModalLabel"
									style="border: 3px;">거래처 목록</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="col-12 rounded-bottom overflow-auto bg-light p-3"
									style="min-height: 550px;">

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
								<div id="ajaxAccountPage"></div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary"
									onclick="selectAccount()">등록</button>
							</div>
						</div>
					</div>
				</div>
				<!-- =================Modal end====================== -->
			<hr class="my-5">
			<div style="position: relative; right: 120px; margin-bottom: 30px;">
				<h2><i class="bi bi-list-check"></i> 상세 정보
					<button type="button"
						style="padding: 0; border: none; font: inherit; color: inherit; background-color: transparent; cursor: pointer;"
						data-bs-toggle="modal" data-bs-target="#exampleModal2"
						onclick="itemList()">
						<i class="bi bi-plus-square-fill" style="font-size: 30px;"></i>
					</button>
				</h2>
			</div>
			<!-- =============Modal Start==================== -->
			<div class="modal fade" id="exampleModal2" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content" style="width: 820px;">
						<div class="modal-header">
							<h4 class="modal-title" id="exampleModalLabel"
								style="border: 3px;">거래처 목록</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="col-12 rounded-bottom overflow-auto bg-light p-3"
								style="min-height: 550px;">

								<table class="table table-hover">
									<thead>
										<tr>
											<th>품번</th>
											<th>HS코드</th>
											<th>품명</th>
											<th>생산 여부</th>
											<th>선택</th>
										</tr>
									</thead>
									<tbody id="ajaxItemList">
									</tbody>
								</table>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary"
								onclick="selectItem()">등록</button>
						</div>
					</div>
				</div>
				<!-- =================Modal end====================== -->
			</div>
			<div class="Orders-detail-content card" >
				<div class="table-responsive text-nowrap" style="overflow-y: hidden">
					<table class="table" style="text-align: center;">
						<thead>
							<tr>
								<th style="width: 200px;">품번</th>
								<th>품명</th>
								<th style="width: 200px;">수주수량</th>
							</tr>
						</thead>
						<tbody id="itemselect" class="table-border-bottom-0">
							<c:forEach var="orders" items="${ordersDTO.ordersDetailDTOs }">
								<tr id="${orders.item_no }">
									<td width="180">
										<input type="text" id="ordersDetailDTOs.item_no" class="itemList" readonly="readonly" size="1" style="width: 100%;" value="${orders.item_no }">
									</td>
									<td width="180">
										<input type="text" id="ordersDetailDTOs.item_name" class="itemList2" readonly="readonly" size="1" style="width: 100%;" value="${orders.item_name }">
									</td>
									<td width="180">
										<input type="number" id="ordersDetailDTOs.suju_amount" class="itemList3" required="required" value="${orders.suju_amount }">
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div style="position: relative; float: right; margin-top: 30px;">
			<button type="submit" class="btn btn-outline-primary btn-lg" >수정</button>
			</div>
		</form>
	</div>
</body>
</html>