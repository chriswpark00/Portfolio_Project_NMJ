<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이디 비밀번호 찾기</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootswatch.css">

<!-- 새힘 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/myCSS_sam.css">

<!-- Modernizr JS -->
<script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>
</head>
<script>
// form 검증
function chkSubmit1(){
	frm1 = document.forms["frm1"];
	
	var mb_id = frm1["mb_id"].value.trim();
	var mb_pw = frm1["mb_pw"].value.trim();
	var mb_name = frm1["mb_name"].value.trim();
	var mb_email = frm1["mb_email"].value.trim();
	
	if(mb_name == ""){
		alert("이름을 입력해주세요.");
		frm1["mb_name"].focus();
		return false;
	}
	if(mb_email == ""){
		alert("이메일을 입력해주세요.");
		frm1["mb_email"].focus();
		return false;
	}
	
	return true;
}

function chkSubmit2(){
	frm2 = document.forms["frm2"];
	
	var mb_id = frm2["mb_id"].value.trim();
	var mb_name = frm2["mb_name"].value.trim();
	var mb_email = frm2["mb_email"].value.trim();
	
	if(mb_id == ""){
		alert("아이디를 입력해주세요.");
		frm2["mb_id"].focus();
		return false;
	}
	if(mb_name == ""){
		alert("이름을 입력해주세요.");
		frm2["mb_name"].focus();
		return false;
	}
	if(mb_email == ""){
		alert("이메일을 입력해주세요.");
		frm2["mb_email"].focus();
		return false;
	}
	
	return true;
}
</script>
<body>

	<jsp:include page="normalHeader.jsp"></jsp:include>

	<div class="fh5co-parallax" style="background-image: url(images/hero-1.jpg);" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
         <div class="row">
            <div class="col-md-8 col-md-offset-2 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center fh5co-table">
               <div class="fh5co-intro fh5co-table-cell">
                  <h1 class="text-center">아이디 비밀번호 찾기</h1>
                  <p class="subtitle">"여러분들의 소중한 정보를 기억해주세요"</p>
               </div>
            </div>
         </div>
      </div>
   </div>
	
	<!-- end fh5co-intro-section -->
	
	<div class="div-relative" style="width: 100%; height: auto; text-align: center;">
	       <div class="find_info_container">
				<form name="frm1" id="find_id_frm" method="post" action="findIdOk.nmj" onsubmit="return chkSubmit1()">
			       <div class="find_id">
			       	<h2>아이디 찾기</h2><br>
			       </div>
			       		<input name="mb_name" class="find_info form-control" type="text" placeholder="이름" required="required">
			       		<input name="mb_email" class="find_info form-control" type="text" placeholder="ex)  *****@example.com" required="required">
			       		<button type="submit" class="find_btn btn btn-primary">아이디 찾기</button>
				</form>
	       </div>
			
			<div class="find_info_container" style="margin-top: 100px;">
				<form name="frm2" id="find_pw_frm" method="get" action="findPwOk.nmj" onsubmit="return chkSubmit2()" >
					<div class="find_pw">
						<h2>비밀번호 찾기</h2><br>
					</div>
						<input name="mb_id" class="find_info form-control" type="text" placeholder="아이디" required="required">
						<input name="mb_name" class="find_info form-control" type="text" placeholder="이름" required="required">
						<input name="mb_email" class="find_info form-control" type="text" placeholder="ex)  *****@example.com" required="required">
						<button type="submit" class="find_btn btn btn-primary">비밀번호 찾기</button>
				</form>
			</div>
	</div>
	
	<br><br><br><br>
	
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

</body>
</html>