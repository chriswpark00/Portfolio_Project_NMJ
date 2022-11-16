<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 마이 페이지</title>
</head>
<body>
	<!-- 매장 회원에게 주어진 권한들로 이동할수있는 페이지 
		1. 회원 정보 수정
		2. 매장 정보 수정
		3. 매장 정보 수정 요청
		4. 음식 메뉴 관리
		5. 매장 공간 관리
		6. 내 매장 리뷰 보기
		
		// 넘겨줘야할 Parameter: store_uid
		1. storeGeneralSettings.nmj
		2. storeSettings.nmj
		3. storeSettingsRequest.nmj
		4. storeMyFood.nmj
		5. storeMySpace.nmj
		6. storeMyReview.nmj
	-->
	
	<button type="button" onclick="location.href = 'storeGeneralSettings.nmj'">회원 정보 수정</button>
	<button type="button" onclick="location.href = 'storeSettings.nmj'">매장 정보 수정</button>
	<button type="button" onclick="location.href = 'storeSettingsRequest.nmj'">매장 정보 수정 요청</button>
	<button type="button" onclick="location.href = 'storeMyFood.nmj'">음식 메뉴 관리</button>
	<button type="button" onclick="location.href = 'storeMySpace.nmj'">매장 공간 관리</button>
	<button type="button" onclick="location.href = 'storeMyReview.nmj'">내 매장 리뷰 보기</button>
	
</body>
</html>