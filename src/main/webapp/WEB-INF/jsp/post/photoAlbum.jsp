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
				<a href="#" style="text-decoration-line: none; color: inherit;" id="photoList"><i class="bi bi-folder"></i>&nbsp;사진</a>
			</div>
	
			
		
			<div id="center-box" class="box-border">
				
				<!-- 사진 업로드 -->
				<div id="photoAlbumPage" align="right">
					<a class="text-dark photoUploadBtn" style="text-decoration-line:none; color:inherit;" href="#" data-toggle="modal" data-target="#exampleModalCenter"><i class="bi bi-camera"></i>&nbsp;사진 올리기</a>
				</div>	
				
				<!-- 사진첩 피드 -->
				<div class="mt-2" style="width:735px; height:30px; background-color:#FAECC5;"></div>
				
				
		
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
			
		});

	</script>


</body>
</html>