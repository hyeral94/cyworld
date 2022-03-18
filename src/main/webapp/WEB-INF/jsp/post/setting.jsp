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
			<c:forEach var="setting" items="${settingList}">
				<h4 class="mt-5">${setting.introduce }</h4>
			</c:forEach>	
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
		
			<!-- 편집 목록 -->
			<div id="left-box" class="box-border pt-3">
				<div class="text-primary mt-3"><h4>MY HOME SETTING</h4></div>
				<hr>
				<div class="mt-3" id="introduceBtn"><button type="button" class="btn btn-link">미니홈피 상단 소개말 등록</button></div>
				<div id="profileImageChangeBtn"><button type="button" class="btn btn-link">프로필 사진 바꾸기</button></div>
				<div id="profileContentChangeBtn"><button type="button" class="btn btn-link">프로필 인사말 바꾸기</button></div>

			</div>
			<!-- 편집 목록 -->
			
			<div id="center-box" class="box-border">
			
				<!-- 미니홈피 상단 소개말 등록 -->
				<div id="introduceBox" class="mt-3 d-none">
					<i class="bi bi-gear mt-5"  style="width:65px;"></i>
						미니홈피 상단 소개말 등록
				
					<div class="d-flex mt-3">
						<input type="text" class="form-control" style="width:500px; height:50px;" id="introduceInput${setting.userId }">
						<button type="button" class="btn btn-primary" data-user-id="${targetUserId}" id="introduceInputBtn${setting.userId }">확인</button>
					</div>
				</div>
				<!-- 미니홈피 상단 소개말 등록 -->
				
				<!-- 프로필 사진 바꾸기 -->
				<div id="profilePhotoBox" class="mt-3 d-none">
					<i class="bi bi-gear mt-5"  style="width:100px;"></i>
						프로필 사진 바꾸기
					
					<div class="d-flex mt-3">
						<input type="file" id="profileImageInput">&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-small btn-primary" data-user-id="${targetUserId}" id="profileImageBtn${setting.userId }">확인</button>					
					</div>
				</div>
				<!-- 프로필 사진 바꾸기 -->
				
				<!-- 프로필 소개 바꾸기 -->
				<div id="profileContentBox" class="mt-3 d-none">
					<i class="bi bi-gear mt-5"  style="width:100px;"></i>오늘의 기분 <br>
					
					<!-- 기분 설정 -->
					<div class="mt-3">today is...
						<select id="motionSelect">
						<option><i class="bi bi-brightness-high"></i> 기분좋음</option>
						<option><i class="bi bi-brightness-high"></i> 외로움</option>
						<option><i class="bi bi-brightness-high"></i> 슬픔</option>
						<option><i class="bi bi-brightness-high"></i> 화남</option>
						<option><i class="bi bi-brightness-high"></i> 선택안함</option>
						</select>
						<button type="button" class="btn btn-small btn-primary" data-user-id="${targetUserId}" id="motionBtn">확인</button>					
					</div>
					<!-- 기분 설정 -->
					
					<!-- 프로필 컨텐츠 -->
					<br>
					<i class="bi bi-gear mt-5"  style="width:100px;"></i>프로필 소개
					
					<div class="d-flex mt-3">
						<input type="text" class="form-control" style="width:500px; height:50px;" id="profileContentInput${setting.userId }">
						<button type="button" class="btn btn-primary" data-user-id="${targetUserId}" id="profileContentBtn${setting.userId }">확인</button>
					</div>
					<!-- 프로필 컨텐츠 -->
					
				</div>
				<!-- 프로필 소개 바꾸기 -->
			</div>
		
			<!-- 카테고리 -->
			<div id="right-box">
				<div class="side-box-border text-center"><a href="/main/mini_home_view?userId=${targetUserId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">홈</div></a></div>
				<div class="side-box-border text-center mt-1"><a href="/post/guest_book_view?userId=${targetUserId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">방명록</div></a></div>
				<div class="side-box-border text-center mt-1"><a href="/post/setting_view?userId=${targetUserId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">설정</div></a></div>
			</div>
			<!-- 카테고리 -->
			
		</section>	
	</div>
	
	<c:import url ="/WEB-INF/jsp/include/footer.jsp" />

</body>

	<script>
		$(document).ready(function(){
			
			//페이지 이동
			$("#introduceBtn").on("click", function(){
				
				$("#introduceBox").removeClass("d-none");
				$("#profilePhotoBox").addClass("d-none");
				$("#profileContentBox").addClass("d-none");
			});
			
			//페이지 이동
			$("#profileImageChangeBtn").on("click", function(){
				
				$("#profilePhotoBox").removeClass("d-none");	
				$("#introduceBox").addClass("d-none");	
				$("#profileContentBox").addClass("d-none");	
			});
			
			//페이지 이동
			$("#profileContentChangeBtn").on("click", function(){
				
				$("#profileContentBox").removeClass("d-none");
				$("#introduceBox").addClass("d-none");
				$("#profilePhotoBox").addClass("d-none");
			});
			
			//상단 소개말 등록
			
			$("#introduceInputBtn").on("click", function(){

				var introduce = $("#introduceInput").val();
				var userId = $(this).data("user-id");
				
				if(introduce == ""){
					alert("소개말을 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/post/setting/introduce/up_load",
					data:{"introduce":introduce, "targetUserId":userId},
					success:function(data) {
						if(data.result == "success"){
							alert("소개말 등록 성공");
						}else {
							alert("소개말 등록 실패");
						}
					},
					error:function() {
						alert("에러 발생");
					}
				});
			});
		
			// 프로필 이지 등록
			$("#profileImageBtn").on("click", function(){
				
				var userId = $(this).data("user-id");
				
				// 파일 유효성 검사
				if($("#profileImageInput")[0].files.length == 0) {
					alert("파일을 선택하세요.");
					return;
				}
			
				var formData = new FormData();
				formData.append("targetUserId", userId);
				formData.append("profileImage", $("#profileImageInput")[0].files[0]);
				
				
				$.ajax({
					type:"post",
					url:"/post/setting/profile_image/up_load",
					data:formData,
					enctype:"multipart/form-data", 
					processData:false, 
					contentType:false, 
					success:function(data) {
						if(data.result == "success") {
							alert("프로필 이미지 등록 성공");
						}else {
							alert("프로필 이미지 등록 실패");
						}
					},
					error:function() {
						alert("에러 발생");
					}
					
				});
				
			});
			
			// 프로필 기분 선택
			$("#motionBtn").on("click", function(){
				
				var motion = $("#motionSelect").val();
				
				if(motion == ""){
					alert("오늘의 기분을 선택하세요.");
					return;
				}
			});
			
			// 프로필 컨텐츠 등록
			$("#profileContentBtn").on("click", function(){
				
				var content = $("#profileContentInput").val();
				var userId = $(this).data("user-id");
				
				if(content == ""){
					alert("인사말을 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/post/setting/profile_content/up_load",
					data:{"content":content, "targetUserId":userId},
					success:function(data) {
						if(data.result == "success"){
							alert("프로필 컨텐츠 등록 성공");
						}else {
							alert("프로필 컨텐츠 등록 실패");
						}
					},
					error:function() {
						alert("에러 발생");
					}
				});
				
			});

		});

	</script>
	
</html>