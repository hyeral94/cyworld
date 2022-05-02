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
				<div class="text-primary mt-3"><h4>PHOTO ALBUM</h4></div>
				<hr>
				<div id="photoAlbumBtn"><i class="bi bi-folder"></i>&nbsp;사진</div>
			</div>
	
			
		
			<div id="center-box" class="box-border">
				
				<div id="photoAlbumList" class="d-none">
					<!-- 사진 업로드 -->
					<div id="photoAlbumPage" align="right">
						<a class="text-dark photoUploadBtn" style="text-decoration-line:none; color:inherit;" href="#" data-toggle="modal" data-target="#exampleModalCenter"><i class="bi bi-camera"></i>&nbsp;사진 올리기</a>
					</div>	
					<!-- 사진 업로드 -->
				
					<!-- 사진첩 피드 -->
					<div style="overflow:auto; width:735px; height:580px;">
						
						<!-- 타이틀 -->
						<c:forEach var="photoAlbums" items="${photoAlbum }" >
						<div class="d-flex">
						<div class="mt-2 text-center" style="width:680px; height:30px; background-color:#FAECC5;">${photoAlbums.subject }</div>
						<div class="mt-2 text-end" style="width:20px; height:30px; background-color:#FAECC5;"><i class="deleteBtn bi bi-x-circle"data-photo-id="${photoAlbums.id }"></i></div>
						</div>
						
						<div class="d-flex justify-content-between mt-1" style="width:700px;">
							<div>${photoAlbums.userName }</div>
							<div><fmt:formatDate value="${photoAlbums.createdAt }" pattern="yyyy-MM-dd HH:mm:ss" /></div>
						</div>
						<!-- 타이틀 -->
						
						<!-- 이미지 -->
						<div>
							<img class="mt-2" height="300" width="700" src="${photoAlbums.imagePath }">
						</div>
						<!-- 이미지 -->
						
						<!-- 컨텐츠 -->
						<div class="d-flex justify-content-between" style="width:700px;">
							<div class="mt-1">${photoAlbums.content }</div>
						</div>
						</c:forEach>
						<hr>
						<!-- 컨텐츠 -->
						
					
						
						<!-- 댓글 리스트 -->
						<div class="d-flex justify-content-between" style="width:700px;" id="photoAlbumReviewDelete">
						<c:forEach var="photoAlbumReviews" items="${photoAlbumReview }">
							
							<!-- 댓글 내용 -->	
							<div><b><a href="/main/mini_home_view?userId=${photoAlbumReviews.userId}" style="text-decoration-line:none; color:inherit;">${photoAlbumReviews.userName }</a></b> &nbsp; ${photoAlbumReviews.content }</div>
							<!-- 댓글 내용 -->
						
							<!-- 댓글 삭제 -->
							<div class="photoAlbumReviewDeleteBtn" data-friend-id="${photoAlbumReviews.id }"><a href="#" style="text-decoration-line:none; color:inherit;" class="text-white">삭제</a></div>
							<!-- 댓글 삭제 -->
						</c:forEach>
						</div>
						<!-- 댓글 리스트 -->
						
						
						<!-- 댓글 입력 -->
						<div class="d-flex mt-3">
									 	
						 	<input type="text" class="form-control" style="width:620px; height:40px;" id="contentInput">
						 	<button type="button" class="form-control btn btn-secondary" style="width:80px; height:40px;" data-user-id="${targetUserId}" id="photoAlbumReviewBtn">확인</button>
							
						</div>
						<!-- 댓글 입력 -->		
						
				
					<!-- 사진첩 피드 -->
					</div>
				</div>
			</div>
			
			
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
	    
	      <div class="modal-body">
	     	제목<input type="text" class="form-control" cols="2" id="subjectInput">
	        <textarea class="form-control mt-1" rows="5" cols="3" id="contentInput"></textarea>
	        <div class="d-flex justify-content-between">
	        	<input type="file" class="mt-2"  id="fileInput">
	        	<button type="button" class="btn mt-1 btn-primary" data-user-id="${userId}" id="photoAlbumUploadBtn">업로드</button>     
	      	</div>
	      </div>
	     	      			
	    </div>
	  </div>
	</div>

	<script>
		$(document).ready(function(){
			
			$("#photoAlbumBtn").on("click", function(){
				
				$("#photoAlbumList").removeClass("d-none");
			});
		
			// 사진 업로드
			$("#photoAlbumUploadBtn").on("click", function(){
			
				let subject = $("#subjectInput").val();
				let content = $("#contentInput").val().trim();
			
				// 파일 유효성 검사
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 선택하세요.");
					return;
				}
			
				var formData = new FormData();
				formData.append("content", content);
				formData.append("subject", subject);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					type:"post",
					url:"/post/photo_album/create",
					data:formData,
					enctype:"multipart/form-data", 
					processData:false, 
					contentType:false, 
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						}else {
							alert("사진첩 업로드 실패");
						}
					},
					error:function() {
						alert("사진첩 업로드 에러 발생");
					}
					
				});
			});
			
			// 사진첩 삭제
			$(".deleteBtn").on("click", function(){
			
				var id = $(this).data("photo-id");
				
				$.ajax({
					type:"get",
					url:"/post/photo_album/delete",
					data:{"id":id},
					success:function(data) {
						if(data.result == "success"){
							location.reload();
						}else {
							alert("사진첩 삭제 실패");
						}
					},
					error:function() {
						alert("사진첩 삭제 에러 발생");
					}
				});
			});
		
			// 사진첩 댓글
			$("#photoAlbumReviewBtn").on("click", function(){
				
				var content = $("#contentInput").val(); //입력한 방명록
				var userId = $(this).data("user-id"); // 현재 로그인 한 미니홈피 주인
				
				if(content == null || content == ""){
					alert("댓글 내용을 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/post/photo_album_review/create",
					data:{"content":content,"targetUserId":userId},
					success:function(data) {
						if(data.result == "success"){
							location.reload();
						}else {
							alert("댓글 쓰기 실패");
						}
					},
					error:function() {
						alert("댓글 쓰기 에러");
					}
				});
			});
			
			// 사진첩 댓글 삭제
			$(".photoAlbumReviewDeleteBtn").on("click", function(){
				
				var id = $(this).data("friend-id"); //일촌평 작성자
				
				$.ajax({
					type:"get",
					url:"/post/photo_album_review/delete",
					data:{"id":id},
					success:function(data) {
						if(data.result == "success"){
							location.reload();
						}else {
							alert("댓글 삭제 실패");
						}
					},
					error:function() {
						alert("댓글 삭제 에러");
					}
						
					
				});
			});
		
		});
	</script>


</body>
</html>