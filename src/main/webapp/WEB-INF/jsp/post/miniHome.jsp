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
		<header class="d-flex">
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
					<strong>today is...</strong>&nbsp;&nbsp;&nbsp;&nbsp;<i class="bi bi-brightness-high" style="font-size: 20px;"></i>&nbsp;기분좋음<br>
					노는게 제일 좋아~~
				</div>
			</div>
			
			<div id="center-box" class="box-border ">
				<!-- 최근 게시물 노출 -->
				<div id="uploadNews">
					<div class="text-primary">upload news</div>
					<hr>
					<div>
					<small>
						-제주도 여행 갔다 왔어요!<br>
						-코로나 언제 끝나냐...<br>
						-피부과 다녀온 후기</small>
					</div>
				</div>
				
				<!-- 미니룸 -->
				<div class="text-primary mt-3">mini room</div>
				<hr>
				<div id="mini-room" class="mini-room mt-3">
				<img width="700" height="200" src="https://post-phinf.pstatic.net/MjAyMDA5MjNfMiAg/MDAxNjAwNzk1NzYyNDE1.6BRm3eV7dWSVqf8sANtOWbHbTY058eRWJkhbXcqTIecg.cZWbwCf3geMLG-DuP5od_MyEVq5ZeSUL1Ys0A7InRZUg.JPEG/attachImage_3201238540.jpeg?type=w1200">
				</div>
				
				<!-- 일촌평 -->
				<div class="text-primary mt-3">what friends say~</div>
				<hr>
			 	박기석 오우야~<br>
			 	박솜탱 간식줘라 간식줘!!!<br>
			 	박혜경 집에 가고싶다....
			 	<div class="d-flex mt-3">
			 	<input type="text" class="form-control" style="width:700px; height:30px;">
			 	<button type="button" class="form-control btn btn-secondary" style="width:80px; height:30px;">확인</button>
				</div>
			</div>
		
			<div id="right-box" class="">
				<button id="btn" class="btn" style="width:65px;">홈</button>
				<button id="btn" class="btn mt-3" style="width:65px;">방명록</button>
				<button id="btn" class="btn mt-3" style="width:65px;">관리</button>
			</div>

		</section>
			
	</div>
	<c:import url ="/WEB-INF/jsp/include/footer.jsp" />

</body>
</html>