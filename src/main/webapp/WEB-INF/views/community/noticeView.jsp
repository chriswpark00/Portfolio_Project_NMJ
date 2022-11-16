<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<c:choose>
		<c:when test="${dto.notice_type == 1 }">
			<title>커뮤니티 - 이벤트 상세보기</title>
		</c:when>
		<c:otherwise>
			<title>커뮤니티 - 공지사항 상세보기</title>
		</c:otherwise>
	</c:choose>

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

<body>

	<jsp:include page="normalHeader.jsp"></jsp:include>
	
	<div id="fh5co-intro-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<c:choose>
						<c:when test="${dto.notice_type == 1 }">
							<h2>이벤트 상세보기</h2>
						</c:when>
						<c:otherwise>
							<h2>공지사항 상세보기</h2>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	
	<div class="div-relative">
	<div class="show_list_container">
			
	<div style="text-align:left;">
	<table>
	<tr>
		<td style="width:10%; background-color: white"><b>제목</b></td>
		<td style="background-color: white">${dto.notice_subject }</td>
	</tr>
	<c:choose>
		<c:when test="${dto.notice_type == 1 }">
			<tr>
				<td style="width:15%; background-color: white"><b>이벤트시작</b></td>
				<td style="background-color: white">
				<fmt:parseDate var="parsedDate" value="${dto.notice_startDate}" pattern="yyyy-MM-dd HH:mm:ss.S"/>
					<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			<tr>
				<td style="width:15%; background-color: white"><b>이벤트종료</b></td>
				<td style="background-color: white">
				<fmt:parseDate var="parsedDate" value="${dto.notice_endDate}" pattern="yyyy-MM-dd HH:mm:ss.S"/>
					<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
		</c:when>
	</c:choose>
	
	<tr>
		<td style="width:15%; background-color: white"><b>내용</b></td>
		<td style="background-color: white">${dto.notice_content }</td>
	</tr>
	<tr>
		<td style="width:15%; background-color: white"><b>조회수</b></td>
		<td style="background-color: white">${dto.notice_viewCount }</td>
	</tr>
	<tr>
		<td style="width:15%; background-color: white"><b>작성일</b></td>
		<td style="background-color: white">${dto.notice_regDate }</td>
	</tr>
	</table>


    <button class="btn btn-warning btn-sm" onclick="location.href='communityList.nmj'">목록보기</button>
	</div>

    
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

</body>
</html>