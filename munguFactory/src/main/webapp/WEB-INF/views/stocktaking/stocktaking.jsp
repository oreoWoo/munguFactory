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
	}
	
	.buttonGroup .btn {
		margin-left: 5px;
	}
</style>
</head>
<body>
	<div class="stockContainer">
		<h1 class="display-3">재고실사 관리</h1>
		
		<div class="buttonGroup">
			<button type="button" class="btn rounded-pill btn-info" onclick="addRow()"><strong>+</strong></button>
			<button type="button" class="btn btn-secondary">임시저장</button>
			<button type="button" class="btn btn-primary">저장</button>
		</div>
		
		<div class="card">
			<div class="table-responsive text-nowrap">
				<table class="table table-hover" id="realStockTbl">
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
						</tr>
					</thead>
					<tbody class="table-border-bottom-0">
						<tr>
							<td>1</td>
							<td>2022/12/20</td>
							<td>A</td>
							<td>1234567</td>
							<td>모나미 볼펜</td>
							<td>325</td>
							<td>25</td>
							<td>테스터1</td>
							<td>재고누락</td>
						</tr>
						
						
					</tbody>
				
				</table>
			
			</div>
		
		</div>
	
	</div>
</body>
<script type="text/javascript">
	function addRow() {
		
		let table = document.getElementById('realStockTbl');
		
		let newRow = table.insertRow(1);
		
		let newCell1 = newRow.insertCell(0);
		let newCell2 = newRow.insertCell(1);
		let newCell3 = newRow.insertCell(2);
		let newCell4 = newRow.insertCell(3);
		let newCell5 = newRow.insertCell(4);
		let newCell6 = newRow.insertCell(5);
		let newCell7 = newRow.insertCell(6);
		let newCell8 = newRow.insertCell(7);
		let newCell9 = newRow.insertCell(8);
		
		let inputBox = '<input type="text" name="num">';
		newCell5.innerHtml = inputBox;
	}


</script>
</html>