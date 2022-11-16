<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커뮤니티 - 리뷰 상세보기</title>

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
function chkDelete(uid){

	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'deleteReview2.nmj?review_uid=' + uid;
	}
}

function chkSubmit(){
	frm = document.forms["frm"];
	
	var reply_content = frm["reply_content"].value.trim();

	if(reply_content == ""){
		alert("내용을 입력하세요");
		return false;
	}

	return true;
}
</script>

<body>

	<jsp:include page="normalHeader.jsp"></jsp:include>
	
	<div id="fh5co-intro-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2>리뷰 상세보기</h2>
				</div>
			</div>
		</div>
	</div>
	
	<div class="div-relative">
	<div class="show_list_container">
	
			
	<div style="text-align:left;">
	<table>
	<tr>
	<tr>
		<td style="width:10%; background-color: white"><b>작성자</b></td>
		<td style="width:76%; background-color: white">${dto.mb_id }</td>
	</tr>
	<tr>
		<td style="width:10%; background-color: white"><b>내용</b></td>
		<td style="width:60%; background-color: white">${dto.review_content }</td>
	</tr>
	<tr>
		<td style="width:10%; background-color: white"><b>조회수</b></td>
		<td style="width:60%; background-color: white">${dto.review_viewCount }</td>
	</tr>
	<tr>
		<td style="width:10%; background-color: white"><b>작성일</b></td>
		<td style="width:60%; background-color: white">${dto.review_date }</td>
	</tr>
	</table>


	<c:choose>
	<c:when test="${sessionScope.mb_uid != null }">
    <button class="btn btn-danger btn-sm" onclick="location.href='reportReview2.nmj?review_uid=${dto.review_uid}'">신고하기</button>
    </c:when>
    </c:choose>
    <button class="btn btn-warning btn-sm" onclick="location.href='communityList2.nmj'">목록보기</button>

	<c:choose>
    <c:when test="${sessionScope.mb_uid == dto.mb_uid }">
	    <button class="btn btn-success btn-sm" onclick="location.href='updateReview2.nmj?review_uid=${dto.review_uid}&mb_uid=${sessionScope.mb_uid}'">수정하기</button>
	    <button class="btn btn-info btn-sm" onclick="chkDelete(${dto.review_uid })">삭제하기</button>
	</c:when>
	</c:choose>

    <c:choose>
 	<c:when test="${sessionScope.mb_uid != null }">
    	<button class="btn btn-secondary btn-sm" onclick="location.href='writeReview2.nmj?mb_uid=${sessionScope.mb_uid}'">작성하기</button>
    </c:when>
    </c:choose>
    
    </div>
    <br><br><br>


<div class="replyContainer">
	<h4><b>댓글 목록</b></h4>
	
	<c:choose>
	<c:when test="${sessionScope.mb_uid != null }">
		<form name="frm" class="form-inline my-2 my-lg-0" action="writeReply2.nmj" method="post" onSubmit="return chkSubmit()">
			<input type="hidden" name="mb_uid" value="${sessionScope.mb_uid}"/> 
					<input type="hidden" name="review_uid" value="${dto.review_uid }"/> 
			<input class="form-control mr-sm-2" type="text" name="reply_content" style="width:100%"/>
			<button class="btn btn-secondary btn-lg" type="submit">등록</button>
		</form>
	<br>
	</c:when>
	</c:choose>

    <c:choose>
	<c:when test="${empty list || fn.length(list) == 0 }">
		<h4>첫번째 댓글을 남겨보세요!</h4>
	</c:when>
	
	<c:otherwise>
	    <table>
			<c:forEach var="reply" items="${list}">
			<tr>
				<c:choose>
				<c:when test="${reply.reply_ban == 0 }">
				<td style="background-color: white">
				<b>${reply.mb_id }</b><br>
				${reply.reply_content }<br>
				<p style = "text-align : right; font-size: 0.8em;">${reply.reply_date }</p>
				
				<c:choose>
		 		<c:when test="${sessionScope.mb_uid != null }">
				<button class="btn btn-outline-danger btn-sm" onclick="location.href='reportReply2.nmj?reply_uid=${reply.reply_uid}&review_uid=${dto.review_uid}'">신고하기</button>
				</c:when>
				</c:choose>	
					
				<c:choose>
    			<c:when test="${sessionScope.mb_uid == reply.mb_uid }">
					<button class="btn btn-outline-info btn-sm" onclick="location.href='deleteReply.nmj?reply_uid=${reply.reply_uid}&review_uid=${dto.review_uid}'">삭제하기</button>
				</c:when>
				</c:choose>
				
				</td>
				</c:when>
				<c:otherwise>
				<td style="background-color: white">관리자에 의해 삭제된 댓글입니다.</td>
				</c:otherwise>
				</c:choose>
			</tr>
			</c:forEach>
		</table>
	</c:otherwise>
	</c:choose>
    

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