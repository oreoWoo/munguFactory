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
<div class="SujuContainer">
	<h1>Suju List</h1>
</div>	
	<a href="SujuCreate" class="">등록</a>
	<a href="#" id="sujuDetailTest">상세</a>
	<form action="/user/sujuDetail" id="sujuDetailFromTest">
		<input type="hidden" name="suju_no" value="10005">
	</form>
</body>
</html>