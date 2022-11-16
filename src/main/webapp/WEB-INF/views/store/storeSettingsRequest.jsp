<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=241e9154c601bbf9fb3d6d3a33e4af25&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>매장 정보 수정 요청</title>
</head>
<body>
<!-- 매장 회원에게 권한이 없는 수정 목록
	매장 이릅 store_name
	매장 주소 store_address
	매장 사업자 등록 번호 store_regNum
	매장 사업자 등록 원본 store_regImg_org
	매장 사업자 등록 저장 store_regImg_sav
	매장 종류 store_type
	매장 상세 종류 store_dtype
	매장 위도 store_lat
	매장 경도 store_long
	운영자에게 한마디? text
	 -->
<jsp:include page="storeHeader.jsp"></jsp:include>

<div id="fh5co-contact-section">
	<div class="container">
		<div class="row">
			<div class="animate-box fadeInUp animated">
				<form action="storeSettingsRequestOk.nmj" enctype="Multipart/form-data" method="post" onsubmit="return chkUpdate()">
				 	<input type="hidden" name="store_uid" value="${result.store_uid}">
				 	<input type="hidden" id="x" name="entX" value="${result.store_long}">
					<input type="hidden" id="y" name="entY" value="${result.store_lat}">
				 	
				 	<div class="col-md-12">
					 	<div class="form-group">
				 			<label>매장 이름 변경</label>
					 	</div>
				 	</div>
				 	<div class="col-md-12">
					 	<div class="form-group">
						 	<input class="form-control" type="text" name="store_name" value="${result.store_name}" placeholder="매장명..." required>
					 	</div>
				 	</div>

				 	<div class="col-md-12">
					 	<div class="form-group">
				 			<label>매장 주소 변경</label>
					 	</div>
				 	</div>
				 	<div class="col-md-10">
					 	<div class="form-group">
						 	<input class="form-control" type="text" id="sample5_address" name="store_address" value="${result.store_address}" readonly>
					 	</div>
				 	</div>
				 	<div class="col-md-2">
					 	<div class="form-group">
						 	<button class="btn btn-secondary btn-lg" type="button" onclick="sample5_execDaumPostcode()">주소찾기</button>
					 	</div>
				 	</div>
				 	<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
				 	
				 	<div class="col-md-12">
					 	<div class="form-group">
					 		<label>매장 사업자 등록 번호 변경</label>
					 	</div>
				 	</div>
				 	
				 	<div class="col-md-12">
					 	<div class="form-group">
				 			<input class="form-control" type="text" name="store_regNum" pattern="[0-9]{3}-[0-9]{2}-[0-9]{5}" value="${result.store_regNum}" placeholder="사업자 등록 번호..." required>
					 	</div>
				 	</div>
				 	
				 	<div class="col-md-12">
					 	<div class="form-group">
					 		<label>매장 사업자 등록증 변경</label>
					 	</div>
				 	</div>
				 	<div class="col-md-8">
					 	<div class="form-group">
						 	<img style="width: 100%; height: 100%;" alt="${result.store_regImg_sav}" src="${pageContext.servletContext.contextPath}/img/store/${result.store_regImg_sav}">
					 	</div>
				 	</div>
				 	<div class="col-md-12">
					 	<div class="form-group">
						 	<input type="file" name="upload" accept="image/*">
					 	</div>
				 	</div>
				 	
				 	<div class="col-md-12">
					 	<div class="form-group">
					 		<label>매장 종류 변경</label>
					 	</div>
				 	</div>
				 	<div class="col-md-12">
					 	<div class="form-group">
						 	<select class="store_type form-control" id="store_type" name="store_type" onchange="changeDetails()">
						 		<option value="1">놀자</option>
						 		<option value="2">먹자</option>
						 		<option value="3">자자</option>
						 	</select>
					 	</div>
				 	</div>
				 	
				 	<div class="col-md-12">
					 	<div class="form-group">
					 		<label>매장 상세 종류 변경</label>
					 	</div>
				 	</div>
				 	<div class="col-md-12">
					 	<div class="form-group">
							<select class="store_dtype form-control" name="store_dtype">
						 	</select>
					 	</div>
				 	</div>
				 	<div class="col-md-12">
					 	<div class="form-group">
							 <button class="btn btn-primary btn-lg" type="submit">정보 수정 요청</button>
							 <button class="btn btn-lg" type="button" onclick="history.back()">이전</button>
					 	</div>
				 	</div>
				 	
				 	
				</form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
<script>

/////////////////////////////////////////////////////////////////////////////////////////////////// 상세 종류 목록 변경
$(document).ready(function(){
	$("#store_type option[value='${result.store_type}']").attr('selected', 'selected');
	getJackson(); //json
});
var jsonObj = "";
var l;
	
function changeDetails() {
	var type = $("select.store_type").children("option:selected").val() - 1;
	var dtypes = jsonObj.store_types[type].store_dtypes;
	l = dtypes.length;
	var result = "";
	for(i = 0; i < l; i++){
		
		if(dtypes[i].store_dtype == ${result.store_dtype}){
			result += "<option value='" + dtypes[i].store_dtype + "' selected>" + dtypes[i].store_dname + "</option>";
		}else{
			result += "<option value='" + dtypes[i].store_dtype + "'>" + dtypes[i].store_dname + "</option>";
		}
	}
	
	$("select.store_dtype").html(result);
	
}

function getJackson(){
	$.ajax({
		url : "${pageContext.servletContext.contextPath}/ajax/store/dtypeList.ajax",
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
//////////////////////////////////////////////////////////////////////////////////////////////	주소 api
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        var result = results[0]; //첫번째 결과의 값을 활용
		                document.getElementById("x").value = result.x;
		                document.getElementById("y").value = result.y;
                    }
                });
            }
        }).open();
    }

	
</script>
</html>