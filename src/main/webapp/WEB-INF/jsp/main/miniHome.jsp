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
			<div id="left-box" class="box-border pt-3">
				<!-- 방문자 수 -->
				<div id="visitor" class="d-flex justify-content-center">
					<div class="text-danger">TODAY ${todayCount}</div>
					<div>&nbsp; | TOTAL ${totalCount}</div>
				</div>
				
				<!-- 프로필 이미지 -->
				<div id="profileImage" class="text-center mt-4">
					<img height="200" width="250" src="${settingProfileImage.imagePath }">
				</div>
				
				<!-- 프로필 아래 글쓰기 -->
				<div id="profileContent" class="text-center mt-5">
					<strong class="" id="todayMotion">today is...</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${setting.motion }
					<div id="content" class="mt-5">${setting.content }</div>
				</div>
			</div>
			
			<div id="center-box" class="box-border">
				<!-- 최근 게시물 노출 -->
				<div id="uploadNews">
					<div class="text-primary">upload news</div>
					<hr>
					<div style="overflow:auto; width:750px; height:110px;">
					<small>- [제주도 여행]3박 4일 제주도 여행 후기~~</small><br>
					<small>- 코로나 재택치료 후기...ㅠㅠ</small>
					</div>
				</div>
				
				<!-- 미니룸 -->
				<div class="text-primary mt-3">mini room</div>
				<hr>
				<div id="mini-room" class="mini-room mt-3">
				<img width="700" height="200" src="https://image.edaily.co.kr/images/Photo/files/NP/S/2005/10/PS05101700046.JPG">
				</div>
				
				<!-- 일촌평 리스트 -->			
				<div class="text-primary mt-3">what friends say~</div>
				<hr>
				<div id="friendReviewBox" style="overflow:auto; width:750px; height:110px;">
					<c:forEach var="friendReview" items="${friendReviewList }">
					
					<div class="d-flex justify-content-between" id="friendReviewDelete">
						<!-- 일촌평 작성자 정보  -->
						<div><b><a href="/main/mini_home_view?userId=${friendReview.userId}" style="text-decoration-line:none; color:inherit;"><i class="bi bi-house"></i> ${friendReview.userName }</a></b> &nbsp; ${friendReview.content }</div>
						<!-- 일촌평 작성자 정보  -->
						
						<!-- 일촌평 삭제 -->
						<div class="friendReviewDeleteBtn" data-friend-id="${friendReview.id }"><a href="#" style="text-decoration-line:none; color:inherit;" class="text-white">삭제</a></div>
						<!-- 일촌평 삭제 -->					
					</div>
					
					</c:forEach>
	 			</div>	
			 	<!-- 일촌평 리스트 -->
	
				<!-- 일촌평 입력 -->
			 	<div class="d-flex mt-3">		 	
				 	<input type="text" class="form-control" style="width:700px; height:40px;" id="friendReviewInput${friendReview.userId }">
				 	<button type="button" class="form-control btn btn-secondary" style="width:80px; height:40px;" data-user-id="${targetUserId}" id="friendReviewUploadBtn${friendReview.userId }">확인</button>
				</div>
			</div>
			
		
			<!-- 카테고리 -->
			<div id="right-box">
				<div class="side-box-border text-center"><a href="/main/mini_home_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">홈</div></a></div>
				<div class="side-box-border text-center mt-1"><a href="/post/guest_book_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">방명록</div></a></div>
				<div class="side-box-border text-center mt-1"><a href="/post/diary_create_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">다이어리</div></a></div>
				<div class="side-box-border text-center mt-1"><a href="/post/diary_create_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">사진첩</div></a></div>
				<div class="side-box-border text-center mt-1"><a href="/post/setting_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">설정</div></a></div>
			</div>

		</section>
			
	</div>
	<c:import url ="/WEB-INF/jsp/include/footer.jsp" />

</body>

	<script>
		$(document).ready(function(){
			
			//댓글 입력
			$("#friendReviewUploadBtn").on("click", function(){
				
				var content = $("#friendReviewInput").val(); // 입력한 일촌평
				var userId = $(this).data("user-id");//현재 로그인한 미니홈피 주인
		
				if(content == null || content == ""){
					alert("내용을 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/post/friend_review/create",
					data:{"content":content, "targetUserId":userId},
					success:function(data) {
						if(data.result == "success"){
							location.reload();
						}else {
							alert("일촌평 등록 실패");
						}
					},
					error:function() {
						alert("일촌평 등록 에러");
					}
				});
			});
			
			$(".friendReviewDeleteBtn").on("click", function(){
				
				var id = $(this).data("friend-id"); //일촌평 작성자
				
				$.ajax({
					type:"get",
					url:"/post/friend_review/delete",
					data:{"id":id},
					success:function(data) {
						if(data.result == "success"){
							location.reload();
						}else {
							alert("일촌평 삭제 실패");
						}
					},
					error:function() {
						alert("일촌평 삭제 에러");
					}
						
					
				});
			});
		
		});
	</script>
</html>