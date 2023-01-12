<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<div class="SujuContainer">
	<div style="color: green;" class="">
		<h1>
			<i class="bi bi-briefcase"></i>
			수주 등록
		</h1>
	</div>
	<div>
		<table style="border: 1px solid; border-collapse: collapse;">
			<tr style="border: solid 1px ;">
				<th style="border: solid 1px ;">
				거래처
				</th>
				<td style="border: 1px solid;">
				<input>
				<button type="button" class="btn btn-primary">
					<i class="bi bi-search"></i>
				</button>
				</td>
				<th>
				수주일
				</th>
				<td>
				<input type="date" name="dates" />
				</td>
			</tr>
			<tr>
				<th>
					비고
				</th>
				<td>
				<textarea rows="" cols=""></textarea>
				</td>
			</tr>
		</table>
	</div>
</div>	
</body>
</html>