var newsUrl = "sshareNewsController.do?newsList"; //服务器地址
var startNum = 1;//当前页
	function newsJz(){
		for (var i = 0; i < document.querySelectorAll("#wrapper ul li").length; i++) {
	        document.querySelectorAll("#wrapper ul li")[i].colorfulBg();
	    }
	    refresher.init({
	        id: "wrapper",//<------------------------------------------------------------------------------------┐
	        pullDownAction: newsRefresh,
	        pullUpAction: newsLoad
	    });
	}
	        
	        var generatedCount = 0;
	        function newsRefresh() {
	            setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
	            	newsRefresh();
	                wrapper.newsRefresh();/****remember to newsRefresh newsRefreshaction completed！ ---yourId.newsRefresh(); ----| ****/
	                
	            }, 1000);

	        }

	        function newsLoad() {
	            setTimeout(function () {// <-- Simulate network congestion, remove setTimeout from production!
	            	startNum=startNum+1;
	            	$.ajax({
		    			async : false,
		    				url : newsUrl+"&currentPage="+startNum+"&pageSize=5", // 跨域URL
		    				type : 'get',
		    				data : startNum,
		    				timeout : 4000, 
		    				success : function(datas){
		    					var json  = $.parseJSON(datas);  
								 json = eval('(' + json + ')'); 
								var pageCount=(json[0])/5;
								if(parseInt(pageCount)==pageCount){
									count =pageCount;
								}else{
									count = parseInt(pageCount)+1;
								}
								  var htmls="";
								  for(var i=0;i<json.length;i++){ 
									  var NEWS_ID;
									  if(json[i].NEWS_ID==null || json[i].NEWS_ID =="undefined"){
										  NEWS_ID="";
									  }else{
										  NEWS_ID=json[i].NEWS_ID;
									  }
									  var NEWS_TYPE_ID;
									  if(json[i].NEWS_TYPE_ID==null || json[i].NEWS_TYPE_ID =="undefined"){
										  NEWS_TYPE_ID="";
									  }else{
										  NEWS_TYPE_ID=json[i].NEWS_TYPE_ID;
									  }
									  var NEWS_SUBTITLE;
									  if(json[i].NEWS_SUBTITLE==null || json[i].NEWS_SUBTITLE == "undefined"){
										  NEWS_SUBTITLE="";
									  }else{
										  NEWS_SUBTITLE=json[i].NEWS_SUBTITLE;
									  }
									  var NEWS_TITLE;
									  if(json[i].NEWS_TITLE==null || json[i].NEWS_TITLE == "undefined"){
										  NEWS_TITLE="";
									  }else{
										  NEWS_TITLE=json[i].NEWS_TITLE;
									  }
									  var PUBLIC_USER_NAME;
									  if(json[i].PUBLIC_USER_NAME==null || json[i].PUBLIC_USER_NAME == "undefined"){
										  PUBLIC_USER_NAME="";
									  }else{
										  PUBLIC_USER_NAME=json[i].PUBLIC_USER_NAME;
									  }
									  var NEWS_ATTACHMENT;
									  if(json[i].NEWS_ATTACHMENT==null || json[i].NEWS_ATTACHMENT == "undefined"){
										  NEWS_ATTACHMENT="";
									  }else{
										  NEWS_ATTACHMENT="http://192.168.1.33:8099/sritplat-mserver/"+json[i].NEWS_ATTACHMENT;
									  } 
									  var NEWS_TYPE_NAME;
									  if(json[i].NEWS_TYPE_NAME==null || json[i].NEWS_TYPE_NAME == "undefined"){
										  NEWS_TYPE_NAME="";
									  }else{
										  NEWS_TYPE_NAME=json[i].NEWS_TYPE_NAME;
									  }
									  var PUBIC_STATUS_NAME;
									  if(json[i].PUBIC_STATUS_NAME==null || json[i].PUBIC_STATUS_NAME == "undefined"){
										  PUBIC_STATUS_NAME="";
									  }else{
										  PUBIC_STATUS_NAME=json[i].PUBIC_STATUS_NAME;
									  }
									  var PUBLIC_TIME;
									  if(json[i].PUBLIC_TIME==null || json[i].PUBLIC_TIME == "undefined"){
										  PUBLIC_TIME="";
									  }else{
										  PUBLIC_TIME=json[i].PUBLIC_TIME;
									  }
									  var ATTACH_PATH;
									  if(json[i].ATTACH_PATH==null || json[i].ATTACH_PATH == "undefined"){
										  ATTACH_PATH="";
									  }else{
										  ATTACH_PATH=json[i].ATTACH_PATH;
									  }
		    						  
									  htmls+='<li style="top: 6px;"  class="item-content" href="javascript:" onclick="showHis(\''+NEWS_ID+'\')">'
		    					      htmls+='<div class="item-media" style="height: 84px;width: 84px;margin-left: -10px;"><img src="'+NEWS_ATTACHMENT+'" style="height:100%;width:100%"></div>'
		    						  htmls+='<div class="item-inner">';
		    						  htmls+='<div class="item-subtitle" style="padding: 1px 0px;color:#4e6eb2;top: -14px; ">'+NEWS_TITLE+'</div>';
		    						  htmls+='<div class="item-title-row" style="margin-top: -12px;">';
		    						  htmls+='<div class="item-title" style="padding:0px 0px ;color:#aaaaaa " >'+NEWS_SUBTITLE+'</div>';
//		    						  htmls+='<div class="item-after">老张</div>';
//		    						  htmls+='<div class="item-after">点击回帖</div>';
		    						  htmls+='</div>';
		    						  htmls+='<div class="item-title-row">';
		    						  htmls+='<div class="item-title" style="padding:0px 0px ;color: #1ad0bd;top: 18px;">'+PUBLIC_TIME+'</div>';
		    						  htmls+='</div>';
		    						  htmls+='</div>';
		    						  htmls+='</li>' 
		    					  };
		    							if(htmls!=null && htmls!=""){
		    								$("#lbuln").append(htmls);
		    								//$("#fpmxList").listview("newsRefresh");
		    								setTimeout(function() { // <-- Simulate network congestion, remove setTimeout from production!			
		    								if (Number(startNum) >= Number(count)) {
		    									myAlert('已加载完全部信息');
		    								}
		    							}, 1500);
		    							}
		    				},
		    				complete : function(XMLHttpRequest, textStatus) {
		    				},
		    				error : function(xhr) {
		    					//jsonp 方式此方法不被触发
		    					//请求出错处理 
		    					myAlert("请求出错(请检查相关度网络状况.)");
		    					myScroll.newsRefresh();
		    				}
		    			});
	                wrapper.newsRefresh();/****remember to newsRefresh after action completed！！！   ---id.newsRefresh(); --- ****/
	                
	            }, 1000);
	        }
	        function initialNews(){
	        	
	    		//count = 5; //总页数
	    		$.ajax({
	    			async : false,
	    				url : newsUrl+"&currentPage="+startNum+"&pageSize=5", // 跨域URL
	    				type : 'get',
	    				data : startNum,
	    				timeout : 4000, 
	    				success : function(datas){
	    					var json  = $.parseJSON(datas);  
							 json = eval('(' + json + ')'); 
							var pageCount=(json[0])/5;
							if(parseInt(pageCount)==pageCount){
								count =pageCount;
							}else{
								count = parseInt(pageCount)+1;
							}
							  var htmls="";
							  for(var i=0;i<json.length;i++){ 
								  var NEWS_ID;
								  if(json[i].NEWS_ID==null || json[i].NEWS_ID =="undefined"){
									  NEWS_ID="";
								  }else{
									  NEWS_ID=json[i].NEWS_ID;
								  }
								  var NEWS_TYPE_ID;
								  if(json[i].NEWS_TYPE_ID==null || json[i].NEWS_TYPE_ID =="undefined"){
									  NEWS_TYPE_ID="";
								  }else{
									  NEWS_TYPE_ID=json[i].NEWS_TYPE_ID;
								  }
								  var NEWS_SUBTITLE;
								  if(json[i].NEWS_SUBTITLE==null || json[i].NEWS_SUBTITLE == "undefined"){
									  NEWS_SUBTITLE="";
								  }else{
									  NEWS_SUBTITLE=json[i].NEWS_SUBTITLE;
								  }
								  var NEWS_TITLE;
								  if(json[i].NEWS_TITLE==null || json[i].NEWS_TITLE == "undefined"){
									  NEWS_TITLE="";
								  }else{
									  NEWS_TITLE=json[i].NEWS_TITLE;
								  }
								  var PUBLIC_USER_NAME;
								  if(json[i].PUBLIC_USER_NAME==null || json[i].PUBLIC_USER_NAME == "undefined"){
									  PUBLIC_USER_NAME="";
								  }else{
									  PUBLIC_USER_NAME=json[i].PUBLIC_USER_NAME;
								  }
								  var NEWS_ATTACHMENT;
								  if(json[i].NEWS_ATTACHMENT==null || json[i].NEWS_ATTACHMENT == "undefined"){
									  NEWS_ATTACHMENT="";
								  }else{
									  NEWS_ATTACHMENT="http://192.168.1.33:8099/sritplat-mserver/"+json[i].NEWS_ATTACHMENT;
								  } 
								  var NEWS_TYPE_NAME;
								  if(json[i].NEWS_TYPE_NAME==null || json[i].NEWS_TYPE_NAME == "undefined"){
									  NEWS_TYPE_NAME="";
								  }else{
									  NEWS_TYPE_NAME=json[i].NEWS_TYPE_NAME;
								  }
								  var PUBIC_STATUS_NAME;
								  if(json[i].PUBIC_STATUS_NAME==null || json[i].PUBIC_STATUS_NAME == "undefined"){
									  PUBIC_STATUS_NAME="";
								  }else{
									  PUBIC_STATUS_NAME=json[i].PUBIC_STATUS_NAME;
								  }
								  var PUBLIC_TIME;
								  if(json[i].PUBLIC_TIME==null || json[i].PUBLIC_TIME == "undefined"){
									  PUBLIC_TIME="";
								  }else{
									  PUBLIC_TIME=json[i].PUBLIC_TIME;
								  }
								  var ATTACH_PATH;
								  if(json[i].ATTACH_PATH==null || json[i].ATTACH_PATH == "undefined"){
									  ATTACH_PATH="";
								  }else{
									  ATTACH_PATH=json[i].ATTACH_PATH;
								  }
	    						  
								  	  htmls+='<li style="top: 6px;"  class="item-content" href="javascript:" onclick="showHis(\''+NEWS_ID+'\')">'
		    					      htmls+='<div class="item-media" style="height: 84px;width: 84px;margin-left: -10px;"><img src="'+NEWS_ATTACHMENT+'" style="height:100%;width:100%"></div>'
		    						  htmls+='<div class="item-inner">';
		    						  htmls+='<div class="item-subtitle" style="padding: 1px 0px;color:#4e6eb2;top: -14px; ">'+NEWS_TITLE+'</div>';
		    						  htmls+='<div class="item-title-row" style="margin-top: -12px;">';
		    						  htmls+='<div class="item-title" style="padding:0px 0px ;color:#aaaaaa " >'+NEWS_SUBTITLE+'</div>';
//		    						  htmls+='<div class="item-after">老张</div>';
//		    						  htmls+='<div class="item-after">点击回帖</div>';
		    						  htmls+='</div>';
		    						  htmls+='<div class="item-title-row">';
		    						  htmls+='<div class="item-title" style="padding:0px 0px ;color: #1ad0bd;top: 18px;">'+PUBLIC_TIME+'</div>';
		    						  htmls+='</div>';
		    						  htmls+='</div>';
		    						  htmls+='</li>' 
	    					  };
	    							if(htmls!=null && htmls!=""){
	    								$("#lbuln").append(htmls);
	    								//$("#fpmxList").listview("newsRefresh");
	    								setTimeout(function() { // <-- Simulate network congestion, remove setTimeout from production!			
	    								if (Number(startNum) >= Number(count)) {
	    									myAlert('已加载完全部信息');
	    								}
	    							}, 1500);
	    							}	
	    				},
	    				complete : function(XMLHttpRequest, textStatus) {
	    				},
	    				error : function(xhr) {
	    					//jsonp 方式此方法不被触发
	    					//请求出错处理 
	    					myAlert("请求出错(请检查相关度网络状况.)");
	    					myScroll.newsRefresh();
	    				}
	    			});
	        }
	        function newsRefresh(){
	        	$('#lbuln li').remove();
//	        	$("#lbul").append("");
	        	startNum=1;
	        	initialNews();
	        }
	        function showHis(news_id){
	        	console.log(news_id);
	        	document.getElementById("news_id").value=news_id;
	        	document.form.submit();
}