<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
                          <th>지시</th>                      
                        </tr>
                      </thead>
		                      <tbody>
								<c:set var="num" value="${page.total-page.start+1 }"></c:set>
								<c:forEach var="list" items="${prodList}">
									<tr>
										<th scope="row">${list.rn}</th>
										<td><a
											href="/prod/modProd?sujuNo=${list.sujuNo}">${list.sujoNo}</a></td>
										<td>${list.itemNo}</td>
										<td>${list.factoryCode}</td>
										<td>${list.prodAmount}</td>
										<td>${list.empNo}</td>
										<td>${list.prodState}</td>
										<td>${list.sujuDate}</td>
										<td>${list.finishDate}</td>
										<td>${list.dogName}</td>
										<td>${list.dogName}</td>
										<td><a href="/prod/jisiProd"</td>
		                          <td>
		                            <i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>Angular Project</strong>
		                          </td>
		                          <td>Albert Cook</td>
		                          <td>
		
		                          </td>
		                          <td></td>
		                          <td>
		                            <div class="dropdown">
		                              <button
		                                type="button"
		                                class="btn p-0 dropdown-toggle hide-arrow"
		                                data-bs-toggle="dropdown"
		                              >
		                                <i class="bx bx-dots-vertical-rounded"></i>
		                              </button>
		                              <div class="dropdown-menu">
		                                <a class="dropdown-item" href="javascript:void(0);"
		                                  ><i class="bx bx-edit-alt me-1"></i> Edit</a>
		                                <a class="dropdown-item" href="javascript:void(0);"
		                                  ><i class="bx bx-trash me-1"></i> Delete</a>
		                              </div>
		                            </div>
		                          </td>
		                          <td></td>
		                          <td></td>
		                          <td></td>
		                          <td><span class="badge bg-label-primary me-1">Active</span></td>
		                        </tr>
		                      </c:forEach>

                      </tbody>
                    </table>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
							<li class="page-item"><a class="page-link"
								href="/school/dogNotice/main?currentPage=${i}">${i}</a></li>
						</c:forEach>
					</ul>
				</nav>

			</div>
                </div>
              </div>


</body>
</html>