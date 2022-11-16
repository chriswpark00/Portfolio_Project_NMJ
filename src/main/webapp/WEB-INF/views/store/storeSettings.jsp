<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>매장 정보 수정</title>
</head>
<body>
<!-- 승인 없이 처리할 매장 정보 페이지
	1. 매장 전화 번호 2. 매장 영업 시간 3. 매장 설명 4. 매장 사진
	1. store_tel (정규 표현식 js 검증)
	2. store_hours (st_start~st_end) = store_hours
	3. store_content
	4. store_img_org / store_img_sav (업로드시 이미지 확장자로 보이게(html) + 확장자 검증후 db저장(java))
	 -->
<jsp:include page="storeHeader.jsp"></jsp:include>


<div id="fh5co-contact-section">
	<div class="container">
		<div class="row">
			<div class="animate-box fadeInUp animated">
				<form name="frm" action="storeSettingsOk.nmj" method="post" onsubmit="return chkUpdate()" enctype="Multipart/form-data">
				 	<input type="hidden" name="store_uid" value="${result.store_uid}">
				 	
			 		<div class="col-md-12">
					 	<div class="form-group">
				 			<label>전화번호</label>
					 	</div>
				 	</div>
			 		<div class="col-md-12">
					 	<div class="form-group">
					 		<input class="form-control" type="text" name="store_tel" value="${result.store_tel}" pattern="(^02.{0}|^01.{1}|[0-9]{3})-([0-9]+)-([0-9]{4})" placeholder="ex) 010-1234-1234" required>
					 	</div>
				 	</div>
				 	
			 		
			 		<div class="col-md-12">
					 	<div class="form-group">
				 			<label>영업시간</label>
					 	</div>
				 	</div>
			 	
			 		<div class="col-md-5">
					 	<div class="form-group">
							<select class="form-control" name="store_start" id="store_start">
								<option value="00:00">00:00</option>
								<option value="00:30">00:30</option>
								<option value="01:00">01:00</option>
								<option value="01:30">01:30</option>
								<option value="02:00">02:00</option>
								<option value="02:30">02:30</option>
								<option value="03:00">03:00</option>
								<option value="03:30">03:30</option>
								<option value="04:00">04:00</option>
								<option value="04:30">04:30</option>
								<option value="05:00">05:00</option>
								<option value="05:30">05:30</option>
								<option value="06:00">06:00</option>
								<option value="06:30">06:30</option>
								<option value="07:00">07:00</option>
								<option value="07:30">07:30</option>
								<option value="08:00">08:00</option>
								<option value="08:30">08:30</option>
								<option value="09:00">09:00</option>
								<option value="09:30">09:30</option>
								<option value="10:00">10:00</option>
								<option value="10:30">10:30</option>
								<option value="11:00">11:00</option>
								<option value="11:30">11:30</option>
								<option value="12:00">12:00</option>
								<option value="12:30">12:30</option>
								<option value="13:00">13:00</option>
								<option value="13:30">13:30</option>
								<option value="14:00">14:00</option>
								<option value="14:30">14:30</option>
								<option value="15:00">15:00</option>
								<option value="15:30">15:30</option>
								<option value="16:00">15:00</option>
								<option value="16:30">15:30</option>
								<option value="17:00">15:00</option>
								<option value="17:30">15:30</option>
								<option value="18:00">18:00</option>
								<option value="18:30">18:30</option>
								<option value="19:00">19:00</option>
								<option value="19:30">19:30</option>
								<option value="20:00">20:00</option>
								<option value="20:30">20:30</option>
								<option value="21:00">21:00</option>
								<option value="21:30">21:30</option>
								<option value="22:00">22:00</option>
								<option value="22:30">22:30</option>
								<option value="23:00">23:00</option>
								<option value="23:30">23:30</option>
							</select>
					 	</div>
				 	</div>
				 	
				 	<div class="col-md-2">
					 	<div class="form-group" style="text-align: center">
							<label>~</label>
					 	</div>
				 	</div>
				 	
				 	<div class="col-md-5">
					 	<div class="form-group">
							<select class="form-control" name="store_end" id="store_end">
								<option value="00:00">00:00</option>
								<option value="00:30">00:30</option>
								<option value="01:00">01:00</option>
								<option value="01:30">01:30</option>
								<option value="02:00">02:00</option>
								<option value="02:30">02:30</option>
								<option value="03:00">03:00</option>
								<option value="03:30">03:30</option>
								<option value="04:00">04:00</option>
								<option value="04:30">04:30</option>
								<option value="05:00">05:00</option>
								<option value="05:30">05:30</option>
								<option value="06:00">06:00</option>
								<option value="06:30">06:30</option>
								<option value="07:00">07:00</option>
								<option value="07:30">07:30</option>
								<option value="08:00">08:00</option>
								<option value="08:30">08:30</option>
								<option value="09:00">09:00</option>
								<option value="09:30">09:30</option>
								<option value="10:00">10:00</option>
								<option value="10:30">10:30</option>
								<option value="11:00">11:00</option>
								<option value="11:30">11:30</option>
								<option value="12:00">12:00</option>
								<option value="12:30">12:30</option>
								<option value="13:00">13:00</option>
								<option value="13:30">13:30</option>
								<option value="14:00">14:00</option>
								<option value="14:30">14:30</option>
								<option value="15:00">15:00</option>
								<option value="15:30">15:30</option>
								<option value="16:00">15:00</option>
								<option value="16:30">15:30</option>
								<option value="17:00">15:00</option>
								<option value="17:30">15:30</option>
								<option value="18:00">18:00</option>
								<option value="18:30">18:30</option>
								<option value="19:00">19:00</option>
								<option value="19:30">19:30</option>
								<option value="20:00">20:00</option>
								<option value="20:30">20:30</option>
								<option value="21:00">21:00</option>
								<option value="21:30">21:30</option>
								<option value="22:00">22:00</option>
								<option value="22:30">22:30</option>
								<option value="23:00">23:00</option>
								<option value="23:30">23:30</option>
								<option value="24:00">24:00</option>
							</select>
					 	</div>
				 	</div>
				 	
				 	<div class="col-md-12">
					 	<div class="form-group">
							<label>매장 설명</label>
					 	</div>
				 	</div>
					<div class="col-md-12">
					 	<div class="form-group">
				 			<textarea class="form-control" name="store_content" rows="10" cols="40">${result.store_content}</textarea>
					 	</div>
				 	</div>
				 	
				 	<div class="col-md-12">
					 	<div class="form-group">
							<label>매장 사진 변경</label>
					 	</div>
				 	</div>
				 	<div class="col-md-8">
					 	<div class="form-group">
						 	<img style="width: 100%; height: 100%;" src="${pageContext.servletContext.contextPath}/img/store/${result.store_img_sav}">
					 	</div>
				 	</div>
				 	<div class="col-md-12">
					 	<div class="form-group">
						 	<input type="file" name="upload" accept="image/*">
					 	</div>
				 	</div>
				 	
				 	<div class="col-md-12">
					 	<div class="form-group">
						 	<button type="submit" class="btn btn-primary btn-lg">수정</button>
						 	<button type="button" class="btn btn-lg" onclick="history.back()">이전</button>
					 	</div>
				 	</div>
				 	
				 	<div class="form-group">
				 		<div class="col-md-3">
				 		</div>
				 	</div>
				</form>
			</div>
		</div>
	</div>
</div>


<jsp:include page="../footer.jsp"></jsp:include>

<script>
$(document).ready(function(){
	$("#store_start option[value='${result.store_start}']").attr('selected', 'selected');
	$("#store_end option[value='${result.store_end}']").attr('selected', 'selected');
});
</script>
</body>
</html>