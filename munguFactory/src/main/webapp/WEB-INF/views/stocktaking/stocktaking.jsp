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
			factory_no : '${factory.factoryNo}' 
			, factory_name : '${factory.factoryName}'
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

function makeFactorySelect() {
	
	let innerHtml = `<option value="">공장선택</option>`;
	
	factoryList.forEach((item) => {
		innerHtml += `<option value="\${item.factory_no}">\${item.factory_name}</option>`
	})

	return innerHtml;
}

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
	
	let table = document.getElementById('realStockTbl');
	let trCnt = document.getElementsByTagName('tr').length;
	console.log(trCnt);
	
	let today = new Date();
	let year = today.getFullYear();
	let month = today.getMonth()+1;
	let date = today.getDate();
	
	let sysdate = year + '/' + month + '/' + date
	console.log(sysdate);
	
	let newRow = table.insertRow(0);
	
	let newCell1 = newRow.insertCell(0);
	let newCell2 = newRow.insertCell(1);
	let newCell3 = newRow.insertCell(2);
	let newCell4 = newRow.insertCell(3);
	let newCell5 = newRow.insertCell(4);
	let newCell6 = newRow.insertCell(5);
	let newCell7 = newRow.insertCell(6);
	let newCell8 = newRow.insertCell(7);
	let newCell9 = newRow.insertCell(8);
	let newCell10 = newRow.insertCell(9);
	
	newCell1.innerText = trCnt;
	newCell2.innerText = sysdate;
	newCell3.innerHTML = "<select id='defaultSelect' class='form-select'>"+makeFactorySelect()+"</select>"
	newCell4.innerHTML = "<select id='defaultSelect' class='form-select'></select>"
	newCell5.innerHTML = "<input type='text' name='itemName' id='itemName' class='form-control' value=''>";
	newCell6.innerHTML = "<input type='number' min='0' name='realStockCnt' id='realStockCnt' class='form-control' value=''>";
	newCell7.innerHTML = "<input type='number' min='0' name='dfCnt' id='dfCnt' class='form-control' value=''>";
	//newCell8.innerText = 로그인한 사원의 이름 불러오기
	newCell9.innerHTML = "<input type='text' name='memo' id='memo' class='form-control' value=''>";
	newCell10.innerHTML = "<button type='button' class='btn btn-secondary'>임시저장</button> <button type='button' class='btn btn-primary'>승인</button>"
	
}


function makeTable (data) {
	
	let reqNo = 1;
	let innerHtml = ``
	
	for(let datum of data) {
		innerHtml += `
			<tr>
				<td>\${reqNo}</td>
				<td>\${datum.date}</td>
				<td>\${datum.factory_name}</td>
				<td>\${datum.item_no}</td>
				<td>\${datum.item_name}</td>
				<td>\${datum.stock_count}</td>
				<td>\${datum.inventory_count}</td>
				<td>\${datum.amount}</td>
				<td>\${datum.emp_no}</td>
				<td>\${datum.subul_note}</td>
				<td>\${datum.gubun}</td>
			</tr>
		`;
		reqNo++;
	}
	
	$('#realStockTbl').html(innerHtml);
	
}


function selectStockTakingList() {
	
	let startDate = $('#startDate').val();
	let endDate = $('#endDate').val();
	
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