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
		        var myPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		        var image = new kakao.maps.MarkerImage(myLocationImage, myLocationImageSize, myLocationImageOption);
		        
		        // 내위치 받아왓을 때 매장정보 가져오기
//		        getJacksonForDistance(lat, lon)
		        getJacksonForDistance(37.500464, 127.036709)
		        
		        // 마커와 인포윈도우를 표시합니다
		        displayMyLocation(myPosition, image);
		            
		      });
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    alert("현재 위치 표시할 수 없습니다. GPS사용 허가를 해주세요");
		}

	}
	
	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMyLocation(locPosition, image) {

	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({  
	        map: map, 
	        position: new kakao.maps.LatLng(37.500464, 127.036709),
	        image: image
	    }); 
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(new kakao.maps.LatLng(37.500464, 127.036709));  
	 // 지도에 표시할 원을 생성합니다
	    var circle = new kakao.maps.Circle({
	        center : new kakao.maps.LatLng(37.500464, 127.036709),  // 원의 중심좌표 입니다 
	        radius: 1000, // 미터 단위의 원의 반지름입니다 
	        strokeWeight: 5, // 선의 두께입니다 
	        strokeColor: '#75B8FA', // 선의 색깔입니다
	        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	        strokeStyle: 'dashed', // 선의 스타일 입니다
	        fillColor: '#CFE7FF', // 채우기 색깔입니다
	        fillOpacity: 0.7  // 채우기 불투명도 입니다   
	    }); 

	    // 지도에 원을 표시합니다 
	    circle.setMap(map);
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
			if(jsonObjDistance[i].store_dtype == dtype && jsonObjDistance[i].dist < 1000){
				stores.push(i);
			}
		}
		
		// 마커 초기화 및 새로 불러오기
		if (markers == null){
			markers = [];
		} else {
			setNull(markers);			
			markers = [];
		}
		l = stores.length;
		for(i = 0; i < l; i++){
			var j = stores[i];
			markers[i] = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(jsonObjDistance[j].store_lat, jsonObjDistance[j].store_long),
				image: new kakao.maps.MarkerImage("${pageContext.servletContext.contextPath}/img/mapIcons/" + jsonObjDistance[j].icon , new kakao.maps.Size(22, 26), {offset: new kakao.maps.Point(0, 30)})
			});
			markers[i].setMap(map);
			bounds.extend(new kakao.maps.LatLng(jsonObjDistance[j].store_lat, jsonObjDistance[j].store_long));
		}
		
		map.setBounds(bounds);
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