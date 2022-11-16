<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    int writePages = 10;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커뮤니티 - 리뷰목록</title>

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

<!-- 페이징 -->
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>

<script>
//페이지 최초 로딩되면 게시글 목록 첫페이지분 로딩

 $(document).ready(function(){
    $("input#page").val(1);   // 페이지 최초 로딩되면 1페이지
    loadPage(1) // n Page 읽어오기

   var html = "<ul class='pagination'>";
   var curPage = parseInt($("input#page").val());

   if(curPage != 1) {
      html += "<li class='back'><a class='fas fa-angle-double-left'></a></li>";
   }
   var calPage = parseInt(curPage / 10); 
   var pagesize = 0;
   
   if((calPage+1)*10 > ${totalPage}/10){
	   pagesize = ${totalPage}/10 - (calPage)*10 +1;
   }else{
	   pagesize = 10;
   }
   
   for(var i = 1; i <=  pagesize; i++){
      html +=   "<li class='page-item'> <a class='page-link'>" + (calPage*10 + i) + "</a></li>";
      
   }
      
      
   if(curPage < ${totalPage}){
      html += "<li class='next'><a class='fas fa-angle-double-right'></a></li>";
   }
   $("#pagination").html(html);
   
   $(".page-item").click(function(){   
      var pagetext = $(this).text();
      loadPage(pagetext);
   });
   
   $(".next").click(function(){   
      loadPage(pagesize);
   });
   
   $(".back").click(function(){   
      loadPage(1);
   });
   

 });

 // page번째 페이지 목록 로딩
 function loadPage(page) {
    
    $.ajax({
       url : "${pageContext.request.contextPath}/memberAjax/communityList.nmj/<%= writePages%>/" + page,
       type : "GET",
       cache : false,
       success : function(data, status) {
          if(status == "success") {
             
             if(updateList(data)) { // 페이지 업데이트
                // 페이지 로딩이 성공한 후에야 현재 페이지 정보 업데이트
                $("input#page").val(page);
             }
          }
       }
       
    });
 } // end loadPage()


 function updateList(jsonObj) {
  	var result = '<tr>';
       result += '<th>no.</th>';
       result += '<th>매장종류</th>';
       result += '<th>매장명</th>';
       result += '<th>아이디</th>';
       result += '<th>내용</th>';
       result += '<th>조회수</th>';
       result += '</tr>';
       
    
    if(jsonObj.status == "OK") {
       
       var count = jsonObj.count; // 글 개수
       var items = jsonObj.list; // 글 목록
       var noticeList = jsonObj.noticeList; // 글 목록
       
       if(count == 0){
    	   result += '첫번째 게시글을 남겨보세요!<br>';
       }
       
       var j;
       for(j = 0; j<noticeList.length; j++){
    	 result += '<tr class="bg-pink">';
		 result += '<td> 공지글 </td>';
		 result += '<td> - </td>';
		 result += '<td> - </td>';
		 result += '<td> 관리자 </td>';
		 result += '<td class="tdSubject"><a href="noticeView.nmj?notice_uid=' + noticeList[j].notice_uid + '">' + noticeList[j].notice_subject + '</a></td>';
		 result += '<td>' + noticeList[j].notice_viewCount + '</td>';
		 result += '</tr>';
       }
       
       var i;
       for(i = 0; i < count; i++) {
       	  result += '<tr>';
       	  var k = i + 1;
    	  result += '<td>'+ k + '</td>';
    	   if(items[i].store_type == 1){
    		   result += '<td>놀자</td>';
    	   } else if(items[i].store_type == 2){
    		   result += '<td>먹자</td>';
    	   } else {
    		   result += '<td>자자</td>';
    	   }
    	   result += '<td>' + items[i].store_name + '</td>';
    	   result += '<td>' + items[i].mb_id + '</td>';
    	   if(items[i].review_ban == 0){
    		   result += '<td class="tdSubject" style = "max-width: 200px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;"><a href="communityView.nmj?review_uid=' + items[i].review_uid;
    		   result += '">' +  items[i].review_content + '</a></td>';
    	   } else {
    		   result += '<td class="tdSubject">관리자에 의해 삭제된 글입니다.</td>';
    	   }
    	   result += '<td>' + items[i].review_viewCount + '</td>';
   		   result += '</tr>';
       }
       
       $("#communityList").html(result); // 테이블 내용 업데이트
       
       return true;
    } else {
       return false;
    }
    
    return false;
 }

 </script>


<body>
	<input type="hidden" id="page">
	<jsp:include page="normalHeader.jsp"></jsp:include>	
	
	<div class="fh5co-parallax" style="background-image: url(/nmj/img/findStore.jpg);" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div
					class="col-md-8 col-md-offset-2 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center fh5co-table">
					<div class="fh5co-intro fh5co-table-cell">
						<h1 class="text-center">Review</h1>
						<p>놀먹자에 등록된 리뷰들을 확인하실 수 있습니다</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="div-relative">
	<div class="show_list_container cmTable">
		
	<br><br>
	
			<div class="row">
				<div class="col-md-12 text-center">
					<h3>이벤트</h3>
				</div>
			</div>

	<c:choose>
	<c:when test="${empty list || fn.length(list) == 0 }">
		이벤트가 없습니다<br>
	</c:when>
	
	<c:otherwise>
		<table>
			<thead>
	            <th>제목</th>
	            <th>이벤트 시작</th>
	            <th>이벤트 종료</th>
	            <th>조회수</th>
			</thead>
			<tbody>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td class="tdSubject"><a href="noticeView.nmj?notice_uid=${dto.notice_uid }">${dto.notice_subject }</a></td>
					<td>
					<fmt:parseDate var="parsedDate" value="${dto.notice_startDate}" pattern="yyyy-MM-dd HH:mm:ss.S"/>
					<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
					<fmt:parseDate var="parsedDate" value="${dto.notice_endDate}" pattern="yyyy-MM-dd HH:mm:ss.S"/>
					<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td>${dto.notice_viewCount }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</c:otherwise>
	</c:choose>

	<br><br>
	
		<div class="row">
			<div class="col-md-12 text-center">
				<h3>리뷰 목록</h3>
			</div>
		</div>
	

	<button class="btn btn-secondary active btn-lg" onclick="location.href='communityList.nmj'">리뷰글</button>
    <button class="btn btn-secondary btn-lg" onclick="location.href='communityList2.nmj'">자유글</button>
        <br><br>
	
    	<table id="communityList">
          


		</table>
		
	<ul class="pagination" id="pagination"></ul>

	<br>
	<c:choose>
	 	<c:when test="${sessionScope.mb_uid != null }">
		<button class="btn btn-primary btn-lg" onclick="location.href='writeReview.nmj?mb_uid=${sessionScope.mb_uid}'">리뷰 작성</button>
	 	</c:when>
	</c:choose>
	
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