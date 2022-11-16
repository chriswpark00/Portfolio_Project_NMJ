
var draggcnt = 0;
 var cntpc = 0;
 var cntkar = 0;
 var cntbil = 0;
 var cntbowl = 0;
 var cnttable = 0;
 var cntroom = 0;
 var spaceList_uid = new Array();
 var space_price = new Array();
 var space_count = new Array();
 var space_name = new Array();
 var space_xloc = new Array();
 var space_yloc = new Array();

 $(window).load(function(){
	 $(".spaceDelete").click(function(){
		 var space_uid = $(this).attr("class").split("#")[1];
		 $.ajax({
			 url : "/nmj/ajax/store/spaceDelete.ajax",
			 type : "POST",
			 cache : false,
			 data : {
				 "space_uid" : space_uid
			 },
			 success : function(data, status){
				 if(status="success"){
					 alert("삭제에 성공했습니다.");
					 location.reload();
				 }
			 }
		 });
	 });
	 $(".reservOk").click(function(){
		 var reservUid = $(this).attr("class").split(" ")[1];
		 $.ajax({
			 url : "/nmj/ajax/store/reservationOk.ajax",
			 type : "POST",
			 cache : false,
			 data : {
				 "reservation_uid" : reservUid
			 },
			 success : function(data, status){
				 if(status="success"){
					 location.reload();
				 }
			 }
		 });
	 });
	 $(".reservNo").click(function(){
		 var reservUid = $(this).attr("class").split(" ")[1];
		 $.ajax({
			 url : "/nmj/ajax/store/reservationNo.ajax",
			 type : "POST",
			 cache : false,
			 data : {
				 "reservation_uid" : reservUid
			 },
			 success : function(data, status){
				 if(status="success"){
					 location.reload();
				 }
			 }
		 });
		 
	 });
	  $("#addButton").click(function(){
		 var html = "";
		 var selectBox = $("#space_type").val();
		 var spaceNum = $("#spaceNum").val();
		 var spaceName = $("#spaceName").val();
		 var spacePrice = $("#spacePrice").val();
		 var draggString;
		 var boxListString = "";
		 draggcnt ++;
		 switch(selectBox){
		 case '1':
			 draggString = "#draggablepc";
			 html += '<div id="draggablepc'+ draggcnt + '" class="draggablepc ui-widget-content " style="width: ' + 50*spaceNum + 'px">';

			 for(var i = 0; i < spaceNum ; i++){
				 cntpc++;
				 html += '<div class="draggbox pcspecial pcspace infospace_count#' + 1 + ' infospace_price#' + spacePrice + ' infospaceName#' + cntpc + spaceName + ' infospaceList#1info" style="float:left"><div class="pcspaceimg" ></div><div class="pcNum">'+ cntpc + spaceName +'</div></div>';
			 }	
			 html +=  '</div>';
			 break;
		 case '2':
			 cntkar++;
			 draggString = "#draggablekar";
			 html += '<div id="draggablekar'+ draggcnt + '" class="draggablekar draggbox ui-widget-content infospace_count#' + spaceNum + ' infospace_price#' + spacePrice + ' infospaceName#' + spaceName + ' infospaceList#2info"><div class="karspaceimg"></div><div class="karNum">'+ spaceName + '</div></div>';
			 break;
		 case '3':
			 cntbil++;
			 draggString = "#draggablebil";
			 html += '<div id="draggablebil'+ draggcnt + '" class="draggablebil draggbox ui-widget-content infospace_count#' + spaceNum + ' infospace_price#' + spacePrice + ' infospaceName#' +  spaceName + ' infospaceList#3info"><div class="bilspaceimg"></div><div class="bilNum">' + spaceName + '</div></div>';
			 break;
		 case '4':
			 cntbowl++;
			 draggString = "#draggablebowl";
			 html += '<div id="draggablebowl'+ draggcnt + '" class="draggablebowl draggbox ui-widget-content infospace_count#' + spaceNum + ' infospace_price#' + spacePrice + ' infospaceName#' + spaceName + ' infospaceList#4info"><div class="bowlspaceimg"></div><div class="bowlNum">' + spaceName +'</div></div>';
			 break;
		 case '5':
			 cnttable++;
			 draggString = "#draggableTable";
			 html += '<div id="draggableTable'+ draggcnt + '" class="draggableTable draggbox ui-widget-content infospace_count#' + spaceNum + ' infospace_price#' + spacePrice + ' infospaceName#' + spaceName + ' infospaceList#5info"><div class="tablespaceimg"></div><div class="tableNum">' + spaceName + '</div></div>';
			 break;
		 default:
			 cntroom++;
			 draggString = "#draggableRoom";
   		 	 html += '<div id="draggableRoom'+ draggcnt + '" class="draggableRoom draggbox ui-widget-content infospace_count#' + spaceNum + ' infospace_price#' + spacePrice + ' infospaceName#' + spaceName + ' infospaceList#' + selectBox + 'info"><div class="roomspaceimg"></div><div class="roomNum">' + spaceName + '</div></div>';
			 break;
		 }
		 $("#boxMakingArea").append(html);
		 var makeDragg = draggString + draggcnt;
		 $(makeDragg).draggable({containment: "#draggArea"});
		 
		 if(cntpc != 0){
			 boxListString += "<div>총 PC 좌석 수 : " + cntpc + "석</div>";
		 }if(cntkar != 0){
			 boxListString += "<div>총 노래방 수 : " + cntkar + "개</div>";
		 }if(cntbil != 0){
			 boxListString += "<div>총  당구대 수 : " + cntbil + "개</div>";
		 }if(cntbowl != 0){
			 boxListString += "<div>총 볼링 레일 수 : " + cntbowl + "개</div>";
		 }if(cnttable != 0){
			 boxListString += "<div>총 테이블 수 : " + cnttable + "개</div>";
		 }if(cntroom != 0){
			 boxListString += "<div>총 방 수 : " + cntroom + "개</div>";
		 }
		 $("#boxListArea").html(boxListString);
	  });
		 $("#confirmbtn").click(function(){
			 var i = 0;
			 $(".draggbox").each(function(){
				 var text = $(this).attr('class');
				 var positionX = $(this).offset().left;
				 var positionY = $(this).offset().top;
				 var elements = text.split("info");
				 space_count[i] = elements[1].split("#")[1];
				 space_price[i] = elements[2].split("#")[1];
				 space_name[i] = elements[3].split("#")[1];
				 spaceList_uid[i] = elements[4].split("#")[1];
				 space_xloc[i] = positionX;
				 space_yloc[i] = positionY;				 
				 i++;
			 });
			 for(var j = 0; j < i ; j++){
				 $.ajax({
					 url : "/nmj/ajax/store/space.ajax",
					 type : "POST",
					 cache : false,
					 data : {
						 "store_uid" : store_uid,
						 "spaceList_uid" : spaceList_uid[j],
						 "space_count" : space_count[j],
						 "space_price" : space_price[j],
						 "space_name" : space_name[j],
						 "space_xloc" : space_xloc[j],
						 "space_yloc" : space_yloc[j]
					 },
					 success : function(data, status){
						 }
					 });
				 }				 
		 	});
	$(".spaceEmpty0").click(function(){
		var spaceInfo = $(this).attr("class");
		var dospaceuid = spaceInfo.split("space_uid")[1];
		var spaceuid = dospaceuid.split("#")[1];
		$.ajax({
			 url : "/nmj/ajax/store/spaceempty.ajax",
			 type : "POST",
			 cache : false,
			 data : {
				 "space_uid" : spaceuid,
				 "space_empty" : 1
			 },
			 success : function(data, status){
				 if(status == "success"){
					 alert("변경했습니다.");
				 }
				 else{
					 alert("변경에 실패했습니다.");
				 }
			 }
		 });
		$(this).addClass("spaceEmpty1");
		$(this).removeClass("spaceEmpty0");
		$(this).click(function(){
			var spaceInfo = $(this).attr("class");
			var dospaceuid = spaceInfo.split("space_uid")[1];
			var spaceuid = dospaceuid.split("#")[1];
			$.ajax({
				 url : "/nmj/ajax/store/spaceempty.ajax",
				 type : "POST",
				 cache : false,
				 data : {
					 "space_uid" : spaceuid,
					 "space_empty" : 0
				 },
				 success : function(data, status){
					 if(status == "success"){
						 alert("변경했습니다");
					 }
					 else{
						 alert("변경에 실패했습니다");
					 }
				 }
			 });
			$(this).addClass("spaceEmpty0");
			$(this).removeClass("spaceEmpty1");
		});
	});
	
	$(".spaceEmpty1").click(function(){
		var spaceInfo = $(this).attr("class");
		var dospaceuid = spaceInfo.split("space_uid")[1];
		var spaceuid = dospaceuid.split("#")[1];
		$.ajax({
			 url : "/nmj/ajax/store/spaceempty.ajax",
			 type : "POST",
			 cache : false,
			 data : {
				 "space_uid" : spaceuid,
				 "space_empty" : 0
			 },
			 success : function(data, status){
				 if(status == "success"){
					 alert("변경했습니다");
				 }
				 else{
					 alert("변경에 실패했습니다");
				 }
			 }
		 });
		$(this).addClass("spaceEmpty0");
		$(this).removeClass("spaceEmpty1");
		$(this).click(function(){
			var spaceInfo = $(this).attr("class");
			var dospaceuid = spaceInfo.split("space_uid")[1];
			var spaceuid = dospaceuid.split("#")[1];
			$.ajax({
				 url : "/nmj/ajax/store/spaceempty.ajax",
				 type : "POST",
				 cache : false,
				 data : {
					 "space_uid" : spaceuid,
					 "space_empty" : 1
				 },
				 success : function(data, status){
					 if(status == "success"){
						 alert("변경했습니다");
					 }
					 else{
						 alert("변경에 실패했습니다");
					 }
				 }
			 });
			$(this).addClass("spaceEmpty1");
			$(this).removeClass("spaceEmpty0");
		});
	});
	
});
	  
     