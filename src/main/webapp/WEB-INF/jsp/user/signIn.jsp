<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CYWORLD 로그인</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>

	<div id="wrap">
		<header>
			<div id="login-logo" class="text-center"><img height="200" width="400" src="http://www.earlyadopter.co.kr/wp-content/uploads/2021/02/%E1%84%8A%E1%85%A1%E1%84%8B%E1%85%B5%E1%84%8B%E1%85%AF%E1%86%AF%E1%84%83%E1%85%B3-%E1%84%87%E1%85%AE%E1%84%92%E1%85%AA%E1%86%AF_001-1024x683.jpg"></div>
		</header>
		
		<section class="d-flex justify-content-center">
			<div>
				<img height="400" width="400" src="https://newsimg.hankookilbo.com/cms/articlerelease/2020/06/05/202006051888034625_5.jpg">
			</div>
			<div class="mt-5 pt-5">
			<input type="text" class="form-control" placeholder="사용자 이름" id="loginIdInput">
			<input type="password" class="form-control mt-3" placeholder="비밀번호" id="passwordInpt">
			
			<button type="button" id="loginBtn" class="form-control btn btn-primary mt-3">로그인</button>
			
			<div class="text-center mt-5"><strong>싸이월드 회원이 아니신가요?</strong>  <a href="/user/signup_view">회원가입</a></div>
			</div>
		</section>
		
		<c:import url ="/WEB-INF/jsp/include/footer.jsp" />
	</div>

</body>

	<script>
		$(document).ready(function(){
			
			$("#loginBtn").on("click", function(){
				
				var loginId = $("#loginIdInput").val();
				var password = $("passwordInpt").val();
				
				if(loginId == ""){
					alert("사용자 이름을 입력하세요.");
					return;
				}
				
				if(password == ""){
					alert("비밀번호를 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_in",
					data:{"loginId":loginId, "password":password},
					success:function(data) {
						if(data.result == "success"){
							location.href="/post/mini_home_view";
						}else {
							alert("로그인 실패");
						}
					},
					error:function() {
						alert("로그인 에러발생");
					}
					
					
				});
				
			});
			
		});
	</script>
</html>