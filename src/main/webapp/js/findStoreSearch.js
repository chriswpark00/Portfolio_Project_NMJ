$(document).ready(function(){

    $("div#search-container > button.form2").click(function (){
    	
    	if($("div#search-container input").val().length == 0) {
    		alert("검색어를 입력해주세요");
    	} else {
    		var search = $("div#search-container input").val();
    		searchStoreName(search);
    	}
    	
    });

}); 