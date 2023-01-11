<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.stockContainer{
		padding-top: 50px;
		padding-left: 50px;
		padding-right: 50px;
		
	}

	.card {
		margin-top: 20px;
	}
	
	.realStockTbl, .realSearchTbl {
		text-align: center;
	}
	
	.selectFactory {
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
	
	.itemSelect {
		width : 125px;
	}
	
	.realStockCnt {
		width : 90px;
	}
	
	.emp_no {
		width : 90px;
	}
	
	.dropdown .gubunText {
		color : blue;
	}
</style>
</head>
<body>
	<div class="stockContainer">
		<h1 class="display-3">재고실사 관리</h1>
		<div class="searchStock row">
			<div class="col-sm-6">
				<select class='form-select selectFactory' id="searchFactory"></select>
				<input class="form-control" type="date" value="" id="startDate">
				<input class="form-control" type="date" value="" id="endDate">
				
				<button type="button" class="btn btn-info searchBtn" onclick="selectStockTakingList()">검색</button>
			</div>
			
			<div class="col-sm-6" style="text-align : right;">
				<button type="button" class="btn rounded-pill btn-info" onclick="addRow()"><strong>+</strong></button>
			</div>
			
		</div>
		
		<form action="${pageContext.request.contextPath }/stocktaking/insertStockTaking" name="insertForm" method="post">
			<div class="card">
				<div class="table-responsive text-nowrap">
					<table class="table table-bordered insertStockTbl">
						<thead>
							<tr>
								<th>실사일자</th>
								<th>공장</th>
								<th>품번</th>
								<th>품명</th>
								<th>창고수량</th>
								<th>실사수량</th>
								<!-- <th>차이량</th> -->
								<th>승인자</th>
								<th>비고</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody class="table-border-bottom-0"  id="insertStockTbl">
							
						</tbody>
					
					</table>
				
				</div>
			
			</div>
		</form>
		
		
		<div class="card">
			<div class="table-responsive text-nowrap">
				<table class="table table-bordered realSearchTbl">
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
	
	</div>
	
	<nav aria-label="Page navigation">
    	<ul class="pagination justify-content-center" id="stockTakingPaginationUl">
    	
		</ul>
	</nav>
		

	
	</div>
	
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

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
})

function initPage () {
	//검색폼 - 공장 셀렉트 업데이트
	$('#searchFactory').html(makeFactorySelect());
	//검색폼 - 날짜 일주일전~오늘
	initSearchDate();
}

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
	
	$('#startDate').val(startDate);
	$('#endDate').val(endDate);

}

// 행 추가 랜더링 함수
function addRow() {
	
	let table = document.getElementById('insertStockTbl');
	let trCnt = document.getElementsByTagName('tr').length;
	console.log(trCnt);
	
	let today = new Date();
	let year = today.getFullYear();
	let month = today.getMonth()+1;
	let date = today.getDate();
	
	let sysdate = year + '-' + month + '-' + date
	console.log(sysdate);
	
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
	newCellFacotry.innerHTML = "<select id='factorySelect' class='form-select factorySelect' name='factory_no' onchange='getFactoryNo(this.value)'>"+makeFactorySelect()+"</select>";
	newCellItem.innerHTML = "<select id='itemSelect' class='form-select itemSelect' name='item_no' onchange='getItemNo(this.value)'></select>";
	newCellItemName.innerHTML = "<input type='text' name='item_name' id='itemName' class='form-control itemName' value='' readOnly='readOnly' placeholder='품번을 선택해주세요.'>";
	newCellDBCnt.innerHTML = "<input type='number' min='0' name='db_amount' id='DBCnt' class='form-control DBCnt' value=''readOnly='readOnly'>";
	newCellStockCnt.innerHTML = "<input type='number' min='0' name='amount' id='realStockCnt' class='form-control realStockCnt' value=''>";
	//newCellDiff.innerHTML = "<input type='number' min='0' name='dfCnt' id='dfCnt' class='form-control' value=''>"
	newCellMember.innerHTML = "<input type='text' name='emp_no' id='emp_no' class='form-control emp_no' value='2301001' readOnly='readOnly'>"
	newCellMemo.innerHTML = "<input type='text' name='subul_note' id='memo' class='form-control' value=''>";
	newCellStat.innerHTML = "<button type='button' class='btn btn-secondary' onclick='return insertTempSilsa(this.form);'>저장</button> <button type='button' class='btn btn-primary' onclick='insertSubulStockTaking()'>승인</button>"
	
}

