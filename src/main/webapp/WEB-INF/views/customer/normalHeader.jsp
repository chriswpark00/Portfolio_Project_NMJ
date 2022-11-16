<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<link rel="shortcut icon" href="favicon.ico">



<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/owl.theme.default.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">



<header>
		<div class="container text-center headerContainer">
			<c:choose>
				<c:when test="${sessionScope.mb_uid eq null}">
					<div id="login_signUp">
						<span id="login">로그인</span>
						<span class="line">|</span>
						<span id="signup">회원가입</span>
					</div>
				</c:when>
				<c:when test="${sessionScope.mb_uid != null }">
					<div id="logout_mypage">
						<span id="logout">로그아웃</span>
						<span class="line">|</span>
						<c:choose>
							<c:when test="${sessionScope.mb_type == 1 }">
								<span id="mypage">마이페이지</span>					
							</c:when>
							<c:when test="${sessionScope.mb_type == 2 }">
								<span id="storepage">매장페이지</span>
							</c:when>
							<c:when test="${sessionScope.mb_type == 3 }">
								<span id="adminpage">관리자페이지</span>
							</c:when>
						</c:choose>
					</div>
				</c:when>			
			</c:choose>

			<div class="fh5co-navbar-brand">
				<a href="${pageContext.request.contextPath}/member/main.nmj"><img id="logo" src="${pageContext.request.contextPath}/img/logo/nmj_logo.jpg"></a>
			</div>
			<nav id="fh5co-main-nav" role="navigation">
				<ul>
					<li><a id="1" href="${pageContext.request.contextPath}/member/main.nmj" class="active">메인</a></li>
					<li><a id="2" href="${pageContext.request.contextPath}/member/findStore.nmj?store_type=1">놀자</a></li>
					<li><a id="3" href="${pageContext.request.contextPath}/member/findStore.nmj?store_type=2">먹자</a></li>
					<li><a id="4" href="${pageContext.request.contextPath}/member/findStore.nmj?store_type=3">자자</a></li>
					<li><a id="5" href="${pageContext.request.contextPath}/community/communityList.nmj">떠들자</a></li>
				</ul>
			</nav>
		</div>
	</header>
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
	
	<!-- Main JS (Do not remove) -->
	
	<script>
	// 우리가 필요한 기능들 삽입
	$(document).ready(function(){
		
		$("#1").removeClass("active");
		$("#2").removeClass("active");
		$("#3").removeClass("active");
		$("#4").removeClass("active");
		$("#5").removeClass("active");
		$("#" + ${nav}).addClass("active");
		
		$("span#login").click(function (){
			location.href = "${pageContext.request.contextPath}/member/login.nmj";
		});

		$("span#signup").click(function (){
			location.href = "${pageContext.request.contextPath}/member/signUpType.nmj";
		});

		$("span#logout").click(function (){
			// 세션 삭제
			location.href = "${pageContext.request.contextPath}/member/logout.nmj";
		});
		
		$("span#mypage").click(function(){
			location.href="${pageContext.request.contextPath}/customer/cusMyPage.nmj";
		});	
		$("span#storepage").click(function(){
			location.href="${pageContext.request.contextPath}/store/storeMySpace.nmj";
		});
		$("span#adminpage").click(function(){
			location.href="${pageContext.request.contextPath}/admin/adminMember.nmj";
		});
	});
	</script>
</html>