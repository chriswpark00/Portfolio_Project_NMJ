<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>놀먹자~!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="favicon.ico">

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

<!-- Modernizr JS -->
<script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>
<style>
html{
	font-family: godic330;
}

</style>

</head>
<body>
	<jsp:include page="storeHeader.jsp"></jsp:include>
	<div id="fh5co-intro-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2>내 매장 리뷰보기</h2>
					<p>손님들이 내 매장에 쓴 리뷰를 보실 수 있습니다.</p>
				</div>
			</div>
		</div>
	</div>
	<!-- end fh5co-intro-section -->
	<div class="container">


		<div class="col-lg-12">
			<div class="bs-component">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">No.</th>
							<th scope="col">회원 ID</th>
							<th scope="col">내용</th>
							<th scope="col">평점</th>
							<th scope="col">조회수</th>
							<th scope="col">등록일</th>
						</tr>
					</thead>
					<tbody>
					
						<c:forEach var="list" items="${list }" varStatus="status">
							<c:choose>
							<c:when test="${list.review_rate le 2 }">
								<tr class="table-danger">
							</c:when>
							<c:otherwise>
								<tr>
							</c:otherwise>							
							</c:choose>							
								<td>${status.count }</td>
								<td>${list.mb_id }</td>
								<td><a href="${pageContext.request.contextPath}/community/communityView.nmj?review_uid=${list.review_uid}">${list.review_content }</a></td>
								<td>${list.review_rate }</td>
								<td>${list.review_viewCount }</td>
								<td>${list.review_date }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- /example -->
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>

	
</body>
</html>

