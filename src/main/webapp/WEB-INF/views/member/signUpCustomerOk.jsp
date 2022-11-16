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
			alert("놀먹자에 오신 것을 환영합니다 고객님 :)");
			location.href="main.nmj";
		</script>
	</c:when>
</c:choose>