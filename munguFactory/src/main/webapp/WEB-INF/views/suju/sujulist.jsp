<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(document).on("click","#sujuDetailTest", function(){
			$("#sujuDetailFromTest").submit();
		});
	});
</script>
<body>
	<h1>Suju List</h1>
	<a href="" class="">등록</a>
	<a href="#" id="sujuDetailTest">상세</a>
	<form action="/user/sujuDetail" id="sujuDetailFromTest">
		<input type="hidden" name="suju_no" value="10001">
		<input type="hidden" name="emp_no" value="2301001">
		<input type="hidden" name="emp_name" value="김우석">
		<input type="hidden" name="account_no" value="1001">
		<input type="hidden" name="account_name" value="이마트 풍산점">
		<input type="hidden" name="balju_no" value="">
		<input type="hidden" name="suju_date" value="2023-01-04">
		<input type="hidden" name="last_date" value="2023-02-12">
		<input type="hidden" name="order_note" value="이마트 풍산점 모나미 유성펜 0.7mm 5개 알파 언더라인m 형광펜 5색 100개 고로모 탄산분필 백색 110개">
	</form>
</body>
</html>