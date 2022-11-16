<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=241e9154c601bbf9fb3d6d3a33e4af25"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
//////////////////////////////
//////////////////////////////
//////////////////////////////지도 생성하기
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.499960, 127.035512), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	
	
	
//////////////////////////////
//////////////////////////////
////////////////////////////// 컨트롤 확대축소 
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	
	
//////////////////////////////
//////////////////////////////
////////////////////////////// 현재위치로 이동
	var myLocation = null;
	var myLocationImage = "${pageContext.servletContext.contextPath}/img/mapIcons/mylocation.png";
	var myLocationImageSize = new kakao.maps.Size(30, 30); // (넓이, 길이)
	var myLocationImageOption = {offset: new kakao.maps.Point(15, 30)};
	var jsonObjDistance = null;
	function findGPS() {
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		            lat = 37.499967; // 학원 위도
		            lon = 127.035501; // 학원 경도
		        var myPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		        var image = new kakao.maps.MarkerImage(myLocationImage, myLocationImageSize, myLocationImageOption);
		        myLocation = myPosition;
		        // 내위치 받아왓을 때 매장정보 가져오기
		        getJacksonForDistance(lat, lon);
		        
		        // 마커와 인포윈도우를 표시합니다
		        displayMyLocation(myPosition, image);
		            
		      });
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    alert("현재 위치 표시할 수 없습니다. GPS사용 허가를 해주세요");
		}

	}
	
	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	var circleExist = false;
	function displayMyLocation(locPosition, image) {

	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({  
	        map: map, 
	        position: locPosition,
	        image: image
	    }); 
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);
	    
	 // 지도에 표시할 원을 생성합니다
	 	if(!circleExist){ // 원 없을시 생성
	 		circleExist = true;
		    var circle = new kakao.maps.Circle({
		        center : locPosition,  // 원의 중심좌표 입니다 
		        radius: 500, // 미터 단위의 원의 반지름입니다 
		        strokeWeight: 5, // 선의 두께입니다 
		        strokeColor: '#75B8FA', // 선의 색깔입니다
		        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		        strokeStyle: 'dashed', // 선의 스타일 입니다
		        fillColor: '#CFE7FF', // 채우기 색깔입니다
		        fillOpacity: 0.1  // 채우기 불투명도 입니다   
		    }); 
		    // 지도에 원을 표시합니다 
		    circle.setMap(map);
	 	}

	}    
	
	function getJacksonForDistance(lat, lon){
		$.ajax({
			url : "${pageContext.servletContext.contextPath}/ajax/map/stores.ajax/" + lat + "/" + lon,
			type : "GET",
			cache : false,
			success : function(data, status){
				if(status == "success"){
					jsonObjDistance = data;
					return data;
				}
			}
		})
	}
	
//////////////////////////////
//////////////////////////////
////////////////////////////// 마커 표시
	$(document).ready(function(){
		getJackson(); //json
		findGPS();
	});
	var jsonObj = "";
	var l;
	var t;
	var markers = null;
	var infowindows = null;
	var infowindowsOpen = null;
	var infowindowCurrent = null;
	// 모든 매장 정보 받아오는 함수
	function getJackson(){
		$.ajax({
			url : "${pageContext.servletContext.contextPath}/ajax/store/dtypeList.ajax",
			type : "GET",
			cache : false,
			success : function(data, status){
				if(status == "success"){
					jsonObj = data;
				}
			}
		})
	}
	
	// 매장 상세 종류 목록 변경
	function changeDtype(type) {
		dtypes = jsonObj.store_types[type - 1].store_dtypes;
		l = dtypes.length;
		t = type;
		result = "";
			result += "<ul>";
		for( i = 0; i < l; i++){
			result += "<li id='\"" + dtypes[i].store_dtype +"\"' onclick='changeMarkers(\"" + dtypes[i].store_dtype +"\")'>";
			result += "<span>";
			result += "" + dtypes[i].store_dname;
			result += "</span>";
			result += "</li>";
		}
			result += "</ul>";
		$("div.sub-category").html(result);
	}
	
	/////////////////////////////
	// 특정 상세 종류 클릭시 매장 위도 경도 points변수에 담기
	function changeMarkers(dtype){
		l = jsonObjDistance.length;
		// 선택한 매장 상세 종류에 있는 모든 매장 stores에 담기.
		var stores = [];
		for(i = 0; i < l; i++){
			if(jsonObjDistance[i].store_dtype == dtype && jsonObjDistance[i].dist < 500){
				stores.push(i);
			}
		}
		
		// 마커 초기화 및 새로 불러오기
		if (markers == null){
			markers = [];
			infowindows = [];
			infowindowsOpen = [];
		} else {
			setNull(markers);			
			markers = [];
			infowindows = [];
			infowindowsOpen = [];
		}
		l = stores.length;
		for(i = 0; i < l; i++){
			var j = stores[i];
			markers[i] = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(jsonObjDistance[j].store_lat, jsonObjDistance[j].store_long),
				clickable: true,
				map: map,
				image: new kakao.maps.MarkerImage("${pageContext.servletContext.contextPath}/img/mapIcons/" + jsonObjDistance[j].icon , 
						new kakao.maps.Size(40, 40), {offset: new kakao.maps.Point(20, 40)})
			});
			//마커 지도에 표시
			markers[i].setMap(map);
			
			var content = "";
			content += "<div class='mapEvent' onclick=\"location.href = 'storeDetail.nmj?store_uid=" + jsonObjDistance[j].store_uid +"'\">";
			content += "<div><b>매장 명</b></div> <div> " + jsonObjDistance[j].store_name +"</div>";
			content += "<div><b>매장 영업시간</b></div> <div> " + jsonObjDistance[j].store_hours +"</div>";
			content += "</div>";
			
			var infowindow = new kakao.maps.InfoWindow({
			    content : content,
			    removable : true
			});
			infowindows[i] = infowindow;
			infowindowsOpen[i] = false;
			
			kakao.maps.event.addListener(markers[i], 'click', clickListener(map, markers[i], infowindow));
			// 지도 영역에 마커 포함시키기
			bounds.extend(new kakao.maps.LatLng(jsonObjDistance[j].store_lat, jsonObjDistance[j].store_long));
		}
		bounds.extend(myLocation);
		map.setBounds(bounds);
	}
	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function clickListener(map, marker, infowindow) {
	    return function() {
	        if(infowindowCurrent == null){
		        infowindowCurrent = infowindow;
	        } else{
	        	infowindowCurrent.close();
	        	infowindowCurrent = infowindow;
	        }
	        
		    infowindow.open(map, marker);
	    };
	}
	function setNull(markers){
		for (i = 0; i < markers.length; i++){
			markers[i].setMap(null);
		}
	}
//////////////////////////////
//////////////////////////////
////////////////////////////// 지도 영역  모든 마커 표시하게 바꾸기
	var bounds = new kakao.maps.LatLngBounds();
	
	
//////////////////////////////
//////////////////////////////
//////////////////////////////


//////////////////////////////
//////////////////////////////
//////////////////////////////
</script>