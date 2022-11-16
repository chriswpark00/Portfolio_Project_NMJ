<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>지도</title>
<style>
.map_wrap {
	position: relative;
	overflow: hidden;
	width: 80%;
	height: 600px;
}

.radius_border {
	border: 1px solid #919191;
	border-radius: 5px;
}

.custom_gps {
	position: absolute;
	bottom: 10px;
	right: 10px;
	width: 36px;
	height: 40px;
	overflow: hidden;
	z-index: 1;
	background-color: #f5f5f5;
}

.custom_gps span {
	display: block;
	width: 36px;
	height: 40px;
	text-align: center;
	cursor: pointer;
}

.custom_gps span img {
	width: 15px;
	height: 15px;
	padding: 12px 0;
	border: none;
}

.custom_gps span:first-child {
	border-bottom: 1px solid #bfbfbf;
}

</style>
</head>
<body>
	<div class="map_wrap">
		<!-- 지도를 표시할 div-->
	    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
		
		<!-- 사용자 위치 설정 + 그 위치 중앙으로 표시 -->
		<div class="custom_gps radius_border">
			<span onclick="findGPS()"><img src="${pageContext.servletContext.contextPath}/img/mapIcons/gps.png" alt="현재위치"></span>  
		</div>
	</div>
	
	<!-- 매장 종류 -->
	<div class="category">
        <ul>
            <li id="coffeeMenu" onclick="changeDtype('1')">
                <span class="ico_comm ico_coffee"></span>
				놀자
            </li>
            <li id="storeMenu" onclick="changeDtype('2')">
                <span class="ico_comm ico_store"></span>
             	먹자
            </li>
            <li id="carparkMenu" onclick="changeDtype('3')">
                <span class="ico_comm ico_carpark"></span>
              	자자
            </li>
        </ul>
    </div>
    
    <!--  매장 상세 종류  -->
    <div class="sub-category">
    
    </div>
    
</body>
<jsp:include page="mapScript.jsp"></jsp:include>
</html>