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
.shipmentContainer{
	background-color:white;
	width: 90%;
	margin :3% 5% 5% 5%;
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
.boldRed{
	color: red;
}
.boldGreen{
	color: green;
}
.insertShipment ul{
	margin: 0;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function ajaxChk(pageNum){
		$("#pageNum").val(pageNum);
		var formData = $(".searchPlace").serialize();
		$.ajax({
			url		: 'aaa/shipmentAjaxChk2',
			type 	: "POST", 
			data	: formData,
			dataType: 'text',
			success	: function(data){
				var html = $('<div>').html(data);
				var sethtml = html.find("div#setHtml").html();
				$('.shipmentContainer .ajaxContents').remove();
				$('.shipmentContainer').append(sethtml);
			}
		});
	}
	$(function(){
		ajaxChk(1);
	});
	function ajaxInsertShipmentForm(){
		if($(".insertShipment").html()==null){
			$.ajax({
				url		: '/ajaxInsertShipmentForm',
				type 	: "GET", 
				dataType: 'text',
				success	: function(data){
					var html = $('<div>').html(data);
					var sethtml = html.find("div#setAccountList").html();
					$(".ajaxContents tbody").prepend("<tr class='insertShipment'><td>신규등록</td>"+
						"<td></td><td></td><td></td><td></td><td></td><td></td></tr>");
					$('.insertShipment td').eq(1).append(sethtml);
				}
			});
		} else {
			alert('한번에 한 건씩 등록해주세요.');
		}
	}
</script>
</head>
<body>
	<div class="shipmentContainer">
		<h1>출하등록</h1>
		<form class="searchPlace" onsubmit="return false">
			<input type="hidden" value="1" name="pageNum" id="pageNum">
			<input type="hidden" value="출하" name="gubun">
			<div class="category">
				<select class="form-select" name="factory_no" onchange="ajaxChk(1)">
					<option selected="selected" value="0">창고선택(전체)</option>
					<c:forEach var="factory" items="${factoryList }">
						<option value="${factory.factory_no }">${factory.factory_name } 창고</option>
					</c:forEach>
				</select>
				<input type="date" class="form-control" name="subul_date" value="" onchange="ajaxChk(1)">
			</div>
			<div class="searchBox">
				<select class="form-select" name="searchOption">
					<option selected="selected">전체</option>
					<option>담당자</option>
					<option>물품명</option>
					<option>고유번호</option>
					<option>등록번호</option>
				</select>
				<input type="text" class="form-control" name="searchString" placeholder="검색어를 입력해주세요.">
				<button type="button" class="btn btn-outline-primary" onclick="ajaxChk(1)"><span class="tf-icons bx bx-pie-chart-alt"></span>&nbsp;검색</button>
				<button type="reset" class="btn btn-outline-primary"><span class="tf-icons bx bx-pie-chart-alt"></span>&nbsp;초기화</button>
				<button type="button" class="btn btn-outline-primary" onclick="ajaxInsertShipmentForm()"><span class="tf-icons bx bx-pie-chart-alt"></span>&nbsp;추가</button>
			</div>
		</form>
	</div>
</body>
</html>