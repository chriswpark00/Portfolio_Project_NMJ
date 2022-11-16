<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html class="no-js" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>놀먹자~!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/mySpace.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/bootswatch.css">


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
<script> var store_uid = ${sessionScope.store_uid};
</script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/mySpace.js"></script>

</head>
<body>
	<c:choose>
	<c:when test="${sessionScope.mb_type == 0 || sessionScope.mb_type == null || empty sessionScope.mb_type}">
		<script>
			alert("로그인을 하지 않으셨거나 권한이 없는 사용자 또는 자동 로그아웃 되었습니다. 로그인 해주세요.");
			location.href = "${pageContext.request.contextPath}/store/storeMySpace.nmj";
		</script>
	</c:when>
</c:choose>

	<header>
		<div class="container text-center headerContainer">
			<div id="logout_mypage">
				<span id="logout">로그아웃</span>
				<span class="line">|</span>
				<span id="storepage">매장페이지</span>
			</div>
			<div class="fh5co-navbar-brand">
				<a class="fh5co-logo" href="${pageContext.request.contextPath}/store/storeMySpace.nmj"><img
					src="${pageContext.request.contextPath}/img/logo/nmj_logo.jpg"
					style="width: 200px; height: 150px;" /></a>
			</div>
			<nav id="fh5co-main-nav" role="navigation">
				<ul>
					<li><a id="1" href="${pageContext.request.contextPath}/member/main.nmj">홈</a></li>
					<li><a id="2" href="${pageContext.request.contextPath}/customer/cusUpdateInfo.nmj">회원정보수정</a></li>
					<li><a id="3" class="active" href="${pageContext.request.contextPath}/store/storeMySpace.nmj">매장 공간 관리</a></li>
					<li><a id="4" href="${pageContext.request.contextPath}/store/storeMyFood.nmj">음식 메뉴 관리</a></li>
					<li><a id="5" href="${pageContext.request.contextPath}/store/storeMyReview.nmj">내 매장 리뷰보기</a></li>
					<li><a id="6" href="${pageContext.request.contextPath}/store/storeSettings.nmj">매장 정보 수정</a></li>
					<li><a id="7" href="${pageContext.request.contextPath}/store/storeSettingsRequest.nmj">매장 정보 수정 요청</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<div id="fh5co-intro-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h2>매장 공간 관리</h2>
					<p>매장의 컨탠츠 공간을 관리 하실 수 있습니다.</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- end fh5co-intro-section -->
	<div class="topBox">
		<div id="leftArea">
			<div id="draggArea">		
			</div>		
		</div>
		
	<div id="rightArea">
		<div id="boxMake">
			<div id="">
				<div id="boxMakingArea">
					
					<c:forEach var="list" items="${space }">
					<div class="
						<c:set var="space" value="${list.spaceList_uid }"/>						
						<c:choose>
							
							<c:when test="${list.spaceList_uid eq 1 }">
								pcspace space_uid#${list.space_uid }# space_count#1 space_price#${list.space_price } spaceName#${list.space_name } spaceList#1 spaceEmpty${list.space_empty}" style="position:absolute; left:${list.space_xloc}px; top:${list.space_yloc}px"><div class="pcspaceimg" ></div><div class="pcNum">${list.space_name }</div>
							</c:when>			
							<c:when test="${list.spaceList_uid eq 2 }">
								draggablekar ui-widget-content space_uid#${list.space_uid }# space_count#${list.space_count } space_price#${list.space_price } spaceName#${list.space_name } spaceList#2 spaceEmpty${list.space_empty}" style="position:absolute; left:${list.space_xloc}px; top:${list.space_yloc}px"><div class="karspaceimg"></div><div class="karNum">${list.space_name }</div>
							</c:when>			
							<c:when test="${list.spaceList_uid eq 3 }">
								draggablebil ui-widget-content space_uid#${list.space_uid }# space_count#${list.space_count } space_price#${list.space_price } spaceName#${list.space_name } spaceList#3 spaceEmpty${list.space_empty}" style="position:absolute; left:${list.space_xloc}px; top:${list.space_yloc}px"><div class="bilspaceimg"></div><div class="bilNum">${list.space_name }</div>
							</c:when>			
							<c:when test="${list.spaceList_uid eq 4 }">
								draggablebowl ui-widget-content space_uid#${list.space_uid }# space_count#${list.space_count } space_price#${list.space_price } spaceName#${list.space_name } spaceList#4 spaceEmpty${list.space_empty}" style="position:absolute; left:${list.space_xloc}px; top:${list.space_yloc}px"><div class="bowlspaceimg"></div><div class="bowlNum">${list.space_name }</div>
							</c:when>			
							<c:when test="${list.spaceList_uid eq 5 }">
								draggableTable ui-widget-content space_uid#${list.space_uid }# space_count#${list.space_count } space_price#${list.space_price }  spaceName#${list.space_name } spaceList#5 spaceEmpty${list.space_empty}" style="position:absolute; left:${list.space_xloc}px; top:${list.space_yloc}px"><div class="tablespaceimg"></div><div class="tableNum">${list.space_name }</div>
							</c:when>			
							<c:otherwise>
								draggableRoom ui-widget-content space_uid#${list.space_uid }# space_count#${list.space_count } space_price#${list.space_price } spaceName#${list.space_name } spaceList#${list.spaceList_uid } spaceEmpty${list.space_empty}" style="position:absolute; left:${list.space_xloc}px; top:${list.space_yloc}px"><div class="roomspaceimg"></div><div class="roomNum">${list.space_name }</div>
							</c:otherwise>	
						</c:choose>
							</div>
					</c:forEach>
				</div>
				
				<div>
					<div class="card text-white mt-3 mb-3" style="max-width:300px;">
						<div class="card-header">공간입력하기</div>
						<div class="card-body">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<select name="space_type" id="space_type" class="form-control">
											<option value="">선택종류</option>								
											<c:forEach var="list" items="${space_type}">
												<option value="${list.spaceList_uid }">${list.space_type }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input id="spaceNum" type="number" class="form-control" placeholder="인원수">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input id="spaceName" type="text" class="form-control" placeholder="공간이름">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input id="spacePrice" type="number" class="form-control" placeholder="공간가격">
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input id="addButton" type="button" class="btn btn-primary form-control" value="추가하기">
									</div>
								</div>	
								<div id="boxListArea">							
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<button id="confirmbtn" type="button" class="btn btn-info form-control mt-2">저장하기</button>
									</div>
								</div>	
							</div>
							
						</div>
					</div>
				
										
				</div>
			</div>
				
		</div>
	</div>
	</div>
		<div class="clear"></div>
		<div id="reservationArea">			
					<c:if test="${fn:length(reservation) eq 0 }">
						<div>예약신청이 없습니다.</div>
					</c:if>
					<c:if test="${fn:length(reservation) gt 0 }">
						<table id="reservationtb">
							<tr id="tHead">
								<th>No.</th>
								<th>공간이름</th>
								<th>손님 아이디</th>
								<th>시작시간</th>
								<th>종료시간</th>
								<th>예약 인원</th>
								<th>금액</th>
								<th>승인</th>
								<th>거절</th>
							</tr>		
					<c:forEach var="reserv" items="${reservation}" varStatus="status">
						<tr class="tData">
							<td>${status.count }</td>
							<td>${reserv.reservation_seat }</td>
							<td>${reserv.mb_id }</td>
							<td>${reserv.reservation_start}</td>
							<td>${reserv.reservation_end }</td>
							<td>${reserv.reservation_count }</td>
							<td>${reserv.reservation_price }</td>
							<td><button class="reservOk ${reserv.reservation_uid }">승인</button></td>
							<td><button class="reservNo ${reserv.reservation_uid }">거절</button></td>
						</tr>				
					</c:forEach>
						</table>
					</c:if>			
				</div>
		<div>
			<button type="button" class="btn btn-primary btn-lg btn-block bigbutton">공간 이미지 관리</button>
		
			<div>
				<div id="mySpaceImg">								
					<div id="feedback">
					<span>고르신 공간 : </span> <span id="select-result">없음</span>.
					<form name ="space_uids"id="space_uids" target="매장 이미지 넣기" method="post">
					</form>
						<button id="imgAllInsert" class="btn btn-danger">이미지 넣기</button>
					
					
					</div>
					<div>
						<div>
						<ol id="selectable">
							<c:forEach var="list" items="${space2 }">
								<li class="space_uid${list.space_uid } ui-widget-content">
									<a href="storeImgDetail.nmj?space_uid=${list.space_uid }">${list.space_name }</a>
									<button class="spaceDelete del#${list.space_uid }#">삭제하기</button> 
									<button class="storeImgDetailbtn" onclick="location.href='storeImgDetail.nmj?space_uid=${list.space_uid}'">이미지 상세 페이지</button>
								</li>
							</c:forEach>
							</ol>
						</div>
					</div>
				</div>	
			</div>
		</div>
			
		
	
	<div class="clear"></div>
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

	
	<!-- Main JS (Do not remove) -->

