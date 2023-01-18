<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고실사 관리</title>
<style type="text/css">
	.stockContainer{
		padding-top: 50px;
		padding-left: 50px;
		padding-right: 50px;
		
	}
	
	
	.insertTblDiv {
		margin-bottom: 35px;
	}
	
	.stockPaging {
		margin-top: 20px;
	}
	
	.hrLine {
		margin-left : 20px;
		margin-right : 20px;
	}
	
	.pgnumclick {
		cursor: pointer;
	}

	.searchStock{
		padding-left: 20px;
		padding-right: 20px;
	
	}
	
	.table-responsive {
		margin-top: 30px;
		padding-left: 20px;
		padding-right: 20px;
	
	}
	
	.card {
		margin-top: 40px;
	}
	
	.realSearchTbl {
		text-align: center;
	}
	
	.selectFactory, .selectGubun{
		width : 120px;
	}
	
	.searchStock{
		display: flex;
		margin-top: 50px;
	}
	
	.searchStock input {
		margin-left: 8px;
		width : 130px;
	}
	
	.searchBtn {
		margin-left: 8px;
	}
	
	.card {
		margin-bottom : 50px;
	}
	.form-select {
		display : inline-block;
		cursor : pointer;
	}
	.form-control {
		display : inline-block;
	}
	
	.insertStockTbl {
		text-align: center;
	}
	
	
	.itemName {
		width: 305px;
	}
	
	.DBCnt {
		width : 80px;
	}
	
	.factorySelect {
		width : 125px;
	}
	
	.itemSelect, .updateItemSelect {
		width : 125px;
	}
	
	.realStockCnt {
		width : 90px;
	}
	
	.emp_name {
		width : 85px;
	}
	.emp_no {
		width : 90px;
	}
	
	.subul_note{
		width : 100px;
	}
	.dropdown .gubunText {
		color : #696cff;
		font-weight: bold;
	}
	
	.dropdown-item {
		cursor: pointer;
	}
	
	
</style>
</head>
<body>
	<div class="stockContainer">
		<h1 class="display-3">재고실사 관리</h1>
		<!-- 검색 옵션 영역 -->
		<div class="card">
			<div class="searchStock row">
				<div class="col-sm-6">
					<!-- 공장선택 -->
					<select class='form-select selectFactory' id="searchFactory">
					</select>
					
					<!-- 상태선택 -->
					<select class='form-select selectGubun' id="searchGubun">
						<option value="">상태선택</option>
						<option value="재고실사">재고실사</option>
						<option value="임시실사">임시실사</option>
					</select>  
					
					<!-- 날짜선택 -->
					<input class="form-control" type="date" value="" id="startDate" max="">
					<input class="form-control" type="date" value="" id="endDate" max="">
					
					<button type="button" class="btn btn-primary searchBtn" onclick="selectStockTakingList()">검색</button>
				</div>
				
				<!-- 행 추가 -->
				<div class="col-sm-6" style="text-align : right;">
					<button type="button" class="btn rounded-pill btn-primary" id="plusBtn" onclick="addRow()"><strong>+</strong></button>
				</div>
				
			</div>
			<!-- 재고실사 데이터 등록 -->
			<form action="${pageContext.request.contextPath }/user/stocktaking/insertStockTaking" name="insertForm" method="post">
					<div class="table-responsive text-nowrap insertTblDiv">
						<table class="table insertStockTbl" id="stockInsertTbl">
							<thead>
								<tr>
									<th>실사일자</th>
									<th>공장</th>
									<th>품번</th>
									<th>품명</th>
									<th>창고수량</th>
									<th>실사수량</th>
									<th>승인자</th>
									<th>비고</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody class="table-border-bottom-0"  id="insertStockTbl">
								
							</tbody>
						
						</table>
					
					</div>
					
			</form>
		</div>
			
			<div class="card">
			<!-- 검색결과 영역 -->
				<div class="table-responsive text-nowrap">
					<table class="table realSearchTbl">
						<thead>
							<tr>
								<th>요청번호</th>
								<th>실사일자</th>
								<th>공장</th>
								<th>품번</th>
								<th>품명</th>
								<th>창고수량</th>
								<th>실사수량</th>
								<th>차이량</th>
								<th>승인자</th>
								<th>비고</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody class="table-border-bottom-0"  id="realStockTbl">
							
						</tbody>
					
					</table>
				
				</div>
		
		
			<!-- 페이지 영역 -->
			<nav aria-label="Page navigation" class="stockPaging">
		    	<ul class="pagination justify-content-center" id="stockTakingPaginationUl">
		    	
				</ul>
			</nav>
		</div>
	</div> <!-- stockContainer 끝 -->
	
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

