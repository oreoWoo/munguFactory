<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	width: 1200px;
	
    display: block;    
    margin-left: auto;
    margin-right: auto;
    text-align: center;  
}

thead, tbody, tfoot, tr, td, th {
    border-color: inherit;
    border-style: solid;
    border-width: 1px;
    width: 1250px;
}

.outputContainer {
	padding-top: 50px;
	padding-left: 50px;
	padding-right: 50px;
}


/* 페이징 */
.page_wrap {
	text-align: center;
	font-size: 0;
}

.page_nation {
	display: inline-block;
}

.page_nation .none {
	display: none;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .pprev {
	background: #f8f8f8 url('img/page_pprev.png') no-repeat center center;
	margin-left: 0;
}

.page_nation .prev {
	background: #f8f8f8 url('img/page_prev.png') no-repeat center center;
	margin-right: 7px;
}

.page_nation .next {
	background: #f8f8f8 url('img/page_next.png') no-repeat center center;
	margin-left: 7px;
}

.page_nation .nnext {
	background: #f8f8f8 url('img/page_nnext.png') no-repeat center center;
	margin-right: 0;
}

.page_nation a.active {
	background-color: #42454c;
	color: #fff;
	border: 1px solid #42454c;
}

/* 가로 중앙 정렬 */
 .div-center {
    display: block;    
    margin-left: auto;
    margin-right: auto;
    text-align: center;  
    margin-top: 20px;
}
</style>
</head>
<body>
	<div class="outputContainer">
		<h1 class="display-3">생산실적</h1>
		<!-- 생산실적 등록 -->
		<div class="alert alert-primary" role="alert" style="width: 70px;text-align: center;translate: 1200px 30px;height:40px;padding: 9px 2px 0px 1px;font-weight: bold;"><a href="writeFormOutput">등록</a></div>

		<!-- 생산실적 관련 정보 조회 -->
		<form action="listSearch" style="translate: 2px -10px;">
			<select name="search">
				<option value="">:: 검색 ::</option>
				<option value="item_no">품번 조회</option>
				<option value="item_name">품명 조회</option>
				<option value="emp_no">사원번호 조회</option>
				<option value="factory_no">공장코드 조회</option>
				<!-- 기간별 조회는 나중에 추가 예정 -->
			</select>
			<input type="text" name="searchWord" style="height: 21.99px; translate: 0 -1px;">
			<input type="text" style="display: none;">	<!-- 엔터키를 위해 쓴 -->
			<input type="image" src="https://cdn-icons-png.flaticon.com/512/71/71403.png" id="btnSearch" style="width: 20px; height: 20px; translate: 5px 4px; background: #EAEAEA;">
		</form>
		<div class="card mb-2" style="width: 1280px;">
			<div class="card-body table-responsive text-nowrap">
				<table class="outputTbl" style="background: white;">
					<thead style="background-color: #FFFAFA;">
						<tr>
							<th>생산번호</th>
							<th>품번</th>
							<th>품명</th>
							<th>사원번호</th>
							<th>공장코드</th>
							<th>작업일시</th>
							<th>생산수량</th>
							<th>불량수량</th>
							<th>수율</th>
						</tr>
					</thead>
	
					<tbody>
						<c:forEach var="output" items="${outputList}">
							<tr>
								<td><a href="outputDetail?prod_no=${output.prod_no}">${output.prod_no}</a></td>
								<td>${output.item_no}</td>
								<td>${output.item_name}</td>
								<td>${output.emp_no}</td>
								<td>${output.factory_no}</td>
								<td><fmt:formatDate value="${output.finish_date}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
								<td>${output.prod_amount}</td>
								<td>${output.poor_quantity}</td>
								<td>${output.yield}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	
		<!-- 페이징 처리 2트 -->
		<nav aria-label="Page navigation example">
               <ul class="pagination justify-content-center">
                  <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
                     <li class="page-item"><a class="page-link"
                        href="/outputList?currentPage=${i}">${i}</a></li>
                  </c:forEach>
               </ul>
		</nav>


<%-- 		<div class="div-center">
			<!-- 페이징 처리 -->
			<c:if test="${page.startPage > page.pageBlock }">
				<a href="outputList?currentPage=${page.startPage - page.pageBlock}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
				<a href="outputList?currentPage=${i}">[${i}]</a>
			</c:forEach>
			<c:if test="${page.endPage > page.totalPage }">
				<a href="outputList?currentPage=${page.startPage + page.pageBlock}">[다음]</a>
			</c:if>
		</div> --%>
	</div>
</body>
<script>
	$(document).ready(function() {
		$("#btnSearch").click(function()) {
			var searchWord = $("input[name=searchWord]").val().trim();
			var colName    = $()
		}
	})
</script>
</html>