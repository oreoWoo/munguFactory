<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		// 검색
		$(document).on("click", "#searchAction", function() {
			sujuPaging(1)

		});
		// 페이지 변경
		$(document).on("click", ".pageNum", function() {
			sujuPaging($(this).val());


		});
		// 날짜 선택
		$(document).on("change", "#startDate , #endDate", function() {
			alert($(this).val());
			if($(this).attr("id") == "startDate"){
				$("#endDate").attr("min",$(this).val())
			} else {
				$("#startDate").attr("max", $(this).val())
			}
		});
		// 페이지 이전
		$(document).on("click", "#prev", function() {
			sujuPaging(parseInt($(".pageNum:first").val()) - 1);

		});
		// 페이지 이후
		$(document).on("click", "#next", function() {
			sujuPaging(parseInt($(".pageNum:last").val()) + 1);

		});
		
	});

	function sujuSaveForm() {
		location.href = "/user/sujuCreate";
	}
	function sujuDetail(suju_no) {
		location.href = "/user/sujuDetail?suju_no=" + suju_no;
	}
	
	// 거래처 페이징
	function sujuPaging(currentPage) {
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		var searchName = $("#searchName").val();
		alert(currentPage);
		$.ajax({
					url : "/user/sujuListAction",
					type : "POST",
					data : {"currentPage" : currentPage,
							"searchName" : searchName,
							"startDate" : startDate,
							"endDate" : endDate
							},
					dataType : "json",
					success : function(data) {
						$("#ajaxordersList").empty();
						$("#ajaxPaging").empty();
						var str = "";
				 			$(data.ordersDTOs).each(
				 					function (){
									str += "<tr onclick='sujuDetail(" + this.suju_no +")'><td>"+this.suju_no+"</td>";
									str += "<td>"+this.account_name+"</td>";
									str += "<td>"+this.suju_date+"</td>";
									str += "<td>"+this.last_date+"</td>";
									str += "</tr>";
									});
									$("#ajaxordersList").append(str);
						str = "";
						var startPage = parseInt(data.ordersPaging.startPage);
						var endPage = parseInt(data.ordersPaging.endPage);
						var totalPage = parseInt(data.ordersPaging.totalPage);
						var pageBlock = parseInt(data.ordersPaging.pageBlock);
							if(startPage > pageBlock){
								str += "<ul class='pagination justify-content-center' style='text-align: center;'>";
								str += "<button type='button' class='page-link ' style= 'margin: 10px;' id='prev'>이전</button>";
								str += "</ul>";
							}
							for(startPage; startPage <= endPage; startPage++){
								str += "<ul class='pagination justify-content-center' style='text-align: center;'>";
								str += "<button type='button' class='page-link pageNum' style= 'margin: 10px;' value="+startPage+">"+startPage+"</button>";
								str += "</ul>";
							}
							if(endPage < totalPage){
								str += "<ul class='pagination justify-content-center' style='text-align: center;'>";
								str += "<button type='button' class='page-link ' style= 'margin: 10px;' id='next'>다음</button>";
								str += "</ul>";
							}
							$("#ajaxPaging").append(str);
					},
					error : function() {
						alert("리스트 조회 실패");
					}
				});
	};
</script>
<body>
	<div class="SujuContainer">
		<h1>Suju List</h1>
		<input type="date" class="form-control" name="startDate" id="startDate">
		~
		<input type="date" class="form-control" name=endDate  id="endDate">
		<input type="text" class="form-control" name="searchName" id="searchName" placeholder="검색어를 입력해주세요.">
		<button type="button" class="btn btn-outline-primary" id="searchAction" >검색</button>
		<div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>수주번호</th>
						<th>거래처</th>
						<th>수주일자</th>
						<th>납기일</th>
					</tr>
				</thead>
				<tbody id="ajaxordersList">
					<c:forEach var="orders" items="${ordersListDTO.ordersDTOs}">
						<tr onclick="sujuDetail(${orders.suju_no})">
							<td>${orders.suju_no}</td>
							<td>${orders.account_name}</td>
							<td>${orders.suju_date}</td>
							<td>${orders.last_date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<nav aria-label='Page navigation example' id="ajaxPaging">
				<c:if test="${ordersListDTO.ordersPaging.startPage > ordersListDTO.ordersPaging.pageBlock }">
					<ul class='pagination justify-content-center' style='text-align: center;'>
						<button type='button' class='page-link' style= "margin: 10px;" id="prev">이전</button>
					</ul>
				</c:if>
				<c:forEach var="i" begin="${ordersListDTO.ordersPaging.startPage}" end="${ordersListDTO.ordersPaging.endPage}" >
					<ul class='pagination justify-content-center' style='text-align: center;'>
						<button type='button' class='page-link pageNum' style= "margin: 10px;" value="${i}">${i}</button>
					</ul>
				</c:forEach>
				<c:if test="${ordersListDTO.ordersPaging.endPage < ordersListDTO.ordersPaging.totalPage }">
					<ul class='pagination justify-content-center' style='text-align: center;'>
						<button type='button' class='page-link' style= "margin: 10px;" id="next">다음</button>
					</ul>
				</c:if>	
			</nav>
		</div>
		<button class="btn btn-outline-primary" onclick="sujuSaveForm()">
			등록</button>
	</div>

	<a href="#" id="sujuDetailTest">상세</a>
	<form action="/user/sujuDetail" id="sujuDetailFromTest">
		<input type="hidden" name="suju_no" value="10005">
	</form>
</body>
</html>