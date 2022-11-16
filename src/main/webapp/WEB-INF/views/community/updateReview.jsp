<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커뮤니티 - 리뷰수정</title><link rel="shortcut icon" href="favicon.ico">

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
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootswatch.css">

<!-- 새힘 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/myCSS_sam.css">

<!-- Modernizr JS -->
<script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>
<script src="//cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script>
<script src="js/jquery.js"></script>
<script>
function chkSubmit(){
	var editor_val = CKEDITOR.instances.editor1.document.getBody().getChild(0).getText() ;
    
	if (editor_val.trim() == '') {
		alert('글을 작성해주세요!') ;
		return false ;
	}
	frm = document.forms["frm"];
	var review_rate = frm["review_rate"].value.trim();
	if(review_rate == 0){
		alert("평점을 입력하세요");
		return false;
	}
	
	return true;
}
</script>

<c:choose>
	<c:when test="${sessionScope.mb_uid == null || empty sessionScope.mb_uid}">
		<script>
			alert("로그인을 하지 않으셨거나 권한이 없는 사용자 또는 자동 로그아웃 되었습니다. 로그인 해주세요.");
			location.href = "${pageContext.request.contextPath}/member/main.nmj";
		</script>
	</c:when>
</c:choose>

</head>
<body>
	<header>
		<div class="container text-center headerContainer">
				<!-- if(Session.getAttribute("mb_uid") == null) { -->
				<div id="login_signUp">
					<span id="login">로그인</span>
					<span class="line">|</span>
					<span id="signup">회원가입</span>
				</div>
				<!-- } else { -->
				<div id="logout_mypage" style="display: none;">
					<span id="logout">로그아웃</span>
					<span class="line">|</span>
					<span id="mypage">마이페이지</span>
				</div>
				<!-- } -->
				
				<div class="fh5co-navbar-brand">
					<a href="main.nmj"><img id="logo" src="../img/logo/nmj_logo.jpg"></a>
				</div>
			<nav id="fh5co-main-nav" role="navigation">
				<ul>
					<li><a href="findStore.nmj?store_type=1">놀자</a></li>
					<li><a href="findStore.nmj?store_type=2" >먹자</a></li>
					<li><a href="findStore.nmj?store_type=3">자자</a></li>
					<li><a href="communityList.nmj" class="active">떠들자</a></li>
					
				</ul>
			</nav>
		</div>
	</header>

	<div id="fh5co-intro-section">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2>리뷰수정</h2>
				</div>
			</div>
	</div>
	<!-- end fh5co-intro-section -->
	
	<div class="div-relative">
		<div class="write_container">
			<form name="frm" method="post" action="updateReviewOk.nmj" onSubmit="return chkSubmit()">
				
				<input id="review_uid" type="hidden" name="review_uid" value="${dto.review_uid }" />
				
				<b>작성자</b> ${member.mb_id }
				<input id="mb_uid" type="hidden" name="mb_uid" value="${member.mb_uid }" />
				
				<br><br>
				
				<b>리뷰할 매장</b>
				<select name="store_uid" class="custom-select" style="width: 300px;">
					<c:forEach var="store" items="${stores}">
			  		<option value="${store.store_uid }">${store.store_name }</option>
			  		</c:forEach>
		  		</select>
		  		
		  		<br><br>
				
				<textarea name="review_content" id="editor1">${dto.review_content }</textarea>
				<script>
					CKEDITOR.replace('editor1', {
						allowedContent: true,
						width: '100%',
						height: '600px'
					});
				</script>
				<br><br>
				
				<div>
					<b>나의 평점은?</b>
					<p id="star_grade">
				        <a value="1">★</a>
				        <a value="2">★</a>
				        <a value="3">★</a>
				        <a value="4">★</a>
				        <a value="5">★</a>
					</p>
				</div><br><br>
				
				<input id="review_rate" type="hidden" name="review_rate" value="0" />
				<button class="btn btn-primary btn-lg" type="submit">수정 완료</button>
				
			</form>
			<br><br>
			<button class="btn btn-secondary btn-lg" onclick="history.back()">뒤로가기</button>
		</div>
	</div>
	
	<br><br>
	
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
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	
	<script>
        $('#star_grade a').click(function(){
            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            var length = $(this).addClass("on").prevAll("a").addClass("on").length;
            $("#review_rate").attr('value', length+1);
            return false;
        });
	</script>
	
</body>
</html>