<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<c:choose>  
	<c:when test="${result == 0}">
		<script>
			alert("다시 정보를 입력해주세요.");
			history.back();
		</script>  
	</c:when>
	<c:when test="${result == 1}">
		<script>
			alert("다음 양식으로 넘어갑니다.");
			location.href="signUpStoreReg.nmj?mb_uid=${mb_uid}";
		</script>
	</c:when>
</c:choose>