///전역변수들 모음///
let currentPage = 1;

let factoryList = [
	<c:forEach items="${factoryList}" var="factory">
		{ 
			factory_no : '${factory.factory_no}' 
			, factory_name : '${factory.factory_name}'
		},
	</c:forEach>
];

let itemList = [
	<c:forEach items="${itemList}" var="item">
		{ 
			item_no : '${item.item_no}' 
			, factory_no : '${item.factory_no}'
			, item_Name : '${item.item_name}'
		},
	</c:forEach>
]

$(function () {
	initPage();
	console.log("세션"+'${emp_no}');
})

// 항상 실행해야할 함수
function initPage () {
	//검색폼 - 공장 셀렉트 업데이트
	$('#searchFactory').html(makeFactorySelect());
	//검색폼 - 날짜 일주일전~오늘
	initSearchDate();
	pageHere();
}


//페이지 강조처리
function pageHere() {
	
	$('.pgnum'+currentPage).addClass('active');
	
}


// 검색 관련
// 공장 선택 옵션 만들어주기
function makeFactorySelect() {
	
	let innerHtml = `<option value="">공장선택</option>`;
	
	factoryList.forEach((item) => {
		innerHtml += `<option value="\${item.factory_no}">\${item.factory_name}</option>`
	})
	
	return innerHtml;
}

// 날짜 폼
function initSearchDate () {
	let today = new Date();
	let aWeekAgo = new Date(today);
	aWeekAgo.setDate(today.getDate() -7);
	
	let startDate = aWeekAgo.getFullYear()+'-'+('0'+(aWeekAgo.getMonth()+1)).slice(-2)+'-'+('0'+aWeekAgo.getDate()).slice(-2);
	let endDate = today.getFullYear()+'-'+('0'+(today.getMonth()+1)).slice(-2)+'-'+('0'+today.getDate()).slice(-2);
	
	// 날짜 선택 옵션에 value, 속성 추가하기
	$('#startDate').val(startDate);
	$('#startDate').prop('max',endDate);
	$('#endDate').val(endDate);
	$('#endDate').prop('max', endDate);

}


// 행 추가 랜더링 함수
function addRow() {
	
	let table = document.getElementById('insertStockTbl');
	
	let today = new Date();
	let sysdate = today.getFullYear()+'-'+('0'+(today.getMonth()+1)).slice(-2)+'-'+('0'+today.getDate()).slice(-2);
	
	let newRow = table.insertRow(0);
	
	let newCellDate= newRow.insertCell(0);
	let newCellFacotry = newRow.insertCell(1);
	let newCellItem = newRow.insertCell(2);
	let newCellItemName = newRow.insertCell(3);
	let newCellDBCnt = newRow.insertCell(4);
	let newCellStockCnt = newRow.insertCell(5);
	//let newCellDiff = newRow.insertCell(6);
	let newCellMember = newRow.insertCell(6);
	let newCellMemo = newRow.insertCell(7);
	let newCellStat = newRow.insertCell(8);
	
	newCellDate.innerText = sysdate;
	newCellFacotry.innerHTML = "<select id='factorySelectI' class='form-select factorySelect' name='factory_no' onchange='getFactoryNo(this)'>"+makeFactorySelect()+"</select>";
	newCellItem.innerHTML = "<select id='itemSelectI' class='form-select itemSelect' name='item_no' onchange='getItemNo(this)' disabled><option value=''>품번선택</option></select>";
	newCellItemName.innerHTML = "<input type='text' name='item_name' id='itemNameI' class='form-control itemName' value='' readOnly='readOnly' placeholder='품번을 선택해주세요.'>";
	newCellDBCnt.innerHTML = "<input type='number' min='0' name='db_amount' id='DBCntI' class='form-control DBCnt' value=''readOnly='readOnly'>";
	newCellStockCnt.innerHTML = "<input type='number' min='0' name='amount' id='realStockCntI' class='form-control realStockCnt' value=''>";
	//newCellDiff.innerHTML = "<input type='number' min='0' name='dfCnt' id='dfCnt' class='form-control' value=''>"
	newCellMember.innerHTML = "<input type='hidden' name='emp_no' class='form-control emp_no' value='${emp_no}'><input type='text' id='emp_noI' class='form-control emp_no' value='${emp_name}' readOnly='readOnly'>"
	newCellMemo.innerHTML = "<input type='text' name='subul_note' id='memoI' class='form-control' value=''>";
	newCellStat.innerHTML = "<button type='button' class='btn btn-secondary' onclick='return insertTempSilsa(this.form);'>저장</button> <button type='button' class='btn btn-primary' onclick='insertSubulStockTaking()'>승인</button>"
	
	if($('#stockInsertTbl >tbody tr').length == 1) {
		$('#plusBtn').hide();
	}
	
}

