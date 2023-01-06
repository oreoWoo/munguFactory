<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Factory /</span> Factory List</h4>
				
              <!-- Basic Bootstrap Table -->
              <div class="card">
                <h5 class="card-header">Factory List</h5>
                
                <div><form class="frm" action="/">
					<input
                          type="text"
                          class="form-control"
                          id="defaultFormControlInput"
                          placeholder="FACTORY NAME"
                          aria-describedby="defaultFormControlHelp"
                          style="float: left; width: 300px; margin-right: 5px; margin-left: 20px;"
                        />
					<button type="submit" class="btn btn-primary">검색</button>
				</form></div>
				
                	<div style="margin-left: 1300px"><input type="button" class="btn btn-primary" value="등록" onclick="location.href='${pageContext.request.contextPath }/createFactory'"></div>
                <div class="table-responsive text-nowrap">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>factory Code</th>
                        <th>factory Name</th>
                        <th>factory Call</th>
                        <th>factory Use</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                      <tr>
                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i><a href="detailFactoryCode?factoryCode=1"><strong>1</strong></a></td>
                        <td>1 Cook</td>
                        <td>2 Cook</td>
                        <td>3 Cook</td>
                      </tr>
                    </tbody>
                  </table>
                  
                  <nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li
							class="page-item ${page.startPage > page.pageBlock ? '' : 'disabled'}">
							<a class="page-link"
							href="/mypage/admin/resList?currentPage=${page.startPage-page.pageBlock}">Previous</a>
						</li>

						<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
							<li class="page-item ${page.currentPage == i ? 'active' : ''}">
								<a class="page-link"
								href="/mypage/admin/resListSearch?currentPage=${i}&name=${name}">${i}</a>
							</li>
						</c:forEach>

						<li
							class="page-item ${page.startPage < page.pageBlock ? 'disabled' : ''}">
							<a class="page-link"
							href="/mypage/admin/resList?currentPage=${page.startPage+page.pageBlock}">Next</a>
						</li>
					</ul>
				</nav>
				
                </div>
              </div>
              <!--/ Basic Bootstrap Table -->
            </div>
            <!-- / Content -->
</body>
</html>