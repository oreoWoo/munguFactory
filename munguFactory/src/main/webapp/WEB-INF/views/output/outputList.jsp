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

	/* 검색 버튼 */
	.btn_submit {
		background-position: 0px 0px;
		background-repeat: no-repeat;
		width: 20px;
		height: 20px;
		translate: 5px 4px;
		border: 0px;
		curosr:pointer;
		outline: 0;
	}
	
	
	
	
</style>
</head>
<body>
	<div class="outputContainer">
		<h4 class="fw-bold py-3 mb-4">생산 실적</h4>
		
		<!-- 생산실적 관련 정보 조회 -->
		<form action="listSearch" style="translate: 2px 52px;">
			<input type="hidden" value="1" name="pageNum" id="pageNum">
		
			<div class="searchBox row">
				<div class="col-sm-6">
					<select name="search" class="form-select" style="width: 110px;">
						<option value="">전체</option>
						<option value="item_no">품번</option>
						<option value="item_name">품명</option>
						<option value="emp_no">사원번호</option>
						<option value="factory_no">공장코드</option>
						<!-- 기간별 조회는 나중에 추가 예정 -->
					</select>
					<input type="text" class="form-control" name="keyword" style="height: 38.91px;translate: 110px -39px;width: 250px;">
					<!-- <input type="text" style="display: none;"> -->	<!-- 엔터키를 위해 쓴 -->
					<button type="submit" class="btn btn-outline-primary btn_submit" id="btnSearch" style="translate: 360px -70px;"><img src="https://cdn-icons-png.flaticon.com/512/71/71403.png" style="width: 20px;height: 20px;translate: -10px -10px;"></button>
				</div>
				
				<div class="col-sm-6" style="text-align: right;">
					<!-- 생산실적 등록 -->
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/user/writeFormOutput'" style="width: 70px; text-align: center; height:40px;padding: 9px 2px 0px 1px;font-weight: bold;">등록</button>
				</div>
			</div>
		</form>
		
		      <!-- Basic Bootstrap Table -->
              <div class="card">
                <div class="table-responsive text-nowrap">
                  <table class="table">
                    <thead>
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
                    <tbody class="table-border-bottom-0">
						<c:forEach var="output" items="${outputList}">
								<tr>
									<td><a href="outputDetail?prod_no=${output.prod_no}">${output.prod_no}</a></td>
									<td>${output.item_no}</td>
									<td>${output.item_name}</td>
									<td>${output.emp_no}</td>
									<td>${output.factory_no}</td>
									<td><fmt:formatDate value="${output.finish_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td>${output.prod_amount}</td>
									<td>${output.poor_quantity}</td>
									<td>
										<c:set var="yield" value="${output.yield}"/>
										
										<c:choose>
											<c:when test="${yield eq 0}">-</c:when>
											<c:otherwise><fmt:formatNumber value="${output.yield}" pattern="0.0"/></c:otherwise>
										</c:choose>
										
									</td>
								</tr>
						</c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
              <!--/ Basic Bootstrap Table -->
		
		<!-- 페이징 처리 -->
		<nav aria-label="Page navigation example" style="translate: 0 20px;">
               <ul class="pagination justify-content-center">
                  <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
                     <li class="page-item"><a class="page-link"
                        href="${pageContext.request.contextPath }/user/outputList?currentPage=${i}">${i}</a></li>
                  </c:forEach>
               </ul>
		</nav>

	</div>
</body>
</html>