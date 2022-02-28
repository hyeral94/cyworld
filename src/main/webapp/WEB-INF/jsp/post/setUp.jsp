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
				<a href="#">로그아웃</a>
			</div>
		</header>
		
		<section class="d-flex">
		
			<!-- 편집 목록 -->
			<div id="left-box" class="box-border pt-3">
				<div class="text-primary mt-3"><h4>MY HOME SET UP</h4></div>
				<hr>
				<div class="mt-3"><a href="#">홈 화면 상단 소개말 바꾸기</a></div>
				<div class="mt-3"><a href="#">프로필 사진 바꾸기</a></div>
				<div class="mt-3"><a href="#">프로필 인사말 바꾸기</a></div>
			</div>
			
			
			<div id="center-box" class="box-border">
				<i class="bi bi-gear"  style="width:65px;"></i>
				홈 화면 상단 소개말 바꾸기
				<div class="d-flex mt-3">
				<input type="text" class="form-control" style="width:500px; height:50px;">
				<button type="button" class="btn btn-primary">확인</button>
				</div>
			</div>
		
			<!-- 카테고리 -->
			<div id="right-box">
				<button type="button" id="homeCategory" class="category btn" style="width:65px;">홈</button>
				<button type="button" id="guestBookCategory" class="category btn mt-3" style="width:65px;">방명록</button>
				<button type="button" id="setUpCategory" class="category btn mt-3" style="width:65px;">설정</button>
			</div>
			
		</section>	
	</div>
	
	<c:import url ="/WEB-INF/jsp/include/footer.jsp" />

</body>

	<script>
		$(document).ready(function(){
			
			$("#homeCategory").on("click", function(){
				
				location.href="/post/mini_home_view";
			});
		
			$("#guestBookCategory").on("click", function(){
				
				location.href="/post/guest_book_view";
			});
			
			$("#setUpCategory").on("click", function(){
				
				location.href="/post/set_up_view";
			});
			
		});
	</script>
	
</html>