<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${cnt == 0}">
	<script>
		alert("이미지 삭제 실패");
		history.back();
	</script>
</c:if>
<c:if test="${cnt == 1 }">
	<script>
		alert("이미지 삭제 성공");
		location.href = "storeImgDetail.nmj?space_uid=" + ${space_uid};
	</script>
</c:if>