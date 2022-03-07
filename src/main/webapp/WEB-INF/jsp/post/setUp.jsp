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
				<h4 class="mt-5">박혜경님의 미니홈피</h4>
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
				<div class="text-primary mt-3"><h4>MY HOME SET UP</h4></div>
				<hr>
				<div class="mt-3" id="introduceBtn"><button type="button" class="btn btn-link">미니홈피 상단 소개말 등록</button></div>
				<div id="profilePhotoChangeBtn"><button type="button" class="btn btn-link">프로필 사진 바꾸기</button></div>
				<div id="profileIntroduceBtn"><button type="button" class="btn btn-link">프로필 인사말 바꾸기</button></div>

			</div>
			
			
			<div id="center-box" class="box-border">
			
				<!-- 미니홈피 상단 소개말 등록 -->
				<div id="introduceBox" class="mt-3 d-none">
					<i class="bi bi-gear mt-5"  style="width:65px;"></i>
						미니홈피 상단 소개말 등록
				
					<div class="d-flex mt-3">
						<input type="text" class="form-control" style="width:500px; height:50px;" id="introduceInput">
						<button type="button" class="btn btn-primary" data-user-id="${userId}" id="introduceInputBtn">확인</button>
					</div>
				</div>
				<!-- 미니홈피 상단 소개말 등록 -->
				
				<!-- 프로필 사진 바꾸기 -->
				<div id="profilePhotoBox" class="mt-3 d-none">
					<i class="bi bi-gear mt-5"  style="width:100px;"></i>
						프로필 사진 바꾸기
					
					<div class="d-flex mt-3">
						<span class="img-icon"> <i class="bi bi-image" id="imgBtn"  style="font-size: 25px;"></i>파일선택&nbsp;&nbsp;&nbsp;</span>
						<input type="file" id="profileInput" class="d-none">
						<button type="button" class="btn btn-small btn-primary" id="uploadBtn">확인</button>					
					</div>
				</div>
				<!-- 프로필 사진 바꾸기 -->
			</div>
		
			<!-- 카테고리 -->
			<div id="right-box">
				<button type="button" id="homeCategory" class="category btn" style="width:65px;"><a href="/main/mini_home_view${friendReview.targetUserId }" style="text-decoration-line: none; color: inherit;">홈</a></button>
				<button type="button" id="guestBookCategory" class="category btn mt-3" style="width:65px;"><a href="/post/guest_book_view" style="text-decoration-line: none; color: inherit;">방명록</a></button>
				<button type="button" id="setUpCategory" class="category btn mt-3" style="width:65px;"><a href="/post/set_up_view" style="text-decoration-line: none; color: inherit;">설정</a></button>
			</div>
			
		</section>	
	</div>
	
	<c:import url ="/WEB-INF/jsp/include/footer.jsp" />

</body>

	<script>
		$(document).ready(function(){
		
			$("#imgBtn").on("click", function() {
				// fileInput 클릭 효과
				$("#fileInput").click();
				
			});
			
			$("#introduceBtn").on("click", function(){
				$("#introduceBox").removeClass("d-none");
				$("#profilePhotoBox").addClass("d-none");
			});
	
			$("#profilePhotoChangeBtn").on("click", function(){
				$("#profilePhotoBox").removeClass("d-none");
				$("#introduceBox").addClass("d-none");
			});
			
			
			$("#introduceInputBtn").on("click", function(){
				
				var introduce= $("#introduceInput").val();
				var userId = $(this).data("user-id");//현재 로그인한 미니홈피 주인
				
				if(introduce == null || introduce == ""){
					alert("내용을 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/post/set_up/mini_home/introduce",
					data:{"introduce":introduce, "userId":userId},
					success:function(data) {
						if(data.result == success){
							alert("성공");
						}else {
							alert("소개말 등록 실패");
						}
					},
					error:function() {
						alert("소개말 등록 에러");
					}
				});
			});
		});
	</script>
	
</html>