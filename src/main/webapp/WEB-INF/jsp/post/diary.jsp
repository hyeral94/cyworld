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
		
			<!-- 다이어리 목록 -->
			<div id="left-box" class="box-border pt-3">
				<div class="text-primary mt-3"><h4>MY DIARY</h4></div>
				<hr>
				<div id="diaryListBtn"><i class="bi bi-journal-text"></i>&nbsp;다이어리</div>

				<div id="diarywritingBtn" style="position : absolute; clear : left; float : left; width : 300px; height : 300px; left : 8; bottom : 0px;">
					<button type="button">다이어리 작성</button>
				</div>
					
		
			</div>
			<!-- 다이어리 목록 -->
			
			
			<div id="center-box" class="box-border">
				<!-- 다이어리 작성 -->
				<div id="diarywriting" class="d-none">
					<div style="width:735px; height:30px; background-color:#FAECC5;">
					Today History
					</div>
					<!-- 다이어리 입력 상자 -->
					<div class="d-flex mt-4">제목 : &nbsp;&nbsp;<input type="text" class="form-control col-11" id="subjectInput"></div>
					<div class="mt-3">
						<textarea class="form-control" style="border: 1" rows="10" cols="50" placeholder="내용을 입력하세요." id="contentInput"></textarea>
					</div>
					<!-- 다이어리 입력상자 -->
					
					<!-- 다이어리 저장 -->
					<div class="d-flex mt-4 justify-content-end">				
						<button type="button" class="btn btn-primary form-control" style="width:80px; height:40px;" data-user-id="${userId}" id="addDiaryBtn">저장</button>
					</div>
					<!-- 다이어리 저장 -->
				</div>
				<!-- 다이어리 작성 -->
				
				<!-- 로그인 사용자가 현재 미니홈피 주인이아닌경우 -->
				<div id="warningBox"class="mt-5 text-center d-none" data-user-id="${userId }">
					<i class="bi bi-exclamation-circle" style="font-size: 20px;"></i>
					접근할 수 없는 페이지입니다.
				</div>
				<!-- 로그인 사용자가 현재 미니홈피 주인이아닌경우 -->
								
				<!-- 다이어리 리스트 -->
				<div style="overflow:auto; width:735px; height:580px;">
				<div id="diaryList" class="d-none">
				<c:forEach var="diarys" items="${diary }" >
				
					<div class="text-center mt-1" style="width:700px; height:30px; background-color:#FAECC5;">${diarys.subject }</div>
					<div class="d-flex justify-content-between mt-2" style="width:700px;">
						<div>${diarys.userName }</div>
						<div><fmt:formatDate value="${diarys.createdAt }" pattern="yyyy-MM-dd HH:mm:ss" /></div>
					</div>
					<div>
						<div class="diaryBox mt-2">${diarys.content }</div>
					</div>
					<div class="d-flex justify-content-end" style="width:700px;">
						<div><button type="button" class="diaryDeleteBtn btn formcontrol btn-primary mt-2" data-diary-id="${diarys.id }">삭제</button></div>
					</div>
					
				</c:forEach>
				</div>
				</div>
				<!-- 다이어리 리스트 -->
				
			</div>	
		
			
		
			
			<!-- 카테고리 -->
			<div id="right-box">
				<div class="side-box-border text-center bg-primary text-white"><a href="/main/mini_home_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">홈</div></a></div>
				<div class="side-box-border text-center mt-1 bg-primary text-white"><a href="/post/guest_book_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">방명록</div></a></div>
				<div class="side-box-border text-center mt-1 bg-primary"><a href="/post/diary_create_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">다이어리</div></a></div>
				<div class="side-box-border text-center mt-1 bg-primary text-white"><a href="/post/photo_album_create_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">사진첩</div></a></div>
				<div class="side-box-border text-center mt-1 bg-primary text-white"><a href="/post/setting_view?userId=${userId}" style="text-decoration-line: none; color: inherit;"><div class="mt-1">설정</div></a></div>
			</div>
			<!-- 카테고리 -->
			
		</section>	
	</div>
	
	<c:import url ="/WEB-INF/jsp/include/footer.jsp" />

</body>
	<script>
		$(document).ready(function(){
			
			$("#diarywritingBtn").on("click", function(){
				
				$("#diarywriting").removeClass("d-none");
				$("#diaryList").addClass("d-none");
			});
			
			
			$("#diaryListBtn").on("click", function(){
				
				$("#diarywriting").addClass("d-none");
				$("#diaryList").removeClass("d-none");
			});
			
			// 다이어리 작성
			$("#addDiaryBtn").on("click", function(){
				
				let subject = $("#subjectInput").val();
				let content = $("#contentInput").val();
				let userId = $(this).data("user-id"); 
				
				if(subject == "" || subject == null){
					alert("제목을 입력하세요.");
					return;
				}
				
				if(content == "" || content == null){
					alert("내용을 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/post/diary/create",
					data:{"subject":subject, "content":content, "userId":userId},
					success:function(data) {
						if(data.result == "success"){
							location.reload();
						}else {
							alert("다이어리 작성 실패");
						}
					},
					error:function() {
						alert("다이어리 작성 에러");
					}
				});
				
	
			
			});
			
			// 다이어리 삭제
			$(".diaryDeleteBtn").on("click", function(){
			
				var id = $(this).data("diary-id");
				
				$.ajax({
					type:"get",
					url:"/post/diary/delete",
					data:{"id":id},
					success:function(data) {
						if(data.result == "success"){
							location.reload();
						}else {
							alert("다이어리 삭제 실패");
						}
					},
					error:function() {
						alert("다이어리 삭제 에러 발생");
					}
				});
			});
		
		});
	
	</script>
</html>