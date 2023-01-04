<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.inventoryManagementContainer{
	background-color:white;
	width: 80%;
	margin :10%;
	padding: 2%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-content: center;
}
.searchPlace{
	display: flex;
	justify-content: space-between;
}
.form-select, .form-control{	
	display: inline;
	width: auto;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function ajaxChk(){
		alert("ajaxChk() start...");
		$.ajax({
			url : '/inventoryManagementListAjaxChk',
			dataType: 'text',
			success : function(data){
				var html = $('<div>').html(data);
				var sethtml = html.find("div#setHtml").html();
				$('.inventoryManagementContainer .ajaxContents').remove();
				$('.inventoryManagementContainer').append(sethtml);
			}
		});
	}
	$(function(){
		ajaxChk();
	});
</script>
</head>
<body>
	<div class="inventoryManagementContainer">
		<h1>수불부</h1>
		<div class="searchPlace">
			<div class="category">
				<select class="form-select">
					<option>창고목록</option>
					<option>창고목록</option>
				</select>
				<input type="date" class="form-control">
			</div>
			<div class="searchBox">
				<select class="form-select">
					<option>검색옵션</option>
					<option>창고목록</option>
				</select>
				<input type="text" class="form-control" placeholder="검색어를 입력해주세요.">
				<button type="button" class="btn btn-outline-primary"><span class="tf-icons bx bx-pie-chart-alt"></span>&nbsp;검색</button>
				<button type="button" class="btn btn-outline-primary" onclick="ajaxChk()"><span class="tf-icons bx bx-pie-chart-alt"></span>&nbsp;새로고침</button>
			</div>
		</div>
	</div>
</body>
</html>