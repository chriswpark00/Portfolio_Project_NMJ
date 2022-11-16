$(document).ready(function(){

	
    $("b#menu").click(function (){
    	
    	
    	if($(".modalContainer").css("display") == "none"){
    		$(".modalContainer").css("display", "block");
    		 $("b#menu").text("메뉴판 접기");
    	} else {
    		$(".modalContainer").css("display", "none");
    		$("b#menu").text("메뉴판 펼치기");
    	}
    	
    	
    });
    
    
    $("b#room").click(function (){
    	
    	
    	if($(".modalContainer").css("display") == "none"){
    		$(".modalContainer").css("display", "block");
    		 $("b#room").text("방사진 접기");
    	} else {
    		$(".modalContainer").css("display", "none");
    		$("b#room").text("방사진 보기");
    	}
    	
    	
    });
    
    
    

}); 