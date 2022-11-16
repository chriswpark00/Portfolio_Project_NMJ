<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>

	.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}

.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #999;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-radius: 5px;
}

/* named upload */
.filebox .upload-name {
    display: inline-block;
  height: 35px;
  font-size:18px; 
  padding: 0 10px;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-radius: 5px;

}
</style>
<script>
	$("#file").on('change',function(){
	  var fileName = $("#file").val();
	  $(".upload-name").val(fileName);
	});
	

	
</script>
</head>
<body onload="window.resizeTo(600,200)">
	<div class="filebox">
	<form id="frm" name="frm" action="storeMySpaceImgInsertOk.nmj" method="post" enctype="Multipart/form-data">
		 <label for="file">업로드</label> 
		<input type="file"  id="file" name="upload" accept="image/*">	
		<c:forEach var="list" items="${space_uid}">
			<input type="hidden" name="space_uid" value="${list }">
		</c:forEach>
		<input class="upload-name" value="파일선택">
		<button type="submit">등록</button>
	</form>
	</div>
</body>
</html>