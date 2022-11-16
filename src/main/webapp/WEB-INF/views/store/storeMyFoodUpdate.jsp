<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>음식 수정</title>
</head>
<body>
<jsp:include page="storeHeader.jsp"></jsp:include>
<div id="fh5co-contact-section">
	<div class="container">
		<div class="row">
			<div class="animate-box fadeInUp animated">
				<form name="frm" action="storeMyFoodUpdateOk.nmj" method="post" onsubmit="return chkUpdate()">
					<input type="hidden" name="food_uid" value="${dto.food_uid}">
					
					
					<div class="col-md-12">
						<div class="form-group">
							<label>음식 명</label>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input class="form-control" type="text" name="food_name" value="${dto.food_name}" placeholder="음식명" required>
						</div>
					</div>


					<div class="col-md-12">
						<div class="form-group">
							<label>음식 가격</label>
						</div>
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input class="form-control" type="text" name="food_price" value="${dto.food_price}" pattern="^[1-9][0-9]*" placeholder="ex) 2000" required>
						</div>
					</div>					
					
					
					<div class="col-md-12">
					 	<div class="form-group">
						 	<button type="submit" class="btn btn-primary btn-lg">수정</button>
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
</html>