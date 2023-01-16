<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h1>문구 공장 main 화면</h1>
		<div class="forImg">
			<img alt="main_img" src="${pageContext.request.contextPath }/img/Manufacturing Process-amico.png">
			<%-- <img alt="main_img2" src="${pageContext.request.contextPath }/img/Factory-amico.png"> --%>
		</div>
	</div>
</body>
</html>