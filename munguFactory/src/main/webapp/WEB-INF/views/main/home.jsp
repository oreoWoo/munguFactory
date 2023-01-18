<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.homeContainer {
		padding-left: 50px;
		padding-top : 50px;
	}
	.forImg img {
		width: 65%; 
		height: 850px; 
		object-fit: cover;
	}
	
	.forImg {
		text-align: center;
	}
</style>
</head>

<body>
	<div class="homeContainer">
		<div class="forImg">
			<sec:authorize access="hasRole('ROLE_user')">
				<img alt="main_img" src="${pageContext.request.contextPath }/img/Manufacturing Process-amico.png">
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_admin')">
				<img alt="main_img2" src="${pageContext.request.contextPath }/img/Factory-amico.png">
			</sec:authorize>
		</div>
	</div>
</body>
</html>