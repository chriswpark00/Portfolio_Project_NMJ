<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>음식 추가</title>
</head>
<body>
<jsp:include page="storeHeader.jsp"></jsp:include>

<div id="fh5co-contact-section">
	<div class="container">
		<div class="row">
			<div class="animate-box fadeInUp animated">
				<form name="frm" action="storeMyFoodInsertOk.nmj" method="post" onsubmit="return chkUpdate()" enctype="Multipart/form-data">
					<input type="hidden" name="store_uid" value="${store_uid}">
					<div class="col-md-12">
						<div class="form-group">
							<label>음식 이름</label>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input class="form-control food_name" type="text" name="food_name" value="" placeholder="음식 이름" required>
						</div>
					</div>
					
					
					<div class="col-md-12">
						<div class="form-group">
							<label>음식 가격</label>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input class="form-control" type="text" name="food_price" value="" pattern="^[1-9][0-9]*" placeholder="ex) 2000" required>
						</div>
					</div>


					<div class="col-md-12">
						<div class="form-group">
							<label>음식 사진</label>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="file" name="upload" accept="image/*">
						</div>
					</div>
					
					
					<div class="col-md-12">
					 	<div class="form-group">
						 	<button type="submit" class="btn btn-primary btn-lg">추가</button>
						 	<button type="button" class="btn btn-lg" onclick="history.back()">이전</button>
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
$(document).ready(function(){
	getJackson(); //json
});
var jsonObj = "";
var l;
function chkUpdate(){
	food = jsonObj;
	l = food.length;
	var name = $("input.food_name").val();
	for(i = 0; i < l; i++){
		if(food[i].food_name === name){
			alert("이미 추가된 음식입니다.");
			$("input.food_name").focus();
			return false;
		}
		
	}
}	
function getJackson(){
	$.ajax({
		url : "${pageContext.servletContext.contextPath}/ajax/store/foodList.ajax/${store_uid}",
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				jsonObj = data;
			}
		}
	})
}
</script>
</html>