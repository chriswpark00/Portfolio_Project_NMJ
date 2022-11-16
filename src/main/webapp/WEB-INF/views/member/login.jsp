<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입 - 매장회원</title>
<link rel="shortcut icon" href="favicon.ico">

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


<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/login.css">

<!-- Modernizr JS -->
<script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>
</head>
<body>
<script>
// form 검증
function chkSubmit(){
	
	
}
</script>

	<jsp:include page="normalHeader.jsp"></jsp:include>

	
	<form action="loginOk.nmj">
		<div class="loginContainer">
		
			<div class="formContainer">
				<div>
					<input type="text" name="mb_id" placeholder="아이디를 입력하세요">		
				</div>
				
				<div>
					<input type="password" name="mb_pw" placeholder="비밀번호를 입력하세요">		
				</div>
				
			
				<div>
					<button class="loginButton" type="submit">로그인</button>
					<div class="findIdPw">
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/member/findIdPw.nmj'">ID | PW 찾기</button>
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/member/signUpType.nmj'">회원가입</button>
					</div>
				</div>	
			</div>
		</div>
	</form>
	
	
	
	
	<!-- footer -->
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
	</script>
	

</body>
</html>