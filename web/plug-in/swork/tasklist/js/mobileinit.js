$(document).bind("mobileinit", function(){   
	// $.mobile.ajaxEnabled = false;
	// $.mobile.linkBindingEnabled = false;
	$.mobile.defaultPageTransition = "none";         
	$.mobile.activeBtnClass="ui-btn-hover-a";
	$.mobile.page.prototype.options.domCache = false; 
	//禁止hover延迟
	$.mobile.buttonMarkup.hoverDelay = "false";
	$.mobile.loader.prototype.options.text = "正在加载...";
	$.mobile.loader.prototype.options.textVisible = true;
	$.mobile.loader.prototype.options.theme = "a";
	$.mobile.loader.prototype.options.html = "";

        //Thanks: https://github.com/jquery/jquery-mobile/issues/3414 
        $.mobile.loader.prototype.defaultHtml = "<div id='hideDiv' class='ui-loader' data-overlay-theme='a' class='ui-content' style='opacity: 0.5;'>" +
        "<span class='ui-icon ui-icon-loading'></span>" +
        "<h1></h1>" +
        "<div class='ui-loader-curtain'></div>" +
        "</div>";
        
    });
function hideLoads(){
	
	setTimeout(function(){
		$("#hideDiv").remove();
		
	},2000);
}