// 값을 모두 입력했는지 Validation 체크 함수
function isAllEnter() {
	
	if(!$('#factorySelect>option:selected').val()) {
		alert('공장을 선택해주세요.');
		return false;
	}
	
	if(!$('#itemSelect>option:selected').val()) {
		alert('품번을 선택해주세요.');
		return false;
	}
	
	if(!$('#realStockCnt').val()) {
		alert('수량을 입력해주세요.');
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
	
	let isConfirm = confirm('임시실사값을 등록하시겠습니까?');
	
	if(isConfirm){
		
		frm.action='${pageContext.request.contextPath }/stocktaking/insertTempSilsa'
		frm.submit();
		alert('등록이 완료되었습니다.');
		return true;
		
		
	} else {
		alert('등록이 취소되었습니다.');
	}
	
}

// 상품 select 랜더링을 위한 공장 코드 value가져오기
function getFactoryNo(value) {
	
	$('#factorySelect').val(value);
	
	let factory_no = value;
	
	$.ajax({
		
		url:"${pageContext.request.contextPath }/stocktaking/itemSelect",
		data: {factory_no},
		dataType: "json",
		success: function(result) {
			
			makeItemSelect(result)
		}
		
		
	})
	
}

// 공장 코드 선택에 따른 상품 select 랜더링
function makeItemSelect(data) {
	
	$('#itemSelect').empty();
	
	let innerHtml = `<option value="">품번선택</option>`;

	if(data != null) {
		for(let datum of data) {
			innerHtml += `<option value="\${datum.item_no}">\${datum.item_no}</option>`
			
		}
	} 
	
	$('#itemSelect').append(innerHtml);
}


// 상품코드

function getItemNo(value) {
	
	$('#itemSelect').val(value);
	console.log("상품번호: " + value);
	let item_no = value;
	
	$.ajax({
		
		url:"${pageContext.request.contextPath }/stocktaking/selectItemInfo",
		data: {item_no},
		dataType: "json",
		success: function(result){
			for (let i = 0; result.length; i++){
				$('#itemName').val(result[i].item_name);
				$('#DBCnt').val(result[i].stock_count);
			}
			
		}
		
	});
}

function updateTempSilsa(target) {
	
	let targetTr = $(target).closest('tr');
	console.log(targetTr);
	
	let subul_num = targetTr.find('.subul_num').val();
	console.log(subul_num);
	
}

function deleteTempSilsa(target) {
	
	let targetTr = $(target).closest('tr');
	
	let subul_num = targetTr.find('.subul_num').val();
	
/* 	$.ajax({
		
			
		
	}); */
	
	
}


function updateTempSilsaGubun(target) {
	
	let targetTr = $(target).closest('tr');
	
	let subul_num = targetTr.find('.subul_num').val();
	
	let deleteConfirm = confirm('해당 임시실사 데이터를 승인하시겠습니까?');
	
 	if(deleteConfirm) {
		
 		$.ajax({
			
			url:"${pageContext.request.contextPath }/stocktaking/updateTempSilsaGubun",
			data: {subul_num},
			dataType:"json",
			success: function(result) {
				if (result == 1)
				alert('승인 완료 되었습니다.');
				selectStockTakingList();
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
					<input type="hidden" class="date" value="\${datum.date}">
					\${datum.date}
				</td>
				<td>
					<input type="hidden"  class="factory_name" value="\${datum.factory_name}">
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
					<input type="hidden" class="db_amount" value="\${datum.db_amount}">
					\${datum.db_amount}
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
					\${datum.emp_no}
				</td>
				<td>
					<input type="hidden" class="subul_note" value="\${datum.subul_note}">
					\${datum.subul_note}
				</td>
				<td class="gubun"> `;
					if(datum.gubun == '임시실사') {
						
						innerHtml += `<div class="dropdown"> 
							<a class="btn p-0 dropdown-toggle hide-arrow gubunText" data-bs-toggle="dropdown">\${datum.gubun}</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" onclick="updateTempSilsaGubun(this)"><i class='bx bx-check'></i>  승인 </a>
	                            <a class="dropdown-item" onclick="updateTempSilsa(this)" ><i class="bx bx-edit-alt me-1"></i> 수정 </a>
	                            <a class="dropdown-item" onclick="deleteTempSilsa(this)"><i class="bx bx-trash me-1"></i> 삭제 </a>
                          </div>
						</div> `;
						
					} else {
						innerHtml += `
						\${datum.gubun} `;
					}
				innerHtml += `
				</td>
			</tr>
		`;
	}
	
	$('#realStockTbl').html(innerHtml);
	
}

function changePage(e, page) {
	// a태그 기본 작동을 막기 위한 함수
	e.preventDefault();
	// 선택한 페이지 넘버값을 받아서 전역변수 currentPage에 담는다.
	currentPage = page;
	// 목록 가져오기
	selectStockTakingList();

}

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
				<li class="page-item">
					<a class="page-link" onclick="changePage(event,\${i})">\${i}</a>
				</li>
			`
		}
		
		innerHTML += `<li class="page-item">`
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


function selectStockTakingList() {
	
	let startDate = $('#startDate').val();
	let endDate = $('#endDate').val();
	
	//선택된 공장 번호 가져오기
	let factory_no = $('#searchFactory option:selected').val()
	
	$.ajax({
		
		url:"${pageContext.request.contextPath }/stocktaking/search",
		data: {
			startDate, endDate, factory_no, currentPage
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