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

  <!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FREEHTML5.CO
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

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

	<!-- <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'> -->
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/${pageContext.request.contextPath}/CSS/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/owl.theme.default.min.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/maincss.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<style>
		div.mapEvent{
			position: relative;
			top: 20px;
			height: 150px;
		}
		div.mapEvent > div{
			font-size: 13px;
		}
	</style>
	</head>
	<body>
	<jsp:include page="normalHeader.jsp"></jsp:include>
	
	<!-- 지도 -->
	<div id="fh5co-intro-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2>Find your Replace</h2>
					<p>주변 놀거리를 지도를 이용해 찾아보세요.</p>
					
					<!-------- 지도 들어갈 공간 --------->			
					<div class="map_wrap">
						<!-- 지도를 표시할 div-->
					    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
						
						<!-- 사용자 위치 설정 + 그 위치 중앙으로 표시 -->
						<div class="custom_gps radius_border">
							<span onclick="findGPS()">위치설정</span>  
						</div>
					</div>
					
					<!-- 매장 종류 -->
					<div class="category">
				        <ul class="categoryBox">
				            <li class="caMenu" id="coffeeMenu">
				                <span class="ico_comm ico_coffee cateBtn" onclick="changeDtype('1')">놀자</span>
				            </li>
				            <li class="caMenu" id="storeMenu">
				                <span class="ico_comm ico_store cateBtn" onclick="changeDtype('2')">먹자</span>
				            </li>
				            <li class="caMenu" id="carparkMenu">
				                <span class="ico_comm ico_carpark cateBtn" onclick="changeDtype('3')">자자</span>	              	
				            </li>
				        </ul>
				    </div>
				    
				    <!--  매장 상세 종류  -->
				    <div class="sub-category">			    
					</div>		
					<jsp:include page="mapScript.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 테마 -->
	<div class="fh5co-parallax" style="background-image: url(${pageContext.request.contextPath}/img/hotPlace.jpg);" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container dark">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center fh5co-table">
					<div class="fh5co-intro fh5co-table-cell">
						<h1 class="text-center">놀먹자 핫플레이스!</h1>
						<p>놀먹자별 순위를 확인해보세요.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 놀자 -->
	<div id="fh5co-blog-section">
		<div class="container">
			<div class="heading-section text-center">
				<h2>놀자</h2>
			</div>
			<div class="row">
				<c:forEach var="nol" items="${nol }" varStatus="num">
				<div class="col-md-4 blog-section"  onclick="location.href = 'storeDetail.nmj?store_uid=${nol.store_uid}'">			
					<a class="imgBox">
					<c:choose>
						<c:when test="${empty nol.store_img_sav }">
							<img src="${pageContext.request.contextPath}/img/store/storeDefault.jpeg">
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/img/store/${nol.store_img_sav}">
						</c:otherwise>
					</c:choose>
					</a>
					<span>${num.count }<small>★ ${nol.totalAvg }</small></span>
					<h3 style="margin-bottom: 20px;">${nol.store_name }</h3>
					<a class="btn btn-primary" href='storeDetail.nmj?store_uid=${nol.store_uid}'>Read More</a>
				</div>
				</c:forEach>			
			</div>
		</div>
	</div>
	
	<!-- 먹자 -->
	<div id="fh5co-blog-section">
		<div class="container">
			<div class="heading-section text-center">
				<h2>먹자</h2>
			</div>
			<div class="row">
				<c:forEach var="muk" items="${muk }" varStatus="num">
				<div class="col-md-4 blog-section"  onclick="location.href = 'storeDetail.nmj?store_uid=${muk.store_uid}'">			
					<a class="imgBox">
					<c:choose>
						<c:when test="${empty muk.store_img_sav }">
							<img src="${pageContext.request.contextPath}/img/store/storeDefault.jpeg">
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/img/store/${muk.store_img_sav}">
						</c:otherwise>
					</c:choose>
					</a>
					<span>${num.count }<small>★ ${muk.totalAvg }</small></span>
					<h3>${muk.store_name }</h3>
					<a class="btn btn-primary" href='storeDetail.nmj?store_uid=${muk.store_uid}'>Read More</a>
				</div>
				</c:forEach>			
			</div>
		</div>
	</div>
	
	<!-- 자자 -->
	<div id="fh5co-blog-section">
		<div class="container">
			<div class="heading-section text-center">
				<h2>자자</h2>
			</div>
			<div class="row">
				<c:forEach var="ja" items="${ja }" varStatus="num">
				<div class="col-md-4 blog-section"  onclick="location.href = 'storeDetail.nmj?store_uid=${ja.store_uid}'">			
					<a class="imgBox">
					<c:choose>
						<c:when test="${empty ja.store_img_sav }">
							<img src="${pageContext.request.contextPath}/img/store/storeDefault.jpeg">
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/img/store/${ja.store_img_sav}">
						</c:otherwise>
					</c:choose>
					</a>
					<span>${num.count }<small>★ ${ja.totalAvg }</small></span>
					<h3>${ja.store_name }</h3>
					<a class="btn btn-primary" href='storeDetail.nmj?store_uid=${ja.store_uid}'>Read More</a>
				</div>
				</c:forEach>			
			</div>
		</div>
	</div>
	
	<!-- 테마 -->
	<div class="fh5co-parallax" style="background-image: url(${pageContext.request.contextPath}/img/community.jpg);" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center fh5co-table">
					<div class="fh5co-intro fh5co-table-cell">
						<h1 class="text-center">Community</h1>
						<p>다른 사용자들의 의견을 확인할 수 있습니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 커뮤니티 게시판 -->
	<div id="fh5co-blog-section">
		<div class="container">
			<table class="community">
                  <tr id="Head">
                     <th>회원아이디</th>
                     <th>내용</th>
                     <th>작성일</th>
                     <th>조회수</th>
                  </tr>
                  
                  <c:forEach var="talk" items="${community }">
                     <tr>
                        <td>${talk.mb_id }</td>
                        <c:choose>
                        	<c:when test="${fn:length(talk.review_content) > 10 }">
                        		<c:choose>
                        		<c:when test="${talk.store_uid == 0 }">
			                        <td><a href="${pageContext.request.contextPath}/community/communityView2.nmj?review_uid=${talk.review_uid}">${fn:substring(talk.review_content,0,10) }...</a></td>                	                        		
                        		</c:when>
                        		<c:otherwise>
			                        <td><a href="${pageContext.request.contextPath}/community/communityView.nmj?review_uid=${talk.review_uid}">${fn:substring(talk.review_content,0,10) }...</a></td>                	                        		
                        		</c:otherwise>
                        		</c:choose>
                        	</c:when>
                        	<c:otherwise>
                        		<c:choose>
                        		<c:when test="${talk.store_uid == 0 }">
			                        <td><a href="${pageContext.request.contextPath}/community/communityView2.nmj?review_uid=${talk.review_uid}">${talk.review_content }</a></td>                	
                        		</c:when>
                        		<c:otherwise>
			                        <td><a href="${pageContext.request.contextPath}/community/communityView.nmj?review_uid=${talk.review_uid}">${talk.review_content }</a></td>                	
                        		</c:otherwise>
                        		</c:choose>
                        	</c:otherwise>
                        </c:choose>
                        <td>${talk.review_date }</td>
                        <td>${talk.review_viewCount }</td>
                     </tr>
                  </c:forEach>                               
               </table>
               <div class="btnBox">			
					<a class="btn btn-primary" href='${pageContext.request.contextPath}/community/communityList.nmj'>Read More</a>
				</div>
		</div>
	</div>
	
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

	</body>
</html>