// 값을 모두 입력했는지 Validation 체크 함수
function isAllEnter() {
	
	if(!$('#factorySelectI>option:selected').val()) {
		alert('공장을 선택해주세요.');
		$('#factorySelectI').focus();
		return false;
	}
	
	if(!$('#itemSelectI>option:selected').val()) {
		alert('품번을 선택해주세요.');
		$('#itemSelectI').focus();
		return false;
	}
	
	if(!$('#realStockCntI').val()) {
		alert('수량을 입력해주세요.');
		$('#realStockCntI').focus();
		return false;
	}
	
	return true;
}

// 수불부에 '재고실사'로 등록하기
function insertSubulStockTaking(){
	
	if(!isAllEnter()) {
   		return false;
   	} 
	
	let isConfirm = confirm('재고실사값을 등록하시겠습니까?');
	
	if(isConfirm){
		
		insertForm.submit();
		alert('등록이 완료되었습니다.');
		
	} else {
		alert('등록이 취소되었습니다.');
	}
}


// 수불부에 '임시실사'로 등록하기
// 왠지 같은 함수에서 처리할 수 있을거 같음...보완 필요
function insertTempSilsa(frm) {
	

	if(!isAllEnter()) {
   		return false;
   	} 
	
	let insertConfirm = confirm('임시실사값을 등록하시겠습니까?');
	
	if(insertConfirm){
		
		frm.action='${pageContext.request.contextPath }/user/stocktaking/insertTempSilsa'
		frm.submit();
		alert('등록이 완료되었습니다.');
		return true;
		
	} else {
		alert('등록이 취소되었습니다.');
	}
	
}

// 상품 select 랜더링을 위한 공장 코드 value가져오고 -> 품번 option 만드는 함수 호출
function getFactoryNo(target, subul_num) {
	
	let factory_no = target.value;

	$.ajax({
		
		url:"${pageContext.request.contextPath }/user/stocktaking/itemSelect",
		data: {factory_no},
		dataType: "json",
		success: function(result) {
			if(subul_num) {
				$("#itemNameU"+subul_num).val('');
				$("#DBCntU"+subul_num).val(''); 
			} else {
				$("#itemNameI").val('');
				$("#DBCntI").val(''); 
			}
			makeItemSelect(result,target)
			
		}
		
	});
	
}

// 공장 코드 선택에 따른 상품 select 랜더링
function makeItemSelect(data,target) {
	
	let targetItemSelect;
	if($(target).attr('id') == 'factorySelectI') {
		targetItemSelect = $('#itemSelectI')
	} else {
		let subul_num = $(target).attr('id').substring(14);
		targetItemSelect = $('#itemSelectU'+subul_num)
	}
	
	$(targetItemSelect).empty();
	
	let innerHtml = `<option value="">품번선택</option>`;

	if(data != null) {
		
		$(targetItemSelect).removeAttr('disabled');
		for(let datum of data) {
			innerHtml += `<option value="\${datum.item_no}">\${datum.item_no}</option>`
		}
	} 
	
	$(targetItemSelect).append(innerHtml);
}

