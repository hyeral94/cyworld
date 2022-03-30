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
			<div id="left-box" class="box-border pt-3">
				<!-- 방문자 수 -->
				<div id="visitor" class="d-flex justify-content-center">
					<div class="text-danger">TODAY ${todayCount }</div>
					<div>&nbsp; | TOTAL ${totalCount }</div>
				</div>
				
				<!-- 프로필 이미지 -->
				<div id="profileImage" class="text-center mt-4">
					<img height="200" width="250" src="${settingProfileImage.imagePath }">
				</div>
				
				<!-- 프로필 아래 글쓰기 -->
				<div id="profileContent" class="text-center mt-5">
					<strong>today is...</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${setting.motion }
					<div id="content" class="mt-5">${setting.content }</div>
				</div>
			</div>
			
			<!-- 방명록 -->
			<div id="center-box" class="box-border">
	
			<!-- 방명록 쓰기 -->
			<a class="text-dark" href="#" data-toggle="modal" data-target="#exampleModalCenter"><i class="bi bi-pencil-square" style="font-size: 30px;"></i></a>
			

			<!-- 방명록 입력 성공 시 d-none -->
			<div id="guestListBox" class="mt-3" style="overflow:auto; width:750px; height:550px;">
				
				<c:forEach var="guestBook" items="${guestBookList }">
				<!-- 방명록 작성자 정보 -->
				<div style="width:700px; height:30px; background-color:#FAECC5;">
					<div class="d-flex justify-content-between">				
						<div> No. ${guestBook.id } <a href="#" style="text-decoration-line: none; color: inherit;"><b>${guestBook.userName }</b></a> 
	               		(<fmt:formatDate value="${guestBook.createdAt }" pattern="yyyy-MM-dd HH:mm:ss" />)</div>
					
						<!-- 방명록 삭제 -->
						<div class="guestBookDeleteBtn" data-friend-id="${guestBook.id }"><a href="#" style="text-decoration-line: none; color: inherit;">삭제</a></div>
						<!-- 방명록 삭제 -->					
					</div>
				</div>
				<!-- 방명록 작성자 정보 -->
		
				<!-- 방명록 작성 내용 -->
				<div id="guestbook-box">
					${guestBook.content }
				</div>
				<!-- 방명록 작성 내용 -->
				
				<!-- 방명록 사이 여백 --><div class=mt-3></div><!-- 방명록 사이 여백 -->
				</c:forEach>
			</div>
			

			</div>
			<!-- 방명록 -->
			
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
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	    
	      <div class="modal-body justify-content-end">
	        <textarea class="form-control" rows="4" cols="3" placeholder="방명록 남기기" id="guestBookInput"></textarea>
	        <button type="button" class="btn btn-primary" data-user-id="${targetUserId}" id="guestBookUploadBtn">확인</button>
	      </div>
	     	      			
	    </div>
	  </div>
	</div>

</body>

	<script>
		$(document).ready(function(){
				
			$("#guestBookUploadBtn").on("click", function(){
	
				var content = $("#guestBookInput").val(); //입력한 방명록
				var userId = $(this).data("user-id"); // 현재 로그인 한 미니홈피 주인
				
				if(content == null || content == ""){
					alert("내용을 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/post/guest_book/create",
					data:{"content":content,"targetUserId":userId},
					success:function(data) {
						if(data.result == "success"){
							$("#guestList").removeClass("d-none");
							location.reload();
						}else {
							alert("방명록 쓰기 실패");
						}
					},
					error:function() {
						alert("방명록 쓰기 에러");
					}
				});
			});
			
			$(".guestBookDeleteBtn").on("click", function(){

				var id = $(this).data("friend-id");
				
				$.ajax({
					type:"get",
					url:"/post/guest_book/delete",
					data:{"id":id},
					success:function(data) {
						if(data.result == "success"){
							location.reload();
						}else {
							alert("방명록 삭제 실패");
						}
					},
					error:function() {
						alert("방명록 삭제 에러");
					}
					
				});
				
			});
		
			
		});
	</script>
	
</html>