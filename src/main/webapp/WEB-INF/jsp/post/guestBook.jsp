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
			<div id="left-box" class="box-border pt-3">
				<!-- 방문자 수 -->
				<div id="visitor" class="d-flex justify-content-center">
					<div class="text-danger">TODAY 999</div>
					<div>&nbsp; | TOTAL 99,999</div>
				</div>
				
				<!-- 프로필 이미지 -->
				<div id="profileImage" class="text-center mt-4">
					<img height="200" width="250" src="https://i.pinimg.com/564x/c9/cf/b7/c9cfb77eb604e3b3d95eca2b4faa7a2e.jpg">
				</div>
				
				<!-- 프로필 아래 글쓰기 -->
				<div id="profileContent" class="text-center mt-5">
					<strong>today is...</strong>&nbsp;&nbsp;&nbsp;&nbsp;<i class="bi bi-brightness-high" style="font-size: 20px;"></i>&nbsp;기분좋음
					<div id="content" class="mt-5">노는게 제일 좋아~~</div>
				</div>
			</div>
			
			<!-- 방명록 -->
			<div id="center-box" class="box-border">
				
				<!-- 방명록 쓰기 -->
				<i class="bi bi-pencil-square" style="font-size: 30px;"></i>
				
				<!--  작성자 -->
				<div id="center-box-guest" class="d-flex mt-3 justify-content-between">
					<div class="ml-3">
						No1. 박일촌 <i class="bi bi-house-door-fill text-warning" style="font-size: 20px;"></i>
						(2022.02.28 21:20)
					</div>
					<div class="mt-1 text-dark mr-3"><a href="#" style="text-decoration:none">삭제</a></div>
				</div>
				
				<!--방명록 -->
				<div id="guestbook-box" class="mt-2">
					우리 언제 만나ㅠㅠㅠㅠㅠ
				</div>
				
				<!--  작성자 -->
				<div id="center-box-guest" class="d-flex mt-3 justify-content-between">
					<div class="ml-3">
						No1. 박일촌 <i class="bi bi-house-door-fill text-warning" style="font-size: 20px;"></i>
						(2022.02.28 21:20)
					</div>
					<div class="mt-1 text-dark mr-3"><a href="#" style="text-decoration:none">삭제</a></div>
				</div>
				
				<!--방명록 -->
				<div id="guestbook-box" class="mt-2">
					우리 언제 만나ㅠㅠㅠㅠㅠ
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
				
				location.href="/main/mini_home_view";
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