// 상품코드로부터 상품이름, 창고재고값 가져오기
function getItemNo(target) {
		
	let targetItemName;
	let targetDBCnt;
	if($(target).attr('id') == 'itemSelectI') {
		targetItemName = $('#itemNameI');
		targetDBCnt = $('#DBCntI');
	} else {
		let subul_num = $(target).attr('id').substring(11);
		targetItemName = $('#itemNameU'+subul_num);
		targetDBCnt = $('#DBCntU'+subul_num);
	}
	
	let item_no = target.value;
	
	$.ajax({
		
		url:"${pageContext.request.contextPath }/user/stocktaking/selectItemInfo",
		data: {item_no},
		dataType: "json",
		success: function(result){
			$(targetItemName).val(result.item_name);
			$(targetDBCnt).val(result.stock_count);
		}
		
	});
}

// '임시실사' dropdown 수정 버튼 눌렀을 때 input박스 만드는 함수
function openUpdateTempSilsa(target) {
	
	let targetTr = $(target).closest('tr');
	let targetTd = targetTr.children();
	console.log(targetTr);
	
	let subul_num = targetTr.find('.subul_num').val();
	let amount = targetTr.find('.amount').val();
	let factory_no = targetTr.find('.factory_no').val();
	let item_no = targetTr.find('.item_no').val();
	let item_name = targetTr.find('.item_name').val();
	let db_amount = targetTr.find('.db_amount').val();
	let subul_note = targetTr.find('.subul_note').val();
	let gubun = targetTr.find('.gubunText').text();
	
	for(let i = 2; i<11 ; i++) {
		targetTd.eq(i).empty();
	}
	
	let itemOptionHtml =''
	itemList.forEach(el=>{
		if(el.factory_no == factory_no) {
			itemOptionHtml += `<option value='\${el.item_no}'`
			if(el.item_no == item_no) {
				itemOptionHtml += ` selected `
			}
			itemOptionHtml += `>\${el.item_no}</option>`
		}
	})
	
	targetTd.eq(2).append("<select id='factorySelectU"+ subul_num +"' class='form-select factorySelect' name='factory_no' onchange='getFactoryNo(this,"+subul_num+")'>"+makeFactorySelect()+"</select>");
	targetTd.eq(3).append("<select id='itemSelectU"+subul_num+"' class='form-select updateItemSelect' name='item_no' onchange='getItemNo(this)'><option value=''>품번선택</option>"+itemOptionHtml+"</select>");
	targetTd.eq(4).append("<input type='text' name='item_name' id='itemNameU"+ subul_num +"' class='form-control itemName' value='"+ item_name +"' readOnly='readOnly' placeholder='품번을 선택해주세요.'>");
	targetTd.eq(5).append("<input type='number' min='0' name='db_amount' id='DBCntU"+ subul_num +"' class='form-control DBCnt' value='"+ db_amount +"'readOnly='readOnly'>");
	targetTd.eq(6).append("<input type='number' min='0' name='amount' id='realStockCntU"+ subul_num +"' class='form-control realStockCnt' value='"+amount+"'>");
	targetTd.eq(7).append("-");	
	targetTd.eq(8).append("<input type='hidden' name='emp_no' id='updateEmp_no' class='form-control emp_no' value='${emp_no}'> <input type='text' name='emp_name' id='updateEmp_name' class='form-control emp_name' value='${emp_name}' readOnly='readOnly'>");
	targetTd.eq(9).append("<input type='text' name='subul_note' id='updateMemo' class='form-control subul_note' value='"+subul_note+"'>");
	targetTd.eq(10).append("<button type='button' class='btn btn-secondary' onclick='undoUpdate()'>취소</button> <button type='button' class='btn btn-primary' onclick='updateTempSilsa(this)'>수정</button>");
	
	$('#factorySelectU'+subul_num).find('option[value='+factory_no+']').attr('selected', 'selected');
	
}

function isUpdateAllEnter() {
	
	if(!$('.factorySelect>option:selected').val()) {
		alert('공장을 선택해주세요.');
		$('.factorySelect').focus();
		return false;
	}
	
	if(!$('.updateItemSelect>option:selected').val()) {
		alert('품번을 선택해주세요.');
		$('.updateItemSelect').focus();
		return false;
	}
	
	if(!$('.realStockCnt').val()) {
		alert('수량을 입력해주세요.');
		$('.realStockCnt').focus();
		return false;
	}
	
}


