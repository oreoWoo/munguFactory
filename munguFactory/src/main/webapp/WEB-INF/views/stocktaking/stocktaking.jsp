<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	.buttonGroup {
		text-align: right;
		margin-top: 20px;
	}
	
	.buttonGroup .btn {
		margin-left: 5px;
	}
	
	.form-control {
		width : 120px;
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
	
</style>
</head>
<body>
	<div class="stockContainer">
		<h1 class="display-3">재고실사 관리</h1>
		<div class="searchStock">
			<select class='form-select selectFactory'>
				<option>공장선택</option>
				<option>A</option>
				<option>B</option>
			</select>
			
			<input class="form-control" type="date" value="2021-06-18" id="html5-date-input">
			<input class="form-control" type="date" value="2021-06-18" id="html5-date-input">
			
			<button type="button" class="btn btn-info searchBtn">검색</button>
	
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
							<th>실사수량</th>
							<th>차이량</th>
							<th>승인자</th>
							<th>비고</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody class="table-border-bottom-0"  id="realSearchTbl">
						
					</tbody>
				
				</table>
			
			</div>
		
		</div>
		<div class="buttonGroup">
			<button type="button" class="btn rounded-pill btn-info" onclick="addRow()"><strong>+</strong></button>
		</div>
		
		<div class="card">
			<div class="table-responsive text-nowrap">
				<table class="table table-bordered realStockTbl">
					<thead>
						<tr>
							<th>요청번호</th>
							<th>실사일자</th>
							<th>창고</th>
							<th>품번</th>
							<th>품명</th>
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
<script type="text/javascript">
	function addRow() {
		
		let table = document.getElementById('realStockTbl');
		let trCnt = document.getElementsByTagName('tr').length-1;
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
		newCell3.innerHTML = "<select id='defaultSelect' class='form-select'><option value='A'>A</option><option value='B'>B</option></select>"
		newCell4.innerHTML = "<select id='defaultSelect' class='form-select'><option value='eraser'>10001</option><option value='pencil'>20001</option></select>"
		newCell5.innerHTML = "<input type='text' name='itemName' id='itemName' class='form-control' value=''>";
		newCell6.innerHTML = "<input type='number' min='0' name='realStockCnt' id='realStockCnt' class='form-control' value=''>";
		newCell7.innerHTML = "<input type='number' min='0' name='dfCnt' id='dfCnt' class='form-control' value=''>";
		//newCell8.innerText = 로그인한 사원의 이름 불러오기
		newCell9.innerHTML = "<input type='text' name='memo' id='memo' class='form-control' value=''>";
		newCell10.innerHTML = "<button type='button' class='btn btn-secondary'>임시저장</button> <button type='button' class='btn btn-primary'>승인</button>"
		
	}


</script>
</html>