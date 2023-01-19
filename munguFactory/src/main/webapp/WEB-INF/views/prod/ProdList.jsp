<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<style type="text/css">

 .prodcontainer{
 	margin-left: 50px;
 	margin-right: 100px; 
 }

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">

/*  function click_add(v_sujuNo , v_itemNo){
	if(confirm("생산을 지시하시겠습니까?")){
		
		var frm = {
			"sujuNo" : "10008",
			"itemNo" : "105",
			"empNo" : "2301001",
			"finishDate" : "2023-02-01",
			"prodAmount" : "50"
		}
		
		console.log("frm : " + frm);
		
		$.ajax({
			type: "post",
			url : "modContent",
			data: JSON.stringify(frm),
			dataType: "json",
			contentType: "application/json",
			success : function(data){
				alert('생산지시가 완료되었습니다.');
				console.log("success data : " + data);
				//self.close();
			}
		});
	}
};  */

	function click_add(v_suju_no , v_item_no){
		var url = "/user/ProdModPop?suju_no="+v_suju_no + "&item_no="+v_item_no;
		var name = "생산지시 팝업";
		var option = "width = 600, height = 600, left = 100, top=50, location=no";
		var w = window.open(url,name,option);
		/* 
		w.onbeforeunload = function() { */
		//w.onunload = function() {
			//alert('생산지시가 완료되었습니다.');
			
			// 부모창의 리스트를 리프레시
			//location.href="/ProdList";
		//}
	};               
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

 	.thead {
		width:50px;
	}
</style>
</head>
<body>
 <!-- Bordered Table -->
	<!-- <div class="card">
		<h5 class="card-header">생산지시! </h5>
		<div class="card-body">
			<div class="table-responsive text-nowrap">
				<table class="table table-bordered">
					<thead class="thead">
						<tr> -->
 <div class="prodcontainer" >
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light" ></span>생산지시</h4>

              <!-- Basic Bootstrap Table -->
              <div class="card">
                <h5 class="card-header">Production Order</h5>
                <div class="table-responsive text-nowrap">
                  <table class="table">
                    <thead>
                      <tr>
							<th>수주번호</th>
							<th>품번</th>
							<th>공장코드</th>
							<th>생산수량</th>
							<th>담당자</th>
							<th>진행상태</th>
							
							<th>수주일자</th>
							<th>작업완료일자</th>             
						</tr>
					</thead>
					<tbody>
						<c:set var="num" value="${page.total-page.start+1 }"></c:set> 
						<c:forEach var="list" items="${prodList}">
							<tr>
			
								<td>
									<a href="" readonly>${list.suju_no}</a>
								</td>
								<td>${list.item_no}</td>
								<td>${list.factory_no}</td>
								<td>${list.prod_amount}</td>
								<td>${list.emp_no}</td>
								<td>
									${list.prod_state}
									<c:if test="${list.prod_state eq '지시 전'}">
				<button type="button" class="btn btn-sm btn-primary"  onclick="click_add(${list.suju_no}, ${list.item_no} );">지시</button>
									</c:if>
								</td>
								<%-- <td>	
									<input type="button" class="btn btn-primary" onclick="click_add(${list.suju_no}, ${list.item_no} );" value="지시">
								</td> --%>
								<td>${list.prod_date}</td>
								<td>${list.finish_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<p>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
							<li class="page-item"><a class="page-link"
								href="/user/ProdList?currentPage=${i}">${i}</a></li>
						</c:forEach>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>