var newsUrl = "sshareNewsController.do?newsList"; //服务器地址
var newstartNum = 1;//当前页
	function newsJz(){
		for (var i = 0; i < document.querySelectorAll("#wrapper ul li").length; i++) {
	        document.querySelectorAll("#wrapper ul li")[i].colorfulBg();
	    }
	    refresher.init({
	        id: "wrapper",//<------------------------------------------------------------------------------------┐
	        pullDownAction: Refresh,
	        pullUpAction: LoadNews
	    });
	}
	        
	        var generatedCount = 0;
	        function Refresh() {
	            setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
	            	refresh();
	                wrapper.refresh();/****remember to refresh after  action completed！ ---yourId.refresh(); ----| ****/
	                
	            }, 1000);

	        }

	        function LoadNews() {
//	        	debugger;
	            setTimeout(function () {// <-- Simulate network congestion, remove setTimeout from production!
	            	newstartNum=newstartNum+1;
	            	$.ajax({
		    			async : false,
		    				url : newsUrl+"&currentPage="+newstartNum+"&pageSize=8", // 跨域URL
		    				type : 'get',
		    				data : newstartNum,
		    				timeout : 4000, 
		    				success : function(datas){
		    					var json  = $.parseJSON(datas);  
		    					if(json!=""){
		    						
		    						json = eval('(' + json + ')'); 
		    					}
								var pageCount=(json[0])/8;
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
										  NEWS_ATTACHMENT="http://218.246.87.36/sritplat-mserver/"+json[i].NEWS_ATTACHMENT;
//										  NEWS_ATTACHMENT="http://192.168.1.33:8099/sritplat-mserver/"+json[i].NEWS_ATTACHMENT;
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
		    						  
									  htmls+='<li style="top: 14px;"  class="item-content" href="javascript:" onclick="showHis(\''+NEWS_ID+'\')">'
		    					      htmls+='<div class="item-media" style="margin-top: -6px;height: 84px;width: 84px;margin-left: -10px;"><img src="'+NEWS_ATTACHMENT+'" style="height:100%;width:100%"></div>'
		    						  htmls+='<div class="item-inner" style="Style="top: 5px;"">';
		    						  htmls+='<div class="item-subtitle" style="padding: 2px 0px;color:#4e6eb2;top: -12px; ">'+NEWS_TITLE+'</div>';
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
		    								//$("#fpmxList").listview("refresh");
		    								setTimeout(function() { // <-- Simulate network congestion, remove setTimeout from production!			
		    								if (Number(newstartNum) >= Number(count)) {
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
		    					myScroll.refresh();
		    				}
		    			});
	                wrapper.refresh();/****remember to refresh after action completed！！！   ---id.refresh(); --- ****/
	                
	            }, 1000);
	        }
	        function initialNews(){
	    		//count = 5; //总页数
	    		$.ajax({
	    			async : false,
	    				url : newsUrl+"&currentPage="+newstartNum+"&pageSize=8", // 跨域URL
	    				type : 'get',
	    				data : newstartNum,
	    				timeout : 4000, 
	    				success : function(datas){
//	    					console.info("2",datas);
	    					var json  = $.parseJSON(datas);  
							 json = eval('(' + json + ')'); 
							var pageCount=(json[0])/8;
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
									  NEWS_ATTACHMENT="http://218.246.87.36/sritplat-mserver/"+json[i].NEWS_ATTACHMENT;
//									  NEWS_ATTACHMENT="http://192.168.1.33:8099/sritplat-mserver/"+json[i].NEWS_ATTACHMENT;
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
		    						  htmls+='<div class="item-inner" Style="top: 5px;">';
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
	    								//$("#fpmxList").listview("refresh");
	    								setTimeout(function() { // <-- Simulate network congestion, remove setTimeout from production!			
	    								if (Number(newstartNum) >= Number(count)) {
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
	    					myScroll.refresh();
	    				}
	    			});
	        }
	        
	        function refresh(){
	        	$('#lbuln li').remove();
//	        	$("#lbul").append("");
	        	newstartNum=1;
	        	initialNews();
	        }
	        function showHis(news_id){
	        	$.ajax({
	    			async : false,
	    				url :"sshareNewsController.do?newsContent" , // 跨域URL
	    				type : 'get',
	    				timeout : 4000, 
	    				success : function(datas){
	    					 document.getElementById("divid").innerHTML=datas;
	    					 setTimeout(showHislist(news_id),2000);
	    				},
	    				complete : function(XMLHttpRequest, textStatus) {
	    				},
	    				error : function(xhr) {
	    					//jsonp 方式此方法不被触发
	    					//请求出错处理 
	    				}
	    			});
}
	        
	        function showHislist(news_id){
	        	$.ajax({
	    			async : false,
	    				url :"sshareNewsController.do?newsContentlist&news_id="+news_id , // 跨域URL
	    				type : 'get',
	    				timeout : 4000, 
	    				success : function(datas){
	    					var json  = $.parseJSON(datas); 
	    					if(json.length>0){
	    						json = eval('(' + json + ')');
	    					}
	    						  $(".page_title").html(json[0].news_title);
	    							$("#subtitle").html(json[0].news_subtitle);
	    							var newsPicture="http://218.246.87.36/sritplat-mserver/"+json[0].news_attachment;
//	    							var newsPicture="http://192.168.1.33:8099/sritplat-mserver/"+json[0].news_attachment;
	    							$("#imageNews").attr("src",newsPicture);
	    							$('p').html(json[0].news_content);
//	    					 }
	    					 //document.getElementById("divid").innerHTML=datas;
	    				},
	    				complete : function(XMLHttpRequest, textStatus) {
	    				},
	    				error : function(xhr) {
	    					//jsonp 方式此方法不被触发
	    					//请求出错处理 
	    				}
	    			});
}
	       