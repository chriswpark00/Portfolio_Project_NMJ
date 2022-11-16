<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>예약페이지</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="shortcut icon" href="favicon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/mySpace.css">
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/cusReserve.css">

<!-- DatePicker -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/datepicker.min.css">
<!-- Modernizr JS -->
<script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>
</head>

<body>

	<jsp:include page="normalHeader.jsp"></jsp:include>
	<div id="divView"></div>
	
	<div class="fh5co-parallax" style="background-image: url(images/hero-1.jpg);" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
         <div class="row">
            <div class="col-md-8 col-md-offset-2 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center fh5co-table">
               <div class="fh5co-intro fh5co-table-cell">
                  <h1 class="text-center">매장 예약</h1>
                  <p>앗! 자리 없어질라 얼른 서두르세요~!</p>
               </div>
            </div>
         </div>
      </div>
   </div>
	
	<!-- end fh5co-intro-section -->
	
	<div class="div-relative">
		<div id="reserve_frm_container">
			<form name="frm" id="reserve_frm" onsubmit="return chkSubmit();" action="cusReserveOk.nmj" method="post">
				<div>
						<div>
							<c:choose>
							<c:when test="${store_type eq 1}">
							<input type='text' name="reservation_date" placeholder="날짜를 고르세요" id="my-element" class='datepicker-here reserve_info form-control myInput' data-language='en' />
							
							<select name="reservation_start" class="custom-select" style="width: 200px; height: 50px; font-size: 17px;">
								<option selected>시작 시간</option>
								<option value="00:00">00:00</option>
								<option value="01:00">01:00</option>
								<option value="02:00">02:00</option>
								<option value="03:00">03:00</option>
								<option value="04:00">04:00</option>
								<option value="05:00">05:00</option>
								<option value="06:00">06:00</option>
								<option value="07:00">07:00</option>
								<option value="08:00">08:00</option>
								<option value="09:00">09:00</option>
								<option value="10:00">10:00</option>
								<option value="11:00">11:00</option>
								<option value="12:00">12:00</option>
								<option value="13:00">13:00</option>
								<option value="14:00">14:00</option>
								<option value="15:00">15:00</option>
								<option value="16:00">16:00</option>
								<option value="17:00">17:00</option>
								<option value="18:00">18:00</option>
								<option value="19:00">19:00</option>
								<option value="20:00">20:00</option>
								<option value="21:00">21:00</option>
								<option value="22:00">22:00</option>
								<option value="23:00">23:00</option>
								<option value="24:00">24:00</option>
							</select>
							~
							<select name="reservation_end" class="custom-select" style="width: 200px; height: 50px; font-size: 17px;">
								<option selected>종료 시간</option>
								<option value="00:00">00:00</option>
								<option value="01:00">01:00</option>
								<option value="02:00">02:00</option>
								<option value="03:00">03:00</option>
								<option value="04:00">04:00</option>
								<option value="05:00">05:00</option>
								<option value="06:00">06:00</option>
								<option value="07:00">07:00</option>
								<option value="08:00">08:00</option>
								<option value="09:00">09:00</option>
								<option value="10:00">10:00</option>
								<option value="11:00">11:00</option>
								<option value="12:00">12:00</option>
								<option value="13:00">13:00</option>
								<option value="14:00">14:00</option>
								<option value="15:00">15:00</option>
								<option value="16:00">16:00</option>
								<option value="17:00">17:00</option>
								<option value="18:00">18:00</option>
								<option value="19:00">19:00</option>
								<option value="20:00">20:00</option>
								<option value="21:00">21:00</option>
								<option value="22:00">22:00</option>
								<option value="23:00">23:00</option>
								<option value="24:00">24:00</option>
							</select>
							</c:when>
							<c:when test="${store_type eq 2}">
								<input type='text' name="reservation_date" placeholder="날짜를 고르세요" id="my-element" class='datepicker-here reserve_info form-control col-md-6 myInput' data-language='en' />
							<select name="reservation_start" class="custom-select col-md-6" style="width: 200px; height: 50px; font-size: 17px;">
								<option selected>시작 시간</option>
								<option value="00:00">00:00</option>
								<option value="01:00">01:00</option>
								<option value="02:00">02:00</option>
								<option value="03:00">03:00</option>
								<option value="04:00">04:00</option>
								<option value="05:00">05:00</option>
								<option value="06:00">06:00</option>
								<option value="07:00">07:00</option>
								<option value="08:00">08:00</option>
								<option value="09:00">09:00</option>
								<option value="10:00">10:00</option>
								<option value="11:00">11:00</option>
								<option value="12:00">12:00</option>
								<option value="13:00">13:00</option>
								<option value="14:00">14:00</option>
								<option value="15:00">15:00</option>
								<option value="16:00">16:00</option>
								<option value="17:00">17:00</option>
								<option value="18:00">18:00</option>
								<option value="19:00">19:00</option>
								<option value="20:00">20:00</option>
								<option value="21:00">21:00</option>
								<option value="22:00">22:00</option>
								<option value="23:00">23:00</option>
								<option value="24:00">24:00</option>
							</select>
							</c:when>
							<c:when test="${store_type eq 3}">
								<input type="text" name="reservation_start" data-range="true" data-multiple-dates-separator=" - " data-language="en" class="datepicker-here form-control doubleDate col-md-6" placeholder="날짜를 입력하세요."/>
							</c:when>
							</c:choose>
						</div>
					</div>
					<div class="clear"></div>
					<div>인원 및 좌석선택</div>
							<div id="spaceArea">
								<c:forEach var="list" items="${space }">
									<div class="
									<c:set var="space" value="${list.spaceList_uid }"/>						
									<c:choose>
										
										<c:when test="${list.spaceList_uid eq 1 }">
											boximg pcspace space_uid#${list.space_uid }# space_count#1 space_price#${list.space_price }# spaceName#${list.space_name }# spaceList#1 spaceEmpty${list.space_empty}" style="position:absolute; left:${list.space_xloc - 145}px; top:${list.space_yloc- 390}px"><div class="pcspaceimg spaceIsEmpty${list.space_empty}" ></div><div class="pcNum">${list.space_name }</div>
										</c:when>			
										<c:when test="${list.spaceList_uid eq 2 }">
											boximg draggablekar ui-widget-content space_uid#${list.space_uid }# space_count#${list.space_count } space_price#${list.space_price }# spaceName#${list.space_name }# spaceList#2 spaceEmpty${list.space_empty}" style="position:absolute; left:${list.space_xloc - 145}px; top:${list.space_yloc - 390}px"><div class="karspaceimg spaceIsEmpty${list.space_empty}"></div><div class="karNum">${list.space_name }</div>
										</c:when>			
										<c:when test="${list.spaceList_uid eq 3 }">
											boximg draggablebil ui-widget-content space_uid#${list.space_uid }# space_count#${list.space_count } space_price#${list.space_price }# spaceName#${list.space_name }# spaceList#3 spaceEmpty${list.space_empty}" style="position:absolute; left:${list.space_xloc - 145}px; top:${list.space_yloc - 390}px"><div class="bilspaceimg spaceIsEmpty${list.space_empty}"></div><div class="bilNum">${list.space_name }</div>
										</c:when>			
										<c:when test="${list.spaceList_uid eq 4 }">
											boximg draggablebowl ui-widget-content space_uid#${list.space_uid }# space_count#${list.space_count } space_price#${list.space_price }# spaceName#${list.space_name }# spaceList#4 spaceEmpty${list.space_empty}" style="position:absolute; left:${list.space_xloc- 145}px; top:${list.space_yloc - 390}px"><div class="bowlspaceimg spaceIsEmpty${list.space_empty}"></div><div class="bowlNum">${list.space_name }</div>
										</c:when>			
										<c:when test="${list.spaceList_uid eq 5 }">
											boximg draggableTable ui-widget-content space_uid#${list.space_uid }# space_count#${list.space_count } space_price#${list.space_price }#  spaceName#${list.space_name }# spaceList#5 spaceEmpty${list.space_empty}" style="position:absolute; left:${list.space_xloc - 145}px; top:${list.space_yloc - 390}px"><div class="tablespaceimg spaceIsEmpty${list.space_empty}"></div><div class="tableNum">${list.space_name }</div>
										</c:when>			
										<c:otherwise>
											boximg draggableRoom ui-widget-content space_uid#${list.space_uid }# space_count#${list.space_count } space_price#${list.space_price }# spaceName#${list.space_name }# spaceList#${list.spaceList_uid } spaceEmpty${list.space_empty}" style="position:absolute; left:${list.space_xloc- 145}px; top:${list.space_yloc - 390}px"><div class="roomspaceimg spaceIsEmpty${list.space_empty}"></div><div class="roomNum">${list.space_name }</div>
										</c:otherwise>	
									</c:choose>
										</div>
								</c:forEach>
							</div>
						
						
				<div id="resultBox">
							
							<input type="number" placeholder="인원을 입력하세요" name="reservation_count" id="reservation_count" class="reserve_info form-control myInput"/ required>
				<hr width="100%" align="center" size="0.7px">
						<div>
							선택하신 좌석 : <span id="selectedSeat"></span>
						</div>
						<div class="moneyBox">
						
							<div class="money">금액</div>
						<c:choose>
							<c:when test="${store_type eq 2}">
								<div>
									※ 먹자 매장은 현장 결제를 해주셔야 합니다.
								</div>
								<div>
									<input type="hidden" name="mb_uid" value="${mb_uid }">
									<input type="hidden" name="store_uid" value="${store_uid }">
									<input type="hidden" name="store_type" value="${store_type }">
									<input type="hidden" name="reservation_price" value="0" class="mt-2 mb-2">
									<button class="doreserv btn btn-primary myBtn">예약하기</button>
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<input type="text" placeholder="금액" name="reservation_price" id="reserve_price" class="reserve_info form-control myInput mt-2 mb-2" value="0">
								</div>
								<div>
									<input type="hidden" name="mb_uid" value="${mb_uid }">
									<input type="hidden" name="store_uid" value="${store_uid }">
									<input type="hidden" name="store_type" value="${store_type }">
									<button class="doreserv btn btn-primary myBtn">예약하기</button>
								</div>
							</c:otherwise>
						</c:choose>
						</div>
							<input type="hidden" id="space_uid" name = "space_uid">
							<input type="hidden" id="reservation_seat" name="reservation_seat" value="">
				</div>
			</form>
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
	
	
	<!-- DatePicker -->
	<script src="${pageContext.request.contextPath}/js/datepicker.min.js"></script>
	<!-- Include English language -->
	<script src="${pageContext.request.contextPath}/js/datepicker.en.js"></script>
	
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/js/rollingSlider.js"></script>

