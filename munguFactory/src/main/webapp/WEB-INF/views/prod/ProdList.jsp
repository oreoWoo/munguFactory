<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

function click_add(){
	var url = "/ProdModPop";
	var name = "생산지시 팝업";
	var option = "width = 600, height = 600, left = 100, top=50, location=no";
	window.open(url,name,option);
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
              <div class="card">
                <h5 class="card-header">생산지시! </h5>
                <div class="card-body">
                  <div class="table-responsive text-nowrap">
                    <table class="table table-bordered">
                      <thead class="thead">
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
										<%-- <th scope="row">${list.rn}</th>  --%>
										<td><a
											href="/ProdModPop?sujuNo=${list.sujuNo}">${list.sujuNo}</a></td>
										<td>${list.itemNo}</td>
										<td>${list.factoryNo}</td>
										<td>${list.prodAmount}</td>
										<td>${list.empNo}</td>
										<td>
											${list.prodState}
											<c:if test="${list.prodState eq '생산지시'}">
												<button type="button" onclick="click_add();">수정</button>
											</c:if>
											
										</td>
										<td>${list.prodDate}</td>
										<td>${list.finishDate}</td>
		                       
		                      </c:forEach>

                      </tbody>
                   </table>
                   <p>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
							<li class="page-item"><a class="page-link"
								href="/ProdList?currentPage=${i}">${i}</a></li>
						</c:forEach>
					</ul>
				</nav>
				

			</div>
                </div>
              </div>
              
              


</body>
</html>