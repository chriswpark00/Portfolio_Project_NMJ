<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>놀먹자~!</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />


  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/storeDetail.css">
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<script>
	$(window).load(function(){
		var like = false;
		<c:choose>
			<c:when test="${empty like}">
				like = false;
				$("#likebutton i").addClass('far');
			</c:when>
			<c:when test="${not empty like }">
				like = true;
				$("#likebutton i").addClass('fas');
			</c:when>						
		</c:choose>
		
		$("#likebutton").on("click", function(){
			var url = "";
			if(like){ // 찜이 되어있을 때
				url = "/nmj/memberAjax/deleteLike";
			} else{ // 찜이 안되어 있을 때
				url = "/nmj/memberAjax/insertLike";
			}
			
			var mb_uid = ${sessionScope.mb_uid}*1;
			var store_uid = ${param.store_uid}*1;
			 $.ajax({
				 url : url,
				 type : "POST",
				 cache : false,
				 data : {
					 "mb_uid" : mb_uid,
					 "store_uid" : store_uid
				 },
				 success : function(data, status){
					if(status == "success"){
						if(like){ // 찜이 되어있을 때
							$("#likebutton i").addClass("far");
							$("#likebutton i").addClass("fa-heart");
							$("#likebutton i").removeClass("fas");
							$("#likebutton i").removeClass("fa-heart-broken");
							like = false;
						} else{ // 찜이 안되어있을 때
							$("#likebutton i").addClass("fas");
							$("#likebutton i").removeClass("far");
							like = true;
						}
					}
				 }
			 });
			
		});
		
		$("#likebutton").on("mouseenter", function(){
			if(like){
				$("#likebutton i").addClass("fa-heart-broken");
				$("#likebutton i").removeClass("fa-heart");
			}
		});
		$("#likebutton").on("mouseleave", function(){
			if(like){
				$("#likebutton i").addClass("fa-heart");
				$("#likebutton i").removeClass("fa-heart-broken");
			}
		});
		
	});
	</script>
	<style>
		.modal {
			display: none;
			position: fixed;
			z-index: 1;
			padding-top: 100px;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			overflow: scroll;
			background-color: rgb(0, 0, 0);
			background-color: rgba(0, 0, 0, 0.4);
		}
		
		.modal-content{
			position: relative;
			background-color: #fefefe;
			margin: auto;
			padding: 0;
			border: 1px solid #888;
			width: 50%;
			height: 800px;
			overflow: auto;
			box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
			-webkit-animation-name: animatetop;
			-webkit-animation-duration: 0.4s;
			animation-name: animatetop;
			animation-duration: 0.4s;
		}
		@-webkit-keyframes animatetop{
		from {top: -300px; opacity:0}
		to {top: 0; opacity:1}
		}
		
		@keyframes animatetop {
		from {top: -300px; opacity:0}
		to {top: 0; opacity:1}
		}
		
		
		.roomPicList {
			width: 100%;
			height: 400px;
			margin : 0px auto;
			margin-bottom: 20px;
		}
		
	</style>
	
	</head>
	<body>

<jsp:include page="normalHeader.jsp"></jsp:include>
		


	<c:choose>
		<c:when test="${list.store_type eq 1 }">
			<div class="fh5co-parallax" style="background-image: url(${pageContext.request.contextPath}/img/nol.jpg);" data-stellar-background-ratio="0.5">
		</c:when>
		<c:when test="${list.store_type eq 2 }">
			<div class="fh5co-parallax" style="background-image: url(${pageContext.request.contextPath}/img/muk.jpg);" data-stellar-background-ratio="0.5">
		</c:when>
		<c:when test="${list.store_type eq 3 }">
			<div class="fh5co-parallax" style="background-image: url(${pageContext.request.contextPath}/img/ja.jpg);" data-stellar-background-ratio="0.5">
		</c:when>
	</c:choose>
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center fh5co-table">
					<div class="fh5co-intro fh5co-table-cell">
						<h1 class="text-center">${list.store_name }</h1>
						<p>${list.store_address }</p>
					</div>
				</div>
			</div>
		</div>
	</div><!-- end: fh5co-parallax -->
	<div id="fh5co-contact-section">
		<div class="container">
			<div class="row">
				<div class="col-md-4 animate-box">
					<div id="storeInfomation">매장 정보 
						<c:if test="${sessionScope.mb_uid != null }">
							<div id="likebutton">
								찜<i class="fa-heart clear" style="font-size:20px; color:#F03962; margin-left:5px;"></i>
							</div>
						</c:if>
					</div>
					
					<ul class="contact-info">
						<li><i class="icon-table"></i>잔여석 : <b>${restSeat.count }</b></li>
						<li><i class="icon-phone2"></i>${list.store_tel }</li>
						<li><i class="icon-alarm"></i>${list.store_hours }</li>
						<li><i class="icon-star-full"></i>${list.totalAvg }</li>
						<c:choose>
							<c:when test="${list.store_type ne 3 }">
								<li><i class="icon-map3"></i><b id="menu">메뉴판 펼치기</b></li>
							</c:when>
							<c:otherwise>
								<li onclick="insertDetails()"><i class="icon-images"></i><b id="room">방 사진 보기</b></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${empty list.store_content }">
								<li><i class="icon-file-text2"></i>해당 매장의 상세설명이 없습니다.</li>
							</c:when>
							<c:otherwise>
								<li><i class="icon-file-text2"></i>${list.store_content }</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div class="col-md-8 animate-box">
					
						<div id="profileImg" class="col-md-12">
							<img src="${pageContext.request.contextPath}/img/store/${list.store_img_sav }">
						</div>

						<div class="col-md-12 reserveSubmit">
							<c:choose>
								<c:when test="${empty sessionScope.mb_uid }">
									<input type="submit" value="RESERVE" class="btn btn-primary" onclick="location.href = '${pageContext.request.contextPath}/member/login.nmj'">
								</c:when>	
								<c:otherwise>
									<input type="submit" value="RESERVE" class="btn btn-primary" onclick="location.href = '${pageContext.request.contextPath}/customer/cusReserve.nmj?store_uid=${store_uid }&store_type=${list.store_type }'">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		
		
		
			<div class="modalContainer">
		
	<c:choose>
		<c:when test="${list.store_type eq 3 }">
			<!-- 
				<c:forEach var="room" items="${roomMenu }">
					<div class="col-md-4 col-sm-6">
						<div class="menuPic">
							<c:choose>
								<c:when test="${empty room.space_img_sav }">
									<img src="${pageContext.request.contextPath}/img/space/spaceDefault.png">
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath}/img/space/${room.space_img_sav}">
								</c:otherwise>
							</c:choose>
						</div>
						
						<div class="menuName">
							<p>${room.space_name }</p>
						</div>
						
						<div class="menuPrice">
							<p>${room.space_price }원</p>
						</div>
					</div>	
				</c:forEach>
			 -->
		
		</c:when>
		<c:otherwise>
		
				<c:forEach var="menu" items="${foodMenu }">
					<div class="col-md-4 col-sm-6">
						<div class="menuPic">
							<c:choose>
								<c:when test="${empty menu.food_img_sav }">
									<img src="${pageContext.request.contextPath}/img/food/foodDefault.png">
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath}/img/food/${menu.food_img_sav}">
								</c:otherwise>
							</c:choose>
						</div>
						
						<div class="menuName">
							<p>${menu.food_name }</p>
						</div>
						
						<div class="menuPrice">
							<p>${menu.food_price }원</p>
						</div>
					</div>	
				</c:forEach>
		
		</c:otherwise>
	</c:choose>
	
	</div>
		
		
	<div class="clear" style="margin-bottom: 50px;"></div>
		
		
		
		
		
		
		
		
		

	<div class="mapContainer">
		<h2>매장 위치</h2>
		<%--
		<div id="map" class="fh5co-map animate-box" style="outline: 1px solid red"></div>
		 --%>
		
		<div id="kakaoMap" style="width:100%;height:500px;"></div>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a5aad8312e36b6cc723c425856d939c6"></script>
		
		
		 
		<script>
		var mapContainer = document.getElementById('kakaoMap'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(${list.store_lat}, ${list.store_long}), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	var markerImg = "${pageContext.request.contextPath}/img/Marker.png";
	
	var imageSrc = markerImg, // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(55, 60), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
	    markerPosition = new kakao.maps.LatLng(${list.store_lat}, ${list.store_long}); // 마커가 표시될 위치입니다

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition, 
	    image: markerImage // 마커이미지 설정 
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map); 
		</script>
		
		
	</div>
	<!-- END map -->





	
	
	
	
	
	
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
	<!-- Google Map -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<!-- Owl carousel -->
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/google_map.js"></script>
	<!-- Stellar -->
	<script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>

	<!-- Main JS (Do not remove) -->
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/js/storeDetailMenu.js"></script>


<div class="modal" id="modal-showImages">
	<div class="modal-content">
	</div>
</div>
<script>
$(document).ready(function(){
	<c:choose>
		<c:when test="${list.store_type eq 3 }">
			getJackson();
		</c:when>
	</c:choose>
});
var modal = $(".modal-content");
var showModal = document.getElementById("modal-showImages");
var jsonObj;
var l;
function getJackson(){
	$.ajax({
		url : "${pageContext.servletContext.contextPath}/memberAjax/roomList/${param.store_uid}",
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				jsonObj = data;
			}
		}
	});
	
}

function insertDetails(){
	jsonObj; // 배열
	l = jsonObj.length;
	var result = "";
	
	for(i = 0; i < l; i++){
		result += "<div class='col-md-4 col-sm-6' onclick='getImages(\""+ jsonObj[i].space_uid +"\")'>";
		result += "<div class='menuPic'>";
		if(jsonObj[i].space_images.length == 0){
			result += "<img src='${pageContext.request.contextPath}/img/space/spaceDefault.png'>";
		} else{
			result += "<img src='${pageContext.request.contextPath}/img/space/" + jsonObj[i].space_images[0] +"'>";
		}
		result += "</div>";
		
		result += "<div class='menuName'>";
		result += "<p>" + jsonObj[i].space_name + "</p>";
		result += "</div>";
		
		result += "<div class='menuPrice'>";
		result += "<p>" + jsonObj[i].space_price + "원</p>";
		result += "</div>";
		
		result += "</div>";
	}
	$("div.modalContainer").html(result);
}

function getImages(space_uid){
	showModal.style.display = "block";
	jsonObj;
	l = jsonObj.length;
	var images = [];
	for(i = 0; i < l; i++){
		if(jsonObj[i].space_uid == space_uid){
			images = jsonObj[i].space_images;
			break;
		}
	}
	l = images.length;
	result = "";
	for(i = 0; i < l; i++){
		result += "<img class='roomPicList' src='${pageContext.request.contextPath}/img/space/" + images[i] +"'>";
		
	}
	
	$(".modal-content").html(result);
}

window.onclick = function(event){
	if(event.target == showModal){
		showModal.style.display = "none";
	}
}
</script>
	</body>
</html>

    