//'임시실사' 데이터 수정 함수
function updateTempSilsa(data) {
	
	if(!isUpdateAllEnter()) {
   		return false;
   	} 
	
	let targetTr = $(data).closest('tr');
	
	let item_no = targetTr.find('.updateItemSelect').val();
	let amount = targetTr.find('.realStockCnt').val();
	let emp_no = targetTr.find('#updateEmp_no').val();
	let subul_note = targetTr.find('#updateMemo').val();
	let subul_num = targetTr.find('.subul_num').val();
	
	if(!confirm("변경사항을 적용하시겠습니까?")) {
		alert("수정이 취소되었습니다.")
		return false;
	} else {
		
		$.ajax({
			
			url:"${pageContext.request.contextPath }/user/stocktaking/updateTempSilsa",
			data:{subul_num, item_no, amount, emp_no, subul_note},
			type:"post",
			dataType:"json",
			success: function(result){
				
				if(result == 1) {
					
					alert("수정이 완료되었습니다.");
					selectStockTakingList();
				} else {
					
					alert("수정에 실패하였습니다.");
				}
				
			}
			
		});
		
	}
}


//취소 함수
function undoUpdate() {
	
	if(!confirm("변경사항을 취소하시겠습니까?")){
		return false;
	} else {
		alert("수정이 취소되었습니다.")
		selectStockTakingList();
	}
}

//'임시실사' 데이터 삭제 함수
function deleteTempSilsa(target) {
	
	let targetTr = $(target).closest('tr');
	
	let subul_num = targetTr.find('.subul_num').val();
	
	let deleteConfirm = confirm('해당 임시실사 데이터를 삭제하시겠습니까?');
	
	if (deleteConfirm) {
		
		$.ajax({
			
			url:"${pageContext.request.contextPath }/user/stocktaking/deleteTempSilsa",
			data:{subul_num},
			dataType:"json",
			success: function(result){
				
				if (result == 1) {
					alert('삭제가 완료되었습니다.')
					selectStockTakingList();
				}
				
			}
		}); 
		
	} else {
		alert('삭제가 취소되었습니다.');
		return false;
	}
 	
	
}

//'임시실사' 데이터 승인 함수
function updateTempSilsaGubun(target) {
	
	let targetTr = $(target).closest('tr');
	
	let subul_num = targetTr.find('.subul_num').val();
	let amount = targetTr.find('.amount').val();
	let item_no = targetTr.find('.item_no').val();
	let factory_no = targetTr.find('.factory_no').val();
	
	let updateConfirm = confirm('해당 임시실사 데이터를 승인하시겠습니까?');
	
 	if(updateConfirm) {
		
 		$.ajax({
			
			url:"${pageContext.request.contextPath }/user/stocktaking/updateTempSilsaGubun",
			data: {subul_num, amount, item_no, factory_no},
			type: 'post',
			dataType:"json",
			success: function(result) {
				if (result == 1){
					alert('승인 완료 되었습니다.');
					selectStockTakingList();
				}
			
			},error : function (err) {
				console.error(err)
			}
		
	});
		
	} else {
		
		alert('승인이 취소되었습니다.');
		return false;
		
	}
	 
	
}



