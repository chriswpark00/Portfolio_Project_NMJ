<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("수정에 실패했습니다.");
			history.back();
		</script>  
	</c:when>
	<c:when test="${result == 1 }">
		<c:choose>
			<c:when test="${sessionScope.mb_type == 1}">
				<script>
					alert("수정이 완료되었습니다.");
					location.href = "cusMyPage.nmj";
				</script>
			</c:when>
			<c:when test="${sessionScope.mb_type == 2}">
				<script>
					alert("수정이 완료되었습니다.");
					location.href = "${pageContext.request.contextPath}/store/storeMySpace.nmj";
				</script>
			</c:when>
			<c:otherwise>
				<script>
					alert("수정이 완료되었습니다.");
					location.href = "${pageContext.request.contextPath}/member/main.nmj";
				</script>
			</c:otherwise>
		</c:choose>
	</c:when>
</c:choose>