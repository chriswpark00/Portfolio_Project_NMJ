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
   
   <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/animate.css">
   <!-- Icomoon Icon Fonts-->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/icomoon.css">
   <!-- Bootstrap  -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootstrap.css">

   <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">

   <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/mainPage.css">

   <!-- Modernizr JS -->
   <script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>

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
            <a href="main.nmj"><img id="logo" src="${pageContext.request.contextPath}/img/logo/nmj_logo.jpg"></a>
         </div>
         <nav id="fh5co-main-nav" role="navigation">
            <ul>
               <li><a href="main.nmj" class="active">메인</a></li>
                     <li><a href="findStore.nmj?store_type=1">놀자</a></li>
                     <li><a href="findStore.nmj?store_type=2">먹자</a></li>
                     <li><a href="findStore.nmj?store_type=3">자자</a></li>
               <li><a href="${pageContext.request.contextPath}/community/communityList.nmj">떠들자</a></li>
            </ul>
         </nav>
      </div>
   </header>
   
   
   <div class="body">
      <div class="container">
      
         <div class="mapContainer"></div>
         
         
         
         
         
         <div class="hotPlaceContainer">
            <h2>놀먹자 핫플레이스!</h2>
               <table>
                  <tr>
                     <th>♡</th>
                     <th onclick="location.href = 'findStore.nmj?store_type=1'">놀래?</th>
                     <th onclick="location.href = 'findStore.nmj?store_type=2'">먹을래?</th>
                     <th onclick="location.href = 'findStore.nmj?store_type=3'">자러갈래?</th>
                  </tr>
                  
                  <tr>
                     <td>1위</td>
                     <td onclick="location.href = 'storeDetail.nmj?store_uid=${nol[0].store_uid}'">${nol[0].store_name }<b>(${nol[0].totalAvg })</b></td>
                     <td onclick="location.href = 'storeDetail.nmj?store_uid=${muk[0].store_uid}'">${muk[0].store_name }<b>(${muk[0].totalAvg })</b></td>
                     <td onclick="location.href = 'storeDetail.nmj?store_uid=${ja[0].store_uid}'">${ja[0].store_name }<b>(${ja[0].totalAvg })</b></td>
                  </tr>
                  <tr>
                     <td>2위</td>
                     <td onclick="location.href = 'storeDetail.nmj?store_uid=${nol[1].store_uid}'">${nol[1].store_name }<b>(${nol[1].totalAvg })</b></td>
                     <td onclick="location.href = 'storeDetail.nmj?store_uid=${muk[1].store_uid}'">${muk[1].store_name }<b>(${muk[1].totalAvg })</b></td>
                     <td onclick="location.href = 'storeDetail.nmj?store_uid=${ja[1].store_uid}'">${ja[1].store_name }<b>(${ja[1].totalAvg })</b></td>
                  </tr>
                  <tr>
                     <td>3위</td>
                     <td onclick="location.href = 'storeDetail.nmj?store_uid=${nol[2].store_uid}'">${nol[2].store_name }<b>(${nol[2].totalAvg })</b></td>
                     <td onclick="location.href = 'storeDetail.nmj?store_uid=${muk[2].store_uid}'">${muk[2].store_name }<b>(${muk[2].totalAvg })</b></td>
                     <td onclick="location.href = 'storeDetail.nmj?store_uid=${ja[2].store_uid}'">${ja[2].store_name }<b>(${ja[2].totalAvg })</b></td>
                  </tr>
                  
               </table>
         </div>
         
         
         <div class="communityContainer">
            <h2 onclick="location.href = '${pageContext.request.contextPath}/community/communityList.nmj'">입에 모터 달아볼래?</h2>
               <table>
                  <tr>
                     <th>회원아이디</th>
                     <th>내용</th>
                     <th>작성일</th>
                     <th>조회수</th>
                  </tr>
                  
                  <c:forEach var="talk" items="${community }">
                     <tr>
                        <td>${talk.mb_id }</td>
                        <td><a href="${pageContext.request.contextPath}/community/communityView.nmj?review_uid=${talk.review_uid}">${talk.review_content }</a></td>
                        <td>${talk.review_date }</td>
                        <td>${talk.review_viewCount }</td>
                     </tr>
                  </c:forEach>
                                
               </table>
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
   <!-- Google Map -->
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
   <!-- Owl carousel -->
   <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
   <script src="${pageContext.request.contextPath}/js/google_map.js"></script>
   <!-- Stellar -->
   <script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>

   <!-- Main JS (Do not remove) -->
   <script src="${pageContext.request.contextPath}/js/main.js"></script>

   </body>
</html>