// 검색목록 테이블 랜더링
function makeTable (data) {
	
	let reqNo = 1;
	let innerHtml = ``
	
	for(let datum of data) {
		innerHtml += `
			<tr>
				<td>
					<input type="hidden" class="subul_num" value="\${datum.subul_num}">
					\${datum.subul_num}
				</td>
				<td>
					<input type="hidden" class="subul_date" value="\${datum.subul_date}">
					\${datum.subul_date}
				</td>
				<td>
					<input type="hidden"  class="factory_no" value="\${datum.factory_no}">
					\${datum.factory_name}
				</td>
				<td>
					<input type="hidden" class="item_no" value="\${datum.item_no}">
					\${datum.item_no}
				</td>
				<td>
					<input type="hidden"  class="item_name" value="\${datum.item_name}">
					\${datum.item_name}
				</td>
				<td>
					<input type="hidden" class="db_amount" value="\${datum.db_amount}">`;
					if(datum.db_amount == null) {
						innerHtml+= `-`;
					} else {
						innerHtml+= `\${datum.db_amount}`;
					}
				innerHtml +=`	
				</td>
				<td>
					<input type="hidden" class="amount" value="\${datum.amount}">
					\${datum.amount}
				</td>
				<td>
					<input type="hidden" class="diff_amount" value="\${datum.amount - datum.db_amount}">
					\${datum.amount - datum.db_amount}
				</td>
				<td>
					<input type="hidden" class="emp_no" value="\${datum.emp_no}">
					\${datum.emp_name}
				</td>
				<td>
					<input type="hidden" class="subul_note" value="\${datum.subul_note}">
					\${datum.subul_note}
				</td>
				<td class="gubun"> `;
					if(datum.gubun == '임시실사') {
						
						innerHtml += `
						<div class="dropdown"> 
							<a class="btn p-0 dropdown-toggle hide-arrow gubunText" data-bs-toggle="dropdown">\${datum.gubun}</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" onclick="updateTempSilsaGubun(this)"><i class='bx bx-check me-1'></i> 승인 </a>
	                            <a class="dropdown-item" onclick="openUpdateTempSilsa(this)" ><i class="bx bx-edit-alt me-1"></i> 수정 </a>
	                            <a class="dropdown-item" onclick="deleteTempSilsa(this)"><i class="bx bx-trash me-1"></i> 삭제 </a>
                         	</div>
						</div> `;
						
					} else {
						innerHtml += `\${datum.gubun} `;
					}
				innerHtml += `</td>
							</tr>`;
							
				reqNo++;
	}
	
	$('#realStockTbl').html(innerHtml);
	
}

/// 페이지 처리용 함수들 ///
// 다른 페이지 누르면 그 페이지 값을 가져오기 위한 함수
function changePage(e, page) {
	// a태그 기본 작동을 막기 위한 함수
	e.preventDefault();
	// 선택한 페이지 넘버값을 받아서 전역변수 currentPage에 담는다.
	currentPage = page;
	// 목록 가져오기
	selectStockTakingList();

}

// 페이징 만듦
function makePaginationLi(pageData){
	
	let innerHTML = ``;
	
	innerHTML += `
		<li class="page-item prev">
		`
	    if(pageData.startPage == 1) {
			innerHTML += `<a class="page-link" onclick="return false;">`
		    // 첫 1~5페이지에서 [<] 키가 작동하지 않도록함 
	    } else {
	    	innerHTML += ` <a class="page-link" onclick="changePage(event,\${pageData.startPage - 1})">`
	    }
	    
		innerHTML += `
	           <i class="tf-icon bx bx-chevrons-left"></i>
	       </a>
		</li>
		`
		
		for( let i = pageData.startPage; i <= pageData.endPage ; i++) {
			innerHTML += `
				<li class="page-item pgnumclick pgnum\${i}">
					<a class="page-link" onclick="changePage(event,\${i})">\${i}</a>
				</li>
			`
		}
		
		innerHTML += `<li class="page-item next">`
		if(pageData.endPage == pageData.totalPage){
			innerHTML += `<a class="page-link" onclick="return false;">`
			// 마지막 PageBlock에서  [>] 버튼이 작동하지 않도록 함
		} else {
			innerHTML += `<a class="page-link" onclick="changePage(event,\${pageData.endPage + 1})">`
		}
		
		innerHTML += `
				<i class="tf-icon bx bx-chevrons-right"></i>
			</a>
		</li>
	   `
		//
		$('#stockTakingPaginationUl').html(innerHTML)
	
}

// 옵션에 맞는 결과 조회 함수
function selectStockTakingList() {
	
	let startDate = $('#startDate').val();
	let endDate = $('#endDate').val();
	
	//선택된 공장 번호 가져오기
	let factory_no = $('#searchFactory option:selected').val()
	let gubun = $('#searchGubun option:selected').val()
	
	$.ajax({
		
		url:"${pageContext.request.contextPath }/user/stocktaking/search",
		data: {
			startDate, endDate, factory_no, gubun, currentPage //전역변수 //
		},
		dataType: "json",
		success: function(result){
			makeTable(result.stockTakingList);
			makePaginationLi(result.page);
		
		}
		
	});
	
}
</script>
</html>