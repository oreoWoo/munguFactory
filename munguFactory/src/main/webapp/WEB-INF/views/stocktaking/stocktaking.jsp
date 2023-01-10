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

		

	
	</div>
	
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

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
			item_no : '${item.itemNo}' 
			, factory_no : '${item.factoryNo}'
			, item_Name : '${item.itemName}'
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
	newCellMember.innerHTML = "<input type='text' name='emp_no' id='emp_no' value='2301001' readOnly='readOnly'>"
	newCellMemo.innerHTML = "<input type='text' name='subul_note' id='memo' class='form-control' value=''>";
	newCellStat.innerHTML = "<button type='button' class='btn btn-primary' onclick='insertSubulStockTaking()'>승인</button>"
	// <button type='button' class='btn btn-secondary'>임시저장</button>
}


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

function insertSubulStockTaking(){
	
	if(!isAllEnter()) {
   		return false;
   	} 
	
	let isConfirm = confirm('재고실사값을 등록하시겠습니까?');
	
	if(isConfirm){
		
		insertForm.submit();
		alert('등록이 완료되었습니다.')
		
	} else {
		alert('등록이 취소되었습니다.')
	}
}


// 공장코드~~
function getFactoryNo(value) {
	
	$('#factorySelect').val(value);
	console.log('선택된 값 : ' + value);
	
	let factory_no = value;
	
	$.ajax({
		
		url:"${pageContext.request.contextPath }/stocktaking/itemSelect",
		data: {factory_no},
		dataType: "json",
		success: function(result) {
			
			console.log(result);
			makeItemSelect(result)
		}
		
		
	})
	
}


function makeItemSelect(data) {
	
	$('#itemSelect').empty();
	
	let innerHtml = `<option value="">품번선택</option>`;

	if(data != null) {
		for(let datum of data) {
			innerHtml += `<option value="\${datum.itemNo}">\${datum.itemNo}</option>`
			
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


// 검색목록 테이블 랜더링
function makeTable (data) {
	
	console.log("makeTable : " + data);
	
	let reqNo = 1;
	let innerHtml = ``
	
	for(let datum of data) {
		innerHtml += `
			<tr>
				<td>\${datum.subul_num}</td>
				<td>\${datum.date}</td>
				<td>\${datum.factory_name}</td>
				<td>\${datum.item_no}</td>
				<td>\${datum.item_name}</td>
				<td>\${datum.stock_count}</td>
				<td>\${datum.db_amount}</td>
				<td>\${datum.amount}</td>
				<td>\${datum.emp_no}</td>
				<td>\${datum.subul_note}</td>
				<td>\${datum.gubun}</td>
			</tr>
		`;
	}
	
	$('#realStockTbl').html(innerHtml);
	
}


function selectStockTakingList() {
	
	let startDate = $('#startDate').val();
	let endDate = $('#endDate').val();
	
	//선택된 공장 번호 가져오기
	let factory_no = $('#searchFactory option:selected').val()
	
	$.ajax({
		
		url:"${pageContext.request.contextPath }/stocktaking/search",
		data: {
			startDate, endDate, factory_no
		},
		dataType: "json",
		success: function(result){
			makeTable(result);
		}
		
	})
	
}
</script>
</html>