<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  #feedback { font-size: 1.4em; }
  #selectable .ui-selecting { background: #FECA40; }
  #selectable .ui-selected { background: #F39814; color: white; }
  #selectable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
  #selectable li { margin: 3px; padding: 0.4em; font-size: 1.4em; height: 18px; }
  </style>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
</head>
<body>

<p id="feedback">
<span>고르신 공간 : </span> <span id="select-result">없음</span>.
<form name ="space_uids"id="space_uids" target="매장 이미지 넣기" method="post">
</form>
	<button id="imgAllInsert">이미지 넣기</button>


</p>
<div>
	<div>
	<ol id="selectable">
		<c:forEach var="list" items="${space }">
			<li class="space_uid${list.space_uid } ui-widget-content">
				<a href="storeImgDetail.nmj?space_uid=${list.space_uid }">${list.space_name }</a>
				<button onclick="location.href='storeImgDetail.nmj?space_uid=${list.space_uid}'">이미지 상세 페이지</button> 
			</li>
		</c:forEach>
		</ol>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
$( function() {
    $( "#selectable" ).selectable({
      stop: function() {
        var result = $( "#select-result" ).empty();
     
        var uidsText = "<input type='hidden' id='space_uid' name='space_uid' value='";
        $( ".ui-selected", this ).each(function() {
          var index = $( "#selectable li" ).index( this );
          var text = $( "#selectable li" ).get(index).innerText;
          text = text.split("이미지 상세 페이지")[0];
          var space_uidText = $("#selectable li").get(index).innerHTML;
          space_uid = space_uidText.split("=")[2];
          space_uid = space_uid.split('"')[0];
          uidsText +=  space_uid + ","; 
          result.append(text+ " ");
        });
        uidsText += "'>";
        $("#space_uids").html(uidsText);
      }
    });
  } );
  $(document).ready(function(){
	 $("#imgAllInsert").click(function(){
		 var space_uid = $("#space_uid").val();
		 if(space_uid.length > 0){
		 window.open("storeMySpaceImgInsert.nmj?space_uid="+ space_uid , "매장 이미지 넣기"	, "width=400, height=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
		 }
		 
	 }); 
  });
  </script>
</html>