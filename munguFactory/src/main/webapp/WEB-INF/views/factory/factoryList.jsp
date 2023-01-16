<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(function(){
		if(${delMsg} == 0) {
			alert("삭제가 불가능한 공장입니다.");
		} else {
			alert("삭제 완료되었습니다.");
		}
		
	});
</script>


<script type="text/javascript">

$(function(){
	if(${upMsg} == 1) {
		alert("수정이 완료되었습니다.");
	}
});
</script>

<script type="text/javascript">

$(function(){
	if(${insertMsg} == 1) {
		alert("등록이 완료되었습니다.");
	}
});
</script>
</head>
<body>
	  <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Factory /</span> Factory List</h4>
				
              <!-- Basic Bootstrap Table -->
              <div class="card">
                <h5 class="card-header">Factory List</h5>
                <c:set var="num" value="${page.total-page.start+1 }"></c:set>
                <div><form class="frm" action="/user/factorySearch">
					<input
                          type="text"
                          class="form-control"
                          id="defaultFormControlInput"
                          placeholder="FACTORY NAME"
                          aria-describedby="defaultFormControlHelp"
                          style="float: left; width: 300px; margin-right: 5px; margin-left: 20px;"
                          name = "searchString"
                        />
					<button type="submit" class="btn btn-primary">검색</button>
				</form></div>
				
                	<div style="margin-left: 1300px"><input type="button" class="btn btn-primary" value="등록" onclick="location.href='${pageContext.request.contextPath }/admin/createFactory'"></div>
                <div class="table-responsive text-nowrap">
                  <table class="table" style="text-align: center;">
                    <thead>
                      <tr>
                        <th>factory Code</th>
                        <th>factory Name</th>
                        <th>factory Call</th>
                        <th>factory Use</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0" style="text-align: center;">
                      <c:forEach var="factory" items="${factoryList}">
						<tr><td><a href="/user/factoryInfo?factory_no=${factory.factory_no}">${factory.factory_no}</a></td>
						<td>${factory.factory_name }</td>
						<td>${factory.factory_call }</td>
						<td><c:if test="${factory.factory_use == 1 }">사용</c:if>
							<c:if test="${factory.factory_use == 0 }">미사용</c:if></td>
					  </c:forEach>
                    </tbody>
                  </table>
                  
					<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}" >
						<li class="page-item">
							<a  class="page-link" href="/user/factoryList?currentPage=${i}">${i}</a>
						</li>
					</c:forEach>
					</ul>
					</nav>
				
                </div>
              </div>
              <!--/ Basic Bootstrap Table -->
            </div>
            <!-- / Content -->
</body>
</html>