<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

function loginCheck()
{
	var v_emp_id = $('#emp_id').val();
	var v_emp_passwd = $('#emp_passwd').val();
	
	if(v_emp_id == "")
	{
		alert("아이디를 입력해주세요 ");
	}
	
	if(v_emp_passwd == "")
	{
		alert("비밀번호를 입력해주세요 ");
	}
	
	$.ajax({
		url : "<%=context%>/login",
		type : 'post',
		data : { 
			emp_id : v_emp_id, 
			emp_passwd : v_emp_passwd
		},
	
		success:function(data)
		{
			if(data.result == 1)
			{
				console.log(JSON.stringify(data));
				alert(data.msg);
				location.href='<%=context%>/auth_finder';
			}
			else
			{
				alert(data.msg);
				alert("아이디 혹은 비밀번호를 다시 확인해주세요");
			}
		}
		
	});
}


$(function(){
	if('${msg}' != ""){
		alert('${msg}');
	}
	
	//	페이지 로딩 완료 후 focus 이동 - 처음에 label zoom 효과 안되는 오류 수정(임시방편)
	$(document).ready(function(){
		$("input[type='text']:first, input[type='password']:first").focus();
	});

	//	Label Zoom 효과 - input/select 선택했을 때
	$("input, select").focus(function() {
		// 'textbox' class가 적용된 태그 안에서 input[type="text"], input[type="password"] 검색
		var $input = $('.textbox').find('input[type="text"], input[type="password"]');
		$input.on({
			'focus': function () { // input 태그가 focus를 가지면 'focus' class 추가
				$(this).parent().addClass('focus');
			},
			'blur': function () { // input 태그가 focus를 잃으면
				if ($(this).val() == '') { // input 태그에  값이 없으면 'focus' class 삭제
					$(this).parent().removeClass('focus');                
				}           
			}
		});
		// 'textbox' class가 적용된 태그 안에서 select 검색
		var $select = $('.textbox').find('select');
		$select.on({
			'change': function () { // select 태그 값이 change가 발생하면 'focus' class 추가
				$(this).parent().addClass('focus');
			}
		});
	});

	//	회원가입 중에 오류가 날 때 zoom 관련 css 초기화 되어 다시 설정
	$('input[type=text], input[type=password], select').each(function () {
		if ($(this).val() !== '') { // input 태그가 value값을 가지면 'focus' class 추가
			// label focus
			$(this).closest('.textbox').addClass('focus');
		} else { // input 태그에  value값이 없으면 'focus' class 삭제
			$(this).closest('.textbox').removeClass('focus');
		}
	});
});



//주소 가져오기
function DaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if(data.userSelectedType === 'R'){
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if(data.buildingName !== '' && data.apartment === 'Y'){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if(extraAddr !== ''){
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("extraAddress").value = extraAddr;

			} else {
				document.getElementById("extraAddress").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById("address").value = addr;

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("detailAddress").focus();

			// 우편변호와 도로명주소에 'focus' class 추가
			document.getElementById("postcode").parentNode.classList.add('focus');
			document.getElementById("address").parentNode.classList.add('focus');
		}    
	}).open();
}
</script>

</head>
<body>
<div class="container">
    <div class="row justify-content-center">
    	<div class="col-xl-5 col-lg-12 col-md-9" style="height:100% !important">

	        <div class="card o-hidden border-0 shadow-lg my-5">
	          	<div class="card-body p-0">
	          		<div class="p-5">

				                
						<form id="form_login" action="/login" method="post">			
							
							<!-- 아이디 -->
							<div class="form-group textbox">
								<label for="emp_id">아이디를 입력하세요</label>
								<input type="text" class="form-control" id="emp_id" name="username" value="" maxlength="15" required="required">
							</div>
								
							<!-- 비밀번호 -->
							<div class="form-group textbox">
								<label for="emp_passwd">비밀번호를 입력하세요</label>
								<input type="password" class="form-control" id="emp_passwd" name="password" value="" maxlength="16" style="ime-mode: disabled;" required="required" >
							</div>
							
							<!-- 로그인 버튼 -->
							<div class="form-group textbox">
								<input type="submit" class="btn btn-primary btn-user btn-block" id="btn_login" value="로그인" style="background-color: #696cff;" >
							</div>
							
						</form>
				     		              
				        <hr>
					        <a href="/findIdPwForm" class="btn btn-google btn-user btn-block">아이디 / 비밀번호 찾기</a>				                  
					        <a href="/signUp" class="btn btn-facebook btn-user btn-block">회원 가입</a>
				        <hr>
	         		</div>
	       		</div>
	     	</div>
		</div>
    </div>
</div>
</body>
</html>
