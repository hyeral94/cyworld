<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CYWORLD 회원가입</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div id="wrap">
		<header>
			<div id="logo" class="text-center"><img height="200" width="400" src="http://www.earlyadopter.co.kr/wp-content/uploads/2021/02/%E1%84%8A%E1%85%A1%E1%84%8B%E1%85%B5%E1%84%8B%E1%85%AF%E1%86%AF%E1%84%83%E1%85%B3-%E1%84%87%E1%85%AE%E1%84%92%E1%85%AA%E1%86%AF_001-1024x683.jpg"></div>
			<div class="text-center text-secondary mt-5"><h3>welcome to cyworld!</h3></div>
		</header>
		
		<form id="signUpForm">
			<section id="box" class="mt-5">
				<input type="text" name="test" onkeyup="this.value=this.value.replace(/[^a-zA-Z]/g,'');" class="form-control" placeholder="사용자 이름" id="loginIdInput" />	
				<div id="onlyEngInputMassage" class="d-none"><small class="text-dark">*영문 입력만 가능합니다.</small></div>
				<div id="duplicateId" class="d-none"><small class="text-danger">중복된 ID 입니다.</small></div>
				<div id="noneDuplicateId" class="d-none"><small class="text-success">사용 가능한 ID 입니다.</small></div>
						
				<input type="password" class="form-control mt-3" placeholder="비밀번호" id="passwordInput">
				<input type="password" class="form-control mt-3" placeholder="비밀번호 확인" id="passwordCheckInput">
				<small id="errorPassword" class="text-danger d-none">비밀번호가 일치하지 않습니다.</small>
				
				<input type="text" class="form-control mt-3" placeholder="성명" id="nameInput">
				
				<input type="text" class="form-control mt-3" placeholder="이메일 주소" id="emailInput">
				
				<button type="submit" class="form-control btn btn-primary mt-3">회원가입</button>
				
				<div class="text-center mt-5"><strong>이미 싸이월드 회원이신가요?</strong>  <a href="/user/signin_view">로그인</a></div>
			</section>
		</form>
		
		<c:import url ="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
	
		$(document).ready(function(){
			
			$("#loginIdInput").on("input", function(){
				
				$("#onlyEngInputMassage").removeClass("d-none");
				
				var loginId = $("#loginIdInput").val();
	
				var isIdCheck = false;
				var isDuplicateId = true;
				
				if(loginId == null || loginId == ""){
					alert("사용자 이름을 입력하세요.");
					return;
				}

				$.ajax({
					type:"get",
					url:"/user/is_duplicate_id",
					data:{"loginId":loginId},
					success:function(data){
						isIdCheck = true;
						
						if(data.id_duplicate){					
							isDuplicateId = true;
							$("#duplicateId").removeClass("d-none");
							$("#noneDuplicateId").addClass("d-none");
						}else{
							isDuplicate = false;
							$("#noneDuplicateId").removeClass("d-none");
							$("#duplicateId").addClass("d-none");
							
						}
					},
					error:function() {
						alert("에러 발생");
					}
					
				});
				
			});
			
			$("#signUpForm").on("submit", function(){
				
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				var passwordCheck = $("#passwordCheckInput").val();
				var name = $("#nameInput").val();
				var email = $("#emailInput").val();
				
				if(loginId == "" || loginId == null){
					alert("사용자 이름을 입력하세요.");
					return;
				}
			
				if(password == "" || password == null){
					alert("비밀번호를 입력 하세요.");
					return;
				}
				
				if(password != passwordCheck){
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}
				
				if(name == "" || name == null){
					alert("성명을 입력하세요.");
					return;
				}
				
				if(email == "" || email == null){
					alert("이메일 주소를 입력 하세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_up",
					data:{"loginId":loginId, "password":password, "name":name, "email":email},
					success:function(data) {	
						if(data.result == "success"){
							location.href="/user/signin_view";
						}else{
							alert("회원가입 실패");
						}
					},
					error:function() {
						alert("회원가입 에러 발생");
					}
					
				});
				
				
		
			});
		});

	</script>

</body>
</html>