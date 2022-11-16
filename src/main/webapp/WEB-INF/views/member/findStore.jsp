<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%!
	int writePages = 9;
%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>놀먹자~!</title>
	

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<!-- <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'> -->

	<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/findStore.css">


	<!-- Modernizr JS -->
	<script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

<!-- 페이징 -->
<!-- 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="CSS/common.css"/>
 -->
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
 
 
</head>

<body>
<jsp:include page="normalHeader.jsp"></jsp:include>

	<div class="fh5co-parallax" style="background-image: url(${pageContext.request.contextPath}/img/findStore.jpg);" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div
					class="col-md-8 col-md-offset-2 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center fh5co-table">
					<div class="fh5co-intro fh5co-table-cell">
						<h1 class="text-center">매장찾기</h1>
						<p>놀먹자에 등록한 사장님들의 매장을 한눈에 보실 수 있습니다</p>
					</div>
				</div>
			</div>
		</div>
	</div><!-- end: fh5co-parallax -->



	<div id="fh5co-work-section">
		<div class="container">
			<div class="row text-center">
			
			
				<div id="search-container">
					<input name="content" type="text" placeholder="찾으시는 매장명을 입력해주세요" class="form1"/>
					<button class="form2">검색</button>
				</div>
			
				<div class="btnContainer">
					<button class="storeCategori storeDTypeDefualt" type="button" onclick="changeDetails()">전체</button>
					<c:forEach var="dto" items="${storeType }">
						<button class="storeCategori storeDType${dto.store_dtype} }" onclick="changeDetailsOnClick('${dto.store_dtype}')">${dto.store_dname}</button>
					</c:forEach>
				</div>
			
				
				<div id="storeLists"></div>


			</div>
		</div>
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
	<script src="${pageContext.request.contextPath}/js/findStoreSearch.js"></script>

</body>
<script>

var jsonObj = "";
var l;


$(document).ready(function(){
	getJackson(); //json
});


function getJackson(){
	$.ajax({
		url : "${pageContext.servletContext.contextPath}/memberAjax/dtypeList.ajax",
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				
				jsonObj = data;
				
				changeDetails();
				
			}
		}
	})
}



// 디폴트(전체)
function changeDetails() {
	var types = jsonObj.store_types[${store_type} - 1];
	var dtypes = types.store_dtypes;
	l = dtypes.length;
	var ll;
	var result = "";
	for(i = 0; i < l; i++){
		var dname = dtypes[i].store_dname;
		ll = dtypes[i].stores.length;
		for(j = 0; j < ll; j++){
			
			result += "<div class='col-md-4 col-sm-6'>";
			result += "<div class='fh5co-grid-work'>";
			result += "<div class='work-holder'>";
				var uidUrl = "storeDetail.nmj?store_uid=" + dtypes[i].stores[j].store_uid;
			result += "<a href='" + uidUrl;
			result += "'>";
		
		if(dtypes[i].stores[j].store_img_sav.trim().length == 0) {
			result += "<img src = '${pageContext.request.contextPath}/img/store/storeDefault.jpeg'>";
		} else {
			result += "<img src='${pageContext.request.contextPath}/img/store/" + dtypes[i].stores[j].store_img_sav + "'>";	
		}
			
			result += "</a>";
			result += "<a href='storeDetail.nmj?store_uid=" + dtypes[i].stores[j].store_uid + "' class='inner-overlay'>";
			result += "<i class='icon-plus'></i></a>";
			result += "</div>";
			result += "<div class='desc'>";
			result += "<h3>";
			result += "<a href='storeDetail.nmj?store_uid=" + dtypes[i].stores[j].store_uid + "'>";
			result += dtypes[i].stores[j].store_name;
			result += "</a></h3>";
			result += "<span>" + dname + "</span>";
			result += "</div></div></div>";
			
			
		}
	}
	$("div#storeLists").html(result);
}


// 카테고리 버튼 클릭
function changeDetailsOnClick(DTYPE){
	
	var result = "";
	
	var store_types = jsonObj.store_types[${store_type} - 1];
	for(var i = 0; i < store_types.store_dtypes.length; i++){
		if(store_types.store_dtypes[i].store_dtype==DTYPE){
			store_dtypes = store_types.store_dtypes[i];
			i = store_types.store_dtypes.length;
		}
	}
	
	var store_dname = store_dtypes.store_dname;
	
	var stores = store_dtypes.stores;
	
	for(var i = 0; i < stores.length; i++) {
		
		result += "<div class='col-md-4 col-sm-6'>";
		result += "<div class='fh5co-grid-work'>";
		result += "<div class='work-holder'>";
		
		result += "<a href='storeDetail.nmj?store_uid=" + stores[i].store_uid + "'>";
		
		if(stores[i].store_img_sav.trim().length == 0) {
			result += "<img src = '${pageContext.request.contextPath}/img/store/storeDefault.jpeg'>";
		} else {
			result += "<img src='${pageContext.request.contextPath}/img/store/" + stores[i].store_img_sav + "'>";
		}
		
		
		result += "</a>";
		result += "<a href='storeDetail.nmj?store_uid=" + stores[i].store_uid + "' class='inner-overlay'>";
		result += "<i class='icon-plus'></i></a>";
		result += "</div>";
		result += "<div class='desc'>";
		result += "<h3>";
		result += "<a href='storeDetail.nmj?store_uid=" + stores[i].store_uid + "'>";
		result += stores[i].store_name;
		result += "</a></h3>";
		result += "<span>" + store_dname + "</span>";
		result += "</div></div></div>";
	}
		
	$("div#storeLists").html(result);
		
}
	
	
	
// 매장명 검색
function searchStoreName(storeName) {
	
			
	var types = jsonObj.store_types[${store_type} - 1];
	var dtypes = types.store_dtypes;
	l = dtypes.length;
	var ll;
	var result = "";
	for(i = 0; i < l; i++){
		var dname = dtypes[i].store_dname;
		ll = dtypes[i].stores.length;
		for(j = 0; j < ll; j++){
			
			if(dtypes[i].stores[j].store_name.indexOf(storeName) != -1) {
			
			result += "<div class='col-md-4 col-sm-6'>";
			result += "<div class='fh5co-grid-work'>";
			result += "<div class='work-holder'>";
				var uidUrl = "storeDetail.nmj?store_uid=" + dtypes[i].stores[j].store_uid;
			result += "<a href='" + uidUrl;
			result += "'>";
		
		if(dtypes[i].stores[j].store_img_sav.trim().length == 0) {
			result += "<img src = '${pageContext.request.contextPath}/img/store/storeDefault.jpeg'>";
		} else {
			result += "<img src='${pageContext.request.contextPath}/img/store/" + dtypes[i].stores[j].store_img_sav + "'>";	
		}
			
			result += "</a>";
			result += "<a href='storeDetail.nmj?store_uid=" + dtypes[i].stores[j].store_uid + "' class='inner-overlay'>";
			result += "<i class='icon-plus'></i></a>";
			result += "</div>";
			result += "<div class='desc'>";
			result += "<h3>";
			result += "<a href='storeDetail.nmj?store_uid=" + dtypes[i].stores[j].store_uid + "'>";
			result += dtypes[i].stores[j].store_name;
			result += "</a></h3>";
			result += "<span>" + dname + "</span>";
			result += "</div></div></div>";
			
			}
		}
	}
	$("div#storeLists").html(result);	
	
	
}

	



</script>
</html>