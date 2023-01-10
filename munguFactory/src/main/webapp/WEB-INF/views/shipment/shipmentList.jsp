<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div id=setHtml>
		<table class="table table-striped table-hover ajaxContents">
			<thead>
				<tr>
					<th>등록번호</th>
					<th>거래처</th>
					<th>수주번호</th>
					<th>물품명</th>
					<th>출하량</th>
					<th>등록일시</th>
					<th>담당자</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${subulList.size()==0 || subulList==null}">
					<tr><td colspan="7"><h2>검색결과가 없습니다.</h2></td></tr>
				</c:if>
				<c:if test="${subulList!=null }">
					<c:forEach var="subul" items="${subulList }">
						<tr>
							<td>${subul.subul_num }</td>
							<td>${subul.account_name }</td> 
							<td>${subul.serial_no }</td> 
							<td>${subul.item_name }</td>
							<td>${subul.amount }</td>
							<td>
								<fmt:formatDate value="${subul.subul_date }" pattern="yy-MM-dd [E]"/><br/>
								<fmt:formatDate value="${subul.subul_date }" pattern="HH시mm분"/>
							</td>
							<td>${subul.emp_name }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<nav aria-label="Page navigation ajaxContents">
			<ul class="pagination justify-content-center ajaxContents">
				<c:if test="${paging!=null }">
					<c:if test="${paging.startPage > paging.pageBlock }">
						<li class="page-item prev">
							<a class="page-link" onclick="ajaxChk(${paging.startPage - paging.pageBlock })"><i class="tf-icon bx bx-chevron-left"></i></a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
						<li class="page-item">
							<a class="page-link" onclick="ajaxChk(${num})">${num }</a>
						</li>
					</c:forEach>
					<c:if test="${paging.endPage < paging.totalPage }">
						<li class="page-item next">
							<a class="page-link" onclick="ajaxChk(${paging.startPage + paging.pageBlock })"><i class="tf-icon bx bx-chevron-right"></i></a>
						</li>
					</c:if>
				</c:if>
			</ul>
		</nav>
	</div>
<div id="setAccountList">
	<script type="text/javascript">
		function ajaxGetSujuList(){
			alert("function도 가져가네!");
		}
	</script>
	<select onchange="ajaxGetSujuList()">
		<c:if test="${accountList!=null }">
		<c:forEach var="acc" items="${accountList }">
			<option value="${acc.account_no }">${acc.account_name }</option>
		</c:forEach>
		</c:if>
	</select>
</div>
<div id="setSujuList">
	<select onchange="ajaxGetItemList()">
		<c:if test="${orderList!=null }">
		<c:forEach var="ord" items="${orderList }">
			<option>${ord.suju_no }</option>
		</c:forEach>
		</c:if>
	</select>
</div>
<div id="setItemList">
	<select onchange="ajaxGetAmount()">
		<c:if test="${itemList!=null }">
		<c:forEach var="itm" items="${itemList }">
			<option value="${itm.item_no }">${itm.item_name }</option>
		</c:forEach>
		</c:if>
	</select>
</div>
</body>
</html>