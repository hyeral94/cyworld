<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		
			<!-- 사진첩 목록 -->
			<div id="left-box" class="box-border pt-3">
				<div class="text-primary mt-3"><h4>MY PHOTOALBUM</h4></div>
				<hr>
				<div id="diaryListBtn"><i class="bi bi-journal-album"></i>&nbsp;사진첩</div>
			</div>
			<!-- 사진첩 목록 -->
			
			<!-- 사진첩 리스트 -->
			<div id="center-box" class="box-border">
			
				<!-- 사진 작성 버튼 -->
				<div align="right" class="mr-5" href="#" data-toggle="modal" data-target="#exampleModalCenter">
					<button type="button">사진첩 작성</button>
				</div>
				<!-- 사진 작성 버튼 -->
				
				<!-- 사진 제목, 작성자 이름, 날짜, 컨텐츠 -->
				<div style="overflow:auto; width:735px; height:580px;">
				<c:forEach var="photoAlbums" items="${photoAlbum }" >
					<div class="mt-3" style="width:700px; height:30px; background-color:#FAECC5;">
						<div class="text-center">${photoAlbums.subject }</div>
					</div>
					
					<div class="d-flex justify-content-between" style="width:700px; height:30px;">
						<div>${photoAlbums.userName } &nbsp; <fmt:formatDate value="${photoAlbums.createdAt }" pattern="yyyy-MM-dd HH:mm:ss" /></div>
						
						<!-- 사진 삭제 -->
						<div><i class="bi bi-trash" style="font-size: 18px;" id="deleteImgBtn" data-user-id="${photoAlbums.id }"></i></div>
						<!-- 사진 삭제 -->
					</div>
					
					<div style="width:700px; height:350px;">
						<img src="#">
					</div>
					<hr>
					<div>${photoAlbums.content }</div>
				</c:forEach>
				</div>	
			</div>
			<!-- 사진첩 리스트 -->
			
			
			<!-- 카테고리 -->
			<div id="right-box">
				<div class="side-box-border text-center text-white"><a href="/main/mini_home_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">홈</div></a></div>
				<div class="side-box-border text-center mt-1 text-white"><a href="/post/guest_book_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">방명록</div></a></div>
				<div class="side-box-border text-center mt-1 text-white"><a href="/post/diary_create_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">다이어리</div></a></div>
				<div class="side-box-border text-center mt-1"><a href="/post/photo_album_create_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">사진첩</div></a></div>
				<div class="side-box-border text-center mt-1 text-white"><a href="/post/setting_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">설정</div></a></div>
			</div>
			<!-- 카테고리 -->
			
		</section>
	</div>
	
	<c:import url ="/WEB-INF/jsp/include/footer.jsp" />
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      
	      	<!-- 사진첩 작성 및 업로드 -->	
		    <div class="modal-body justify-content-end">
		   		<textarea class="form-control" rows="1" cols="3" placeholder="제목 작성" id="subjectInput"></textarea>
			    <textarea class="form-control mt-1" rows="5" cols="3" placeholder="컨텐츠 작성" id="contentInput"></textarea>
			    <div class="d-flex justify-content-between mt-2">
				    <input type="file" id="fileInput">
				    <button type="button" class="btn btn-primary" data-user-id="${userId}" id="photoAlbumBtn">확인</button>
			    </div>
		    </div>
		    <!-- 사진첩 작성 및 업로드 --> 	
	      		
	    </div>
	  </div>
	</div>
	<!-- Modal -->
	
</body>

	<script>
	
		$(document).ready(function(){
			
			// 사진첩 작성
			$("#photoAlbumBtn").on("click", function(){
				
				let subject = $("#subjectInput").val();
				let content = $("#contentInput").val();
				
				if(subject == "" || subject == null){
					alert("제목을 입력하세요.");
					return;
				}

				// 파일 유효성 검사
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 선택하세요");
					return;
				}
			
				var formData = new FormData();
				formData.append("subject", subject);
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				
				$.ajax({
					type:"post",
					url:"/post/photo_album/create",
					data:formData,
					enctype:"multipart/form-data", 
					processData:false, 
					contentType:false, 
					success:function(data) {
						if(data.result == "success"){
							location.reload();
						}else {
							alert("사진첩 작성 실패");
						}
					},
					error:function() {
						alert("사진첩 작성 에러");
					}
				});
				
	
			
			});
			
			// 사진첩 댓글 작성
			$("#photoReviewBtn").on("click", function(){
				
				var content = $("#photoReviewInput").val(); // 입력한 일촌평
				var userId = $(this).data("user-id");//현재 로그인한 미니홈피 주인
		
				if(content == null || content == ""){
					alert("내용을 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/post/photo_album_review/create",
					data:{"content":content, "targetUserId":userId},
					success:function(data) {
						if(data.result == "success"){
							location.reload();
						}else {
							alert("댓글 등록 실패");
						}
					},
					error:function() {
						alert("댓글 등록 에러");
					}
				});
			});
			
			// 사진 삭제
			$("#deleteImgBtn").on("click", function(){

				var id = $(this).data("user-id");
					
				$.ajax({
					type:"get",
					url:"/post/photo_album/delete",
					data:{"id":id},
					success:function(data) {
						if(data.result == "success"){
							location.reload();
						}else {
							alert("사진 삭제 실패");
						}
					},
					error:function() {
						alert("사진 삭제 에러");
					}
						
				});
					
			});
	
		});
	
	
	</script>
</html>