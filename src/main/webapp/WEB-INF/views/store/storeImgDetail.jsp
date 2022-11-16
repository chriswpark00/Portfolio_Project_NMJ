<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 이미지 상세 페이지</title>
<!-- Animate.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/owl.theme.default.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/storeImgDetail.css">
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<!-- jQuery Easing -->
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
<!-- Owl carousel -->
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<!-- Stellar -->
<script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body>
	<header>
		<div class="container text-center">
			<div class="fh5co-navbar-brand">
				<a class="fh5co-logo" href="${pageContext.request.contextPath}/store/storeMySpace.nmj"><img
					src="${pageContext.request.contextPath}/img/logo/nmj_logo.jpg"
					style="width: 200px; height: 150px;" /></a>
			</div>
			<nav id="fh5co-main-nav" role="navigation">
				<ul>
					<li><a id="1" href="${pageContext.request.contextPath}/member/main.nmj">홈</a></li>
					<li><a id="2" href="${pageContext.request.contextPath}/customer/cusUpdateInfo.jsp?mb_uid=${sessionScope.mb_uid}">회원정보수정</a></li>
					<li><a id="3" class="active" href="storeMySpace.nmj?store_uid=${sessionScope.store_uid}">매장 공간 관리</a></li>
					<li><a id="4" href="storeMyFood.nmj?store_uid=${sessionScope.store_uid}">음식 메뉴 관리</a></li>
					<li><a id="5" href="storeMyReview.nmj?store_uid=${sessionScope.store_uid}">내 매장 리뷰보기</a></li>
					<li><a id="6" href="storeSettings.nmj?store_uid=${sessionScope.store_uid}">매장 정보 수정</a></li>
					<li><a id="7" href="storeSettingsRequest.nmj?store_uid=${sessionScope.store_uid}">매장 정보 수정 요청</a></li>
				</ul>
			</nav>
		</div>
	</header>
	
	<div id="mainbody">
		<c:forEach var="list" items="${spaceImg }">
			<div class="spacebox">
				<div>
					<img class="spaceboximg" src='${pageContext.servletContext.contextPath}/img/space/${list.space_img_sav }'>
				</div>
				<div >
					<div>${list.space_img_sav }</div>
				</div>
				<div class="deletebox">
					<button class="doDel outline-primary img_uid${list.space_img_uid }" onclick="location.href='storeMySpaceImgDelete.nmj?space_img_uid=${list.space_img_uid}&space_uid=${list.space_uid }'">삭제하기</button>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="clear"></div>
		<div class="imgInsertBox">
			<button id="imgInsert" class="btn btn-primary">사진 추가하기</button>
		</div>
	
	<footer>
		<div id="footer" class="fh5co-border-line">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<p>
							Copyright 2020 Team <a href="#">Q&A</a>. All Rights
							Reserved. <br>Made with <i class="icon-heart3 love"></i> by
							<a href="#" target="_blank">Korea IT Academy</a> /
							Images: <a href="https://www.pexels.com/" target="_blank">Pexels</a>
							&amp; <a href="http://plmd.me/" target="_blank">PLMD</a>
						</p>
						<p class="fh5co-social-icons">
							<a href="#"><i class="icon-twitter-with-circle"></i></a> <a
								href="#"><i class="icon-facebook-with-circle"></i></a> <a
								href="#"><i class="icon-instagram-with-circle"></i></a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	
</body>
<script>
$(document).ready(function(){
	 $("#imgInsert").click(function(){
		
		 window.open("storeMySpaceImgInsert.nmj?space_uid=${space_uid}" , "매장 이미지 넣기"	, "width=600, height=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
		 
	 }); 
 });
</script>

</html>