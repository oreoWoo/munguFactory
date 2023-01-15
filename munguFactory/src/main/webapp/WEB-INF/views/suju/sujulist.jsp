<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(document).on("click", "#sujuDetailTest", function() {
			$("#sujuDetailFromTest").submit();
		});
	});
	
	function sujuSaveForm(){
		location.href = "/SujuCreate";
	}
</script>
<body>
	<div class="SujuContainer">
		<h1>Suju List</h1>
		<div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>수주번호</th>
						<th>거래처</th>
						<th>수주일자</th>
						<th>고객발주번호</th>
						<th>납기일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>001</td>
						<td>모닝글로리</td>
						<td>23-01-02</td>
						<td></td>
						<td>23-01-30</td>
					</tr>
					<tr>
						<td>001</td>
						<td>모닝글로리</td>
						<td>23-01-02</td>
						<td></td>
						<td>23-01-30</td>
					</tr>
					<tr>
						<td>001</td>
						<td>모닝글로리</td>
						<td>23-01-02</td>
						<td></td>
						<td>23-01-30</td>
					</tr>
					<tr>
						<td>001</td>
						<td>모닝글로리</td>
						<td>23-01-02</td>
						<td></td>
						<td>23-01-30</td>
					</tr>
				</tbody>
			</table>
		</div>
			<button class="btn btn-outline-primary" onclick="sujuSaveForm()">
		등록
	</button>
	</div>

	<a href="#" id="sujuDetailTest">상세</a>
	<form action="/user/sujuDetail" id="sujuDetailFromTest">
		<input type="hidden" name="suju_no" value="10005">
	</form>
</body>
</html>