<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<head>
	<script type="text/javascript">
		function checkData()
		{
			var check = true;
			
			var v_emp_no = $('#emp_no').val();
			var v_emp_name = $('#emp_name').val();
			
			if(isNaN(v_emp_no)) 
			{ 
				alert("사번은 숫자를 입력해주세요"); 
				check = false;
			} 
			
			if(!isNaN(v_emp_name)) 
			{ 	
				alert("이름은 문자를 입력해주세요"); 
				check = false;
			}
			
			if(v_emp_no.length != 7)
			{
				alert("사번은 7자리로 [입사년도 + 부서 번호 + 카운트번호] 형식으로 입력해 주세요")	
				check = false;
			}
			
			if(check == false)
			{
				alert("입력값을 수정해서 다시 입력해주세요");
				return false;
			}
		}
		
		
/* 		$(function()
		{		
			if('${result}' == 1)
			{
				alert("사원 리스트에 등록 성공했습니다.");
			}
			else if('${result}' == 2)
			{
				alert("사원 리스트에 등록 실패했습니다. 입력정보를 다시 확인해 주세요");
			}
		});	 */
	</script>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<style type="text/css">
	.form-control {
		display: inline;
		width: 50%;
		height: calc(1.5em + .75rem + 2px);
		padding: .375rem .75rem;
		font-size: 1rem;
		font-weight: 400;
		line-height: 1.5;
		color: #6e707e;
		background-color: #fff;
		background-clip: padding-box;
		border: 1px solid #d1d3e2;
		border-radius: .35rem;
		-webkit-transition: border-color .15s ease-in-out, -webkit-box-shadow
			.15s ease-in-out;
		transition: border-color .15s ease-in-out, -webkit-box-shadow .15s
			ease-in-out;
		transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
		transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out,
			-webkit-box-shadow .15s ease-in-out
		}
		
	#postcode {
		width: 300px;
	}
	
</style>
<body>
		
		<div class="container-fluid" >
			<div class="card mb-6">

			 
			<h4 class="fw-bold py-3 mb-4" style="padding-left: 80px; margin-top: 50px;">유저 등록하기</h4>
			<form action="/admin/createUserList">
				<table class="table" style="width: 1300px; margin-left:50px;  margin-top: 50px; margin-bottom: 50px;">
					<tr>
						<th>사원 이름</th>
						<td><input type="text" id="emp_name" name="emp_name"></td>
					</tr>
					
					<tr>
						<th>사원 번호<br><sub>사번 형식: [입사년도[2]+ 부서 번호[2] + 카운트번호[3]]</sub></th>
						<td><input type="text" id="emp_no" name="emp_no"></td>
					</tr>
					
					<tr>
						<th>입사일</th>
						<td><input type="date" id="emp_hire_date" name="emp_hire_date"></td>
					</tr>
					
					<tr> 
						<th>부서</th>
						<td>	
							<select name="dept_no" id="dept_no">
								<c:forEach var="dept" items="${deptlist}">
									<option value="${dept.dept_no}">${dept.dept_name}</option>
								</c:forEach>
							</select>					
						</td>
					</tr>
					
					<tr>
						<th>직책</th>
						<td>
							<select name="posit_no" id="posit_no">
								<c:forEach var="posit" items="${positlist}">
									<option value="${posit.posit_no}">${posit.posit_name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					<tr>
						<th>권한 등급</th>
						<td>
							<select name="auth_no" id="auth_no">
								<c:forEach var="auth" items="${authlist}">
									<option value="${auth.auth_no}">${auth.auth_name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
				</table>
				
				<div style=" text-align: center;" class="form-group" id="sendBut">
					<button type="submit" class="btn btn-primary btn-lg" onclick="return checkData(); return false;">등록하기</button>
				</div>
				<br>
				
			</form>
		</div>	
		</div>
</body>
</html>