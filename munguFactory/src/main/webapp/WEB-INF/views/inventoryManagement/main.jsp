<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/subul.css" rel="styleSheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function ajaxChk(pageNum){
		$("#pageNum").val(pageNum);
		var formData = $(".searchPlace").serialize();
		$.ajax({
			url		: '/user/inventoryManagementListAjaxChk',
			type 	: "POST", 
			data	: formData,
			dataType: 'text',
			success	: function(data){
				var html = $('<div>').html(data);
				var sethtml = html.find("div#setHtml").html();
				$('.inventoryManagementContainer .ajaxContents').remove();
				$('.inventoryManagementContainer').append(sethtml);
			}
		});
	}
	function detailInfo(pk,url){
		$('.modal-body').html("");
		$.ajax({
			url		: url+pk,
			type 	: "GET", 
			dataType: 'text',
			success	: function(data){
				var html = $('<div>').html(data);
				$('.modal-body').append(html.find("div #container").html());
				$('.modal-body').append(html.find("div .subulContainer").html());
				$('.modal-body').append(html.find("div .inventoryManagementContainer").html());
				$('.modal-body').append(html.find("div .col-xxl").html());
				$('.modal-body button, .modal-body input').attr('disabled','disabled');
			}
		});
	}
	$(function(){
		ajaxChk(1);
	});
</script>
</head>
<body>
	<div class="inventoryManagementContainer">
		<sec:authentication property="principal.empDTO.emp_name" var="myName"/>
		<h1>수불부</h1>
		<div class="modal fade" id="fullsizemodal" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog fullsizemodal modal-dialog-scrollable" role="document">
				<div class="modal-content">
					<div class="modal-body" style="display: flex; flex-direction:column; justify-content:center; align-content: center;"></div>
				</div>
			</div>
		</div>
		<form class="searchPlace" onsubmit="return false">
			<input type="hidden" value="inventoryManagement/inventoryManagementList" name="pageaddr">
			<input type="hidden" value="1" name="pageNum" id="pageNum">
			<div class="category">
				<select class="form-select" name="rowPageOption" onchange="ajaxChk(1)">
					<option selected="selected" value="10">10개씩 보기</option>
					<option value="15">15개씩 보기</option>
					<option value="20">20개씩 보기</option>
					<option value="50">50개씩 보기</option>
					<option value="100">100개씩 보기</option>
				</select>
				<select class="form-select" name="gubun" onchange="ajaxChk(1)">
					<option selected="selected" value="">구분</option>
					<option>재고실사</option>
					<option>생산</option>
					<option>불량</option>
					<option>출하</option>
				</select>
				<select class="form-select" name="factory_no" onchange="ajaxChk(1)">
					<option selected="selected" value="0">창고선택(전체)</option>
					<c:forEach var="factory" items="${factoryList }">
						<option value="${factory.factory_no }">${factory.factory_name } 창고</option>
					</c:forEach>
				</select>
				<input type="date" class="form-control" name="subul_date" onchange="ajaxChk(1)">
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
				<button type="reset" class="btn btn-outline-primary" onclick="ajaxChk(1)"><span class="tf-icons bx bx-pie-chart-alt"></span>&nbsp;초기화</button>
			</div>
		</form>
	</div>
</body>
</html>