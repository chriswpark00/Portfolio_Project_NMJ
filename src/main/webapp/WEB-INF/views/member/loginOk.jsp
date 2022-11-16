<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<c:choose>
	<c:when test="${type == -1 }">
		<script>
			alert("아이디가 없거나 비밀번호가 일치하지 않습니다.");
			history.back();
		</script>  
	</c:when>
	<c:when test="${type == 1 }">
		<script>
			alert("손님 로그인 성공");
			location.href="${pageContext.request.contextPath}/member/main.nmj";
		</script>
	</c:when>
	<c:when test="${type == 2 }">
		<script>
			alert("매장 로그인 성공");
			location.href="${pageContext.request.contextPath}/store/storeMySpace.nmj";
		</script>
	</c:when>
	<c:when test="${type == 3 }">
		<script>
			alert("관리자 로그인 성공");
			location.href="${pageContext.request.contextPath}/admin/adminMember.nmj";
		</script>
	</c:when>
	<c:when test="${type == 0 }">
		<script>
			alert("아직 매장회원 승인이 되지 않으셨습니다.");
			location.href="${pageContext.request.contextPath}/member/main.nmj";
		</script>
	</c:when>
</c:choose>