</body>
<script>
$( function() {
    $( "#selectable" ).selectable({
      stop: function() {
        var result = $( "#select-result" ).empty();
     
        var uidsText = "<input type='hidden' id='space_uid' name='space_uid' value='";
        $( ".ui-selected", this ).each(function() {
          var index = $( "#selectable li" ).index( this );
          var text = $( "#selectable li" ).get(index).innerText;
          text = text.split("삭제하기")[0];
          var space_uidText = $("#selectable li").get(index).innerHTML;
          space_uid = space_uidText.split("=")[2];
          space_uid = space_uid.split('"')[0];
          uidsText +=  space_uid + ","; 
          result.append(text+ " ");
        });
        uidsText += "'>";
        $("#space_uids").html(uidsText);
      }
    });
} );
  $(document).ready(function(){
	 $("#imgAllInsert").click(function(){
		 var space_uid = $("#space_uid").val();
		 if(space_uid.length > 0){
		 window.open("storeMySpaceImgInsert.nmj?space_uid="+ space_uid , "매장 이미지 넣기"	, "width=600, height=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
		 }
		 
	 }); 
	 
	$("span#logout").click(function (){
		// 세션 삭제
		location.href = "${pageContext.request.contextPath}/member/logout.nmj";
	});
	
	$("span#storepage").click(function(){
		location.href="${pageContext.request.contextPath}/store/storeMySpace.nmj";
	});
  });
  </script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
</html>