<script>
var images = [];
var imgCheck = 0;
// form 검증
function chkSubmit(){
	
	frm = document.forms["frm"];
	
	// 현재 날짜와 시간을 가지는 객체를 리턴
	var today = new Date();
	
	var cur_year = today.getFullYear(); // 년도
	var cur_month = today.getMonth() + 1;  // 월
	var cur_date = today.getDate();  // 날짜
	var cur_day = today.getDay();  // 요일
	
	var reservation_date = frm["reservation_date"].value.trim();
	var reservation_start = frm["reservation_start"].value.trim();
	var reservation_end = frm["reservation_end"].value.trim();
	var reservation_count = frm["reservation_count"].value.trim();
	var reservation_price = frm["reservation_price"].value.trim();
	
	var res_year = reservation_date.substring(0,4);
	res_year *= 1;	// 비교하기 위해 number 타입으로 형변환
	cur_year *= 1;	// 비교하기 위해 number 타입으로 형변환
	
	var res_month = reservation_date.substring(5,7);
	res_month *= 1;	// 비교하기 위해 number 타입으로 형변환
	cur_month *= 1;	// 비교하기 위해 number 타입으로 형변환
	
	var res_date = reservation_date.substring(8,10);
	res_date *= 1; // 비교하기 위해 number 타입으로 형변환
	cur_date *= 1; // 비교하기 위해 number 타입으로 형변환
	
	// 예약날짜가 과거일 경우 return false
	if(cur_year > res_year ||
			(cur_year == res_year && cur_month > res_month) ||
			(cur_year == res_year && cur_month == res_month && cur_date > res_date)){
		alert("예약가능한 날짜가 아닙니다.")
		return false;
	}
	
	// 예약시간이 과거일 경우 return false
	var res_start = reservation_start.replace(":","");
	var res_end = reservation_end.replace(":","");
	res_start *= 1;
	res_end *= 1;
	
	if(res_start > res_end || res_start == res_end){
		alert("예약가능한 시간이 아닙니다.")
		return false;
	}
	
	// 공백문자일 경우 return false
	if(reservation_date == ""){
		alert("날짜를 입력해주세요.");
		frm["reservation_date"].focus();
		return false;
	}
	if(reservation_start == "" || reservation_start == "시작 시간"){
		alert("시작 시간을 입력해주세요.");
		frm["reservation_start"].focus();
		return false;
	}
	if(reservation_end == "" || reservation_end == "종료 시간"){
		alert("종료 시간을 입력해주세요.");
		frm["reservation_end"].focus();
		return false;
	}
	if(reservation_count == "" ){
		alert("인원을 입력해주세요.");
		frm["reservation_count"].focus();
		return false;
	}
	if(reservation_price == ""){
		alert("금액이 0원입니다.");
		frm["reservation_date"].focus();
		return false;
	}
	if((reservation_end - reservation_start) < 0){
		alert("종료시간이 시작시간보다 앞설 수 없습니다.")
		frm["reservation_end"].focus();
		return false;
	}
	
	return true;
}
window.onload = function(){
	$(".spaceEmpty0").click(function(){
		var info = $(this).attr("class");
		
		var uid = info.split("#")[1];
		var name = info.split("#")[6];
		var price = info.split("#")[4];
		var seats = $("#space_uid").val();
		if(!seats){
			seats = uid;
		}else{
			seats = seats + "," + uid;		
		}
		$("#space_uid").val(seats);
		
		var selectedSeats = $("#selectedSeat").text();
		if(!selectedSeats){
			selectedSeats = name;
		}else{
			selectedSeats = selectedSeats + ", " + name;
		}
		
		$("#selectedSeat").text(selectedSeats);
		$("#reservation_seat").val(selectedSeats);
		var seatPrice = $("#reserve_price").val()*1;
		if(!seatPrice){
			seatPrice = price*1;
		}else{
			seatPrice = seatPrice*1 + price*1;
		}
		$("#reserve_price").val(seatPrice);
		$(this).addClass("selectingSeat");
	});	
	
	$(".boximg").mouseover(function(e){
		var space_uid = $(this).attr("class").split("#")[1];
		$.ajax({
			 url : "/nmj/ajax/store/getSpaceImg.ajax",
			 type : "POST",
			 cache : false,
			 data : {
				 "space_uid" : space_uid
			 },
			 success : function(data, status){
				if(status=="success"){
					insertImg(data);
				}
			 }
		 });
		if( imgCheck == 1){
			
			var divTop = e.pageY;
			var divLeft = e.pageX;
			$("#divView").css({
				"top" :divTop,
				"left" : divLeft,
				"position" :"absolute",
				"display" : "inline"
			});
		}
	});
	$(".boximg").mouseout(function(){
		$("#divView").hide();
	});
};
function insertImg(jsonObj){
	result = "";
	images.length = 0;
	if(jsonObj.status =="OK"){
		var list = jsonObj.list;
		for(var i = 0 ; i < jsonObj.count; i++){
			result ="<img src='${pageContext.request.contextPath}/img/space/";
			result += list[i].space_img_sav;
			result +="' style='width:300px; height:300px; background-repeat: no-repeat;	background-size: 100% 100%;'>";
			//result = "<img src='${pageContext.request.contextPath}/img/space/bill_space_img1.jpeg' style='width:300px; height:300px; background-repeat: no-repeat;	background-size: 100% 100%;'>";
			images[i] = result;
		}
		doNowIn();
		imgCheck = 1;
	}else{
		$("#divView").html("");
		imgCheck = 0;
	}
	
}

function doNowIn() {
    jQuery("#divView").srolling({
      data : images,
      auto : true,
      item_count : 1, 
      cache_count : 5, 
      width:  300,
      height : 300,
      delay : 5000,
      delay_frame : 0
    });
}; 
</script>
</html>