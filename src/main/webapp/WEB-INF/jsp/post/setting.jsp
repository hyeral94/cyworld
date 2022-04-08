<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CYWORLD</title>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
	<link rel="stylesheet" href="/static/css/style.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
</head>
<body>

	<div id="wrap" class="home-bg">
		<header id="header-box" class="d-flex">
			<div id="left-header"></div>
			<div id="center-header">
				<h4 class="mt-5">${setting.introduce }</h4>
	
			</div>
			<div id="right-header" class="mt-5 pl-4">
				<c:choose>
					<c:when test="${not empty userId }"> 
						<a href="/user/sign_out">로그아웃</a>
					</c:when>
					<c:otherwise>
						<a href="/user/signin_view">로그인</a>
					</c:otherwise>
				</c:choose>
			</div>
		</header>
		
		<section class="d-flex">
		
			<!-- 설정 목록 -->
			<div id="left-box" class="box-border pt-3">
				<div class="text-primary mt-3"><h4>MY HOME SETTING</h4></div>
				<hr>
				<button type="button" class="btn btn-link mt-3" id="settingListBtn">내 미니홈피 설정</button>
				<button type="button" class="btn btn-link mt-3" id="settingProfileImageBtn">내 프로필 이미지 설정</button>
			</div>
			<!-- 설정 목록 -->
			
			
			<div id="center-box" class="box-border">

				<!-- 로그인 사용자가 현재 미니홈피 주인이아닌경우 -->
				<div id="warningBox"class="mt-5 text-center d-none">
					<i class="bi bi-exclamation-circle" style="font-size: 20px;"></i>
					접근할 수 없는 페이지입니다.
				</div>
				<!-- 로그인 사용자가 현재 미니홈피 주인이아닌경우 -->
				
				<div id="settingBox" class="mt-3">
				
					<i class="bi bi-gear mt-5"  style="width:65px;"></i> 미니홈피 상단 컨텐츠 등록                 
					<input type="text" class="form-control mt-3" style="width:500px; height:50px;" id="introduceInput"> 
					<br>
					
					<i class="bi bi-gear mt-5"  style="width:65px;"></i> 오늘의 기분 등록  
					<br>  
					<br>          
					<select id="profileMotionInput">
						<option>행복함</option>
						<option>슬픔</option>
						<option>외로움</option>
						<option>화남</option>
						<option></option>
					</select>
					<br>
	
					<br>
					<i class="bi bi-gear mt-5"  style="width:65px;"></i> 프로필 컨텐츠 등록              
					<input type="text" class="form-control mt-3" style="width:500px; height:50px;" id="profileContentInput"> 
					<br>
				
					<button type="button" class="btn form-control btn-primary " style="width:80px; height:40px;" data-user-id="${userId}" id="settingBtn">설정</button>
				</div>
				
				<!-- 프로필 이미지 설정 -->	
				<div id="settingProfileImageBox" class="mt-3 d-none">
					<i class="bi bi-gear mt-5"  style="width:65px;"></i> 프로필 이미지 등록       
					<br>         
					<input type="file" class="mt-3" style="width:500px; height:50px;" id="profileImageInput"> 
					<br>
					<button type="button" class="btn form-control btn-primary " style="width:80px; height:40px;" data-user-id="${userId}" id="settingImageBtn">설정</button>
				</div>
				<!-- 프로필 이미지 설정 -->
				
				<!-- 내 미니홈피 설정  -->
			</div>	
			

			
			<!-- 카테고리 -->
			<div id="right-box">
				<div class="side-box-border text-center text-white"><a href="/main/mini_home_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">홈</div></a></div>
				<div class="side-box-border text-center mt-1 text-white"><a href="/post/guest_book_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">방명록</div></a></div>
				<div class="side-box-border text-center mt-1 text-white"><a href="/post/diary_create_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">다이어리</div></a></div>
				<div class="side-box-border text-center mt-1 text-white"><a href="/post/photo_album_create_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">사진첩</div></a></div>
				<div class="side-box-border text-center mt-1"><a href="/post/setting_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">설정</div></a></div>
			</div>
			<!-- 카테고리 -->
			
		</section>	
	</div>
	
	<c:import url ="/WEB-INF/jsp/include/footer.jsp" />

</body>

		<script>
		$(document).ready(function(){
			
			var userId = $(this).data("user-id");
			
			//세션에 저장된 userId와 현재 로그인 한 userId와 일치하는지 확인 후 접근제한 설정
			if(session.userId != userId)
			
			
			//페이지 이동
			$("#settingListBtn").on("click", function(){
				
				$("#settingBox").removeClass("d-none");
				$("#warningBox").addClass("d-none");
				$("#settingProfileImageBox").addClass("d-none");
			});
			
			//페이지 이동
			$("#settingProfileImageBtn").on("click", function(){
				
				$("#settingBox").addClass("d-none");
				$("#warningBox").addClass("d-none");
				$("#settingProfileImageBox").removeClass("d-none");
			});
		
			$("#settingBtn").on("click", function(){
				
				var introduce = $("#introduceInput").val();
				var content = $("#profileContentInput").val();
				var motion = $("#profileMotionInput").val();
				var userId = $(this).data("user-id"); 
		
				$.ajax({
					type:"post",
					url:"/post/setting/up_load",
					data:{"introduce":introduce, "content":content, "motion":motion, "userId":userId},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						}else {
							alert("미니홈피 설정 실패");
						}
					},
					error:function() {
						alert("미니홈피 설정 에러");
					}
				});
			
			});	

			$("#settingImageBtn").on("click", function(){
				
				var userId = $(this).data("user-id"); 
				
				 // 파일 유효성 검사
	            if($("#profileImageInput")[0].files.length == 0) {
	               alert("파일을 선택하세요.");
	               return;
	            }
	         
	            var formData = new FormData();
	            formData.append("userId", userId);
	            formData.append("file", $("#profileImageInput")[0].files[0]);
	   
	            $.ajax({
	               type:"post",
	               url:"/post/setting/up_load_image",
	               data:formData,
	               enctype:"multipart/form-data", 
	               processData:false, 
	               contentType:false, 
	               success:function(data) {
	                  if(data.result == "success") {
	                     location.reload();                     
	                  }else {
	                     alert("프로필 이미지 설정 실패");
	                  }
	               },
	               error:function() {
	                  alert("프로필 이미지 설정 에러 발생");
	               }
	               
	            });
	         });
				
		});
			
	</script>
	
</html>