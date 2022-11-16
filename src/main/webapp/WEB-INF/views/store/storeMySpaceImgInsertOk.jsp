<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${cnt == 0}">
	<script>
		alert("사진 추가 실패");
		history.back();
	</script>
</c:if>
<c:if test="${cnt == 1 }">
	<script>
		alert("사진 추가 성공");
		window.close();
	</script>
</c:if>