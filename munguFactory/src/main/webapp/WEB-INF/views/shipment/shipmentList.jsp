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
							<td>
								<a data-bs-toggle="modal" data-bs-target="#fullsizemodal" onclick="detailInfo(${subul.account_no },'/user/accountInfoDetail?account_no=')" href="#">
									${subul.account_name }
								</a>
								<%-- <a href="/accountInfoDetail?account_no=${subul.account_no }">${subul.account_name }</a> --%>
							</td> 
							<td>
								<a data-bs-toggle="modal" data-bs-target="#fullsizemodal" onclick="detailInfo(${subul.serial_no },'/user/sujuDetail?suju_no=')" href="#">
									${subul.serial_no }
								</a>
							</td>
							<%-- <td><a href="/user/sujuDetail?suju_no=${subul.serial_no }">${subul.serial_no }</a></td> --%>
							<td>
								<a	data-bs-toggle="modal" data-bs-target="#fullsizemodal" onclick="detailInfo(${subul.item_no },'/user/ItemAdminSelect?item_no=')" href="#">
									${subul.item_name }
								</a>
							</td>
							<%-- <td><a href="/ItemAdminSelect?item_no=${subul.item_no }">${subul.item_name }</a></td> --%>
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
		<nav aria-label="Page navigation" class="ajaxContents">
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
		$(".ajaxGetSujuList").change(function(){
			$.ajax({
				url		: '/user/ajaxGetSujuList',
				data	: {account_no	:	$(this).val()},
				type 	: "GET",
				dataType: 'text',
				success	: function(data){
					var html = $('<div>').html(data);
					var sethtml = html.find("div#setSujuList").html();
					$('.ajaxContents tbody .insertShipment td').slice(2).html("");
					$('.ajaxContents tbody .insertShipment td').eq(2).append(sethtml);
				}
			});
		});
	</script>
	<select class="form-select ajaxGetSujuList">
		<c:if test="${accountList!=null }">
		<c:forEach var="acc" items="${accountList }">
			<option value="${acc.account_no }">${acc.account_name }</option>
		</c:forEach>
		</c:if>
	</select>
</div>
<div id="setSujuList">
	<c:if test="${orderList==null || orderList.size()==0}">
		없음
		<script type="text/javascript">
			$(function(){
				alert("출하 가능한 수주내역이 없습니다.");
			});
		</script>
	</c:if>
	<c:if test="${orderList!=null && orderList.size()!=0}">
		<script type="text/javascript">
			$(".ajaxGetItemList").change(function(){
				$.ajax({
					url		: '/user/ajaxGetItemList',
					data	: {suju_no	:	$(this).val()},
					type 	: "GET",
					dataType: 'text',
					success	: function(data){
						var html = $('<div>').html(data);
						var sethtml = html.find("div#setItemList").html();
						var sethtml2 = html.find("div#setItemList2").html();
						$('.ajaxContents tbody .insertShipment td').slice(3).html("");
						$('.ajaxContents tbody .insertShipment td').eq(6).append(sethtml2);
						$('.ajaxContents tbody .insertShipment td').eq(3).append(sethtml);
					}
				});
			});
		</script>
		<select class="form-select ajaxGetItemList">
			<option style="display: none;">수주선택</option>
			<c:forEach var="ord" items="${orderList }">
				<option>${ord.suju_no }</option>
			</c:forEach>
		</select>
	</c:if>
</div>
<div id="setItemList">
	<c:if test="${OrdersDetailList==null || OrdersDetailList.size()==0 }">
		없음
		<script type="text/javascript">
			$(function(){
				alert("출하 가능한 상품이 없습니다.");
			});
		</script>
	</c:if>
	<c:if test="${OrdersDetailList!=null && OrdersDetailList.size()!=0 }">
		<select class="form-select ajaxGetOrdersDetail">
			<option style="display: none;">상품선택</option>
			<c:forEach var="itm" items="${OrdersDetailList }">
				<option value="${itm.item_no }">${itm.item_name }</option>
			</c:forEach>
		</select>
		<script type="text/javascript">
			$(".ajaxGetOrdersDetail").change(function(){
				$.ajax({
					url		: '/user/ajaxGetOrdersDetail',
					data	: {	suju_no	:	$(".ajaxGetItemList").val(),
								item_no	:	$(this).val()},
					type 	: "GET",
					dataType: 'text',
					success	: function(data){
						var html = $('<div>').html(data);
						var sethtml = html.find("div#setOrdersDetail").html();
						var sethtml2 = html.find("div#insertShipmentButton").html();
						$('.ajaxContents tbody .insertShipment td').slice(4).html("");
						$('.ajaxContents tbody .insertShipment td').eq(6).append(sethtml2);
						$('.ajaxContents tbody .insertShipment td').eq(4).append(sethtml);
					}
				});
			});
		</script>
	</c:if>
</div>
<div id="setOrdersDetail">
	<c:if test="${OrdersDetail==null}">
		없음
		<script type="text/javascript">
			$(function(){
				alert("출하 가능한 상품이 없습니다.");
			});
		</script>
	</c:if>
	<c:if test="${OrdersDetail!=null}">
		<c:choose>
			<c:when test="${OrdersDetail.suju_amount>OrdersDetail.stock_count }">
				<ul>
					<li><b class="boldRed">재고 : ${OrdersDetail.stock_count }</b></li>
					<li><b class="boldRed">주문량 : ${OrdersDetail.suju_amount }</b></li>
				</ul>
			</c:when>
			<c:otherwise>
				<input type="hidden" value="${OrdersDetail.suju_amount}" id="suju_amount">
				<ul>
					<li><b class="boldGreen">재고 : ${OrdersDetail.stock_count }</b></li>
					<li><b class="boldGreen">주문량 : ${OrdersDetail.suju_amount }</b></li>
				</ul>
			</c:otherwise>
		</c:choose>
		<script type="text/javascript">
			if(${OrdersDetail.suju_amount>50 }{
				alert("재고가 부족하여 출하가 불가능합니다!");
				$('.insertShipmentButton').attr("disabled","disabled").text("출하불가");
			} else {
				$('.insertShipmentButton').removeAttr("disabled").text("출하");
			}
			function ajaxInsertShipment(){
				if(confirm("출하 등록 후 수정이 불가능 합니다. \n정확히 확인 후 등록하여 주세요. \n등록하시겠습니까?")){
					$.ajax({
						url		: '/user/ajaxInsertShipment',
						data	: {	serial_no	:	$(".ajaxGetItemList").val(),
									item_no		:	$(".ajaxGetOrdersDetail").val(),
									amount		:	$("#suju_amount").val()},
						type 	: "POST",
						dataType: 'text',
						success	: function(data){
							if(data>0){
								alert("등록성공!");
							} else {
								alert("등록에 실패했습니다..");
							}
							ajaxChk(1);
						}
					});
				}
			}
		</script>
	</c:if>
</div>
<div id="insertShipmentButton">
	<button type='button' class='btn btn-outline-primary insertShipmentButton' disabled='disabled' onclick='ajaxInsertShipment()'>출하불가</button>
</div>
</body>
</html>