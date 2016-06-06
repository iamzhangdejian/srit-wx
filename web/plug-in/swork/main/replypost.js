var replyURL = "SworkShareController.do?replyList"; //服务器地址
var replyNum = 1;//当前页
var postidq="";
	function replyjz(){
		for (var i = 0; i < document.querySelectorAll("#wrapper ul li").length; i++) {
	        document.querySelectorAll("#wrapper ul li")[i].colorfulBg();
	    }
	    refresher.init({
	        id: "wrapper",//<------------------------------------------------------------------------------------┐
	        pullDownAction: replyRefresh,
	        pullUpAction: replyLoad
	    });
	}
	        
	        var generatedCount = 0;
	        function replyRefresh() {
	            setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
	            	replyrefresh();
	                wrapper.refresh();/****remember to refresh after  action completed！ ---yourId.refresh(); ----| ****/
	                
	            }, 1000);

	        }

	        function replyLoad() {
	            setTimeout(function () {// <-- Simulate network congestion, remove setTimeout from production!
	            	replyNum=replyNum+1;
	            	$.ajax({
		    			async : false,
		    				url : replyURL+"&currentPage="+replyNum+"&pageSize=5&postid="+postidq, // 跨域URL
		    				type : 'get',
		    				data : replyNum,
		    				timeout : 4000, 
		    				success : function(datas){
		    					var json  = $.parseJSON(datas);  
		    					if(json.length>0){
		    						json = eval('(' + json + ')');
		    					}
		    					var pageCount=(json[0])/5;
		    					if(parseInt(pageCount)==pageCount){
		    						count =pageCount;
		    					}else{
		    						count = parseInt(pageCount)+1;
		    					}
		    					  var htmls="";
		    					  for(var i=0;i<json.length;i++){ 
		    						  var POST_REPLY_TIME;
		    						  if(json[i].POST_REPLY_TIME==null || json[i].POST_REPLY_TIME =="undefined"){
		    							  POST_REPLY_TIME="";
		    						  }else{
		    							  POST_REPLY_TIME=json[i].POST_REPLY_TIME;
		    						  }
		    						  var POST_REPLY_CONTENT;
		    						  if(json[i].POST_REPLY_CONTENT==null || json[i].POST_REPLY_CONTENT =="undefined"){
		    							  POST_REPLY_CONTENT="";
		    						  }else{
		    							  POST_REPLY_CONTENT=json[i].POST_REPLY_CONTENT;
		    						  }
		    						  var POST_REPLY_USER_NAME;
		    						  if(json[i].SEND_TIME==null || json[i].POST_REPLY_USER_NAME =="undefined"){
		    							  POST_REPLY_USER_NAME="";
		    						  }else{
		    							  POST_REPLY_USER_NAME=json[i].POST_REPLY_USER_NAME;
		    						  }
//		    						  var CASE_TYPE_NAME;
//		    						  if(json[i].CASE_TYPE_NAME==null || json[i].CASE_TYPE_NAME == "undefined"){
//		    							  CASE_TYPE_NAME="";
//		    						  }else{
//		    							  CASE_TYPE_NAME=json[i].CASE_TYPE_NAME;
//		    						  }
//		    						  var SEND_OP_INFO;
//		    						  if(json[i].SEND_OP_INFO==null || json[i].SEND_OP_INFO == "undefined"){
//		    							  SEND_OP_INFO="";
//		    						  }else{
//		    							  SEND_OP_INFO=json[i].SEND_OP_INFO;
//		    						  }
//		    						  var CASE_POS_DESC;
//		    						  if(json[i].CASE_POS_DESC==null || json[i].CASE_POS_DESC == "undefined"){
//		    							  CASE_POS_DESC="";
//		    						  }else{
//		    							  CASE_POS_DESC=json[i].CASE_POS_DESC;
//		    						  } 
//		    						  var CASE_BIZ_TYPE_NAME;
//		    						  if(json[i].CASE_BIZ_TYPE_NAME==null || json[i].CASE_BIZ_TYPE_NAME == "undefined"){
//		    							  CASE_BIZ_TYPE_NAME="";
//		    						  }else{
//		    							  CASE_BIZ_TYPE_NAME=json[i].CASE_BIZ_TYPE_NAME;
//		    						  } 
//		    						  var CASE_BIZ_TYPE_ID;
//		    						  if(json[i].CASE_BIZ_TYPE_ID==null || json[i].CASE_BIZ_TYPE_ID == "undefined"){
//		    							  CASE_BIZ_TYPE_ID="";
//		    						  }else{
//		    							  CASE_BIZ_TYPE_ID=json[i].CASE_BIZ_TYPE_ID;
//		    						  }
//		    						  var CASE_ID;
//		    						  if(json[i].CASE_ID==null || json[i].CASE_ID == "undefined"){
//		    							  CASE_ID="";
//		    						  }else{
//		    							  CASE_ID=json[i].CASE_ID;
//		    						  }
//		    						  var CASE_BIZ_SN;
//		    						  if(json[i].CASE_BIZ_SN==null || json[i].CASE_BIZ_SN == "undefined"){
//		    							  CASE_BIZ_SN="";
//		    						  }else{
//		    							  CASE_BIZ_SN=json[i].CASE_BIZ_SN;
//		    						  }
		    						  
		    						  htmls+='<li>'
		    							  htmls+='<div class="item-subtitle" style="padding: 7px 10px;color: #5183E2">'+POST_REPLY_USER_NAME+'</div>';
		    							  htmls+='<div class="item-title-row">'; 
		    							  htmls+='<div class="content-padded" style="padding:0px 10px ;font-size:14px;color: #5183E2">';
		    							  htmls+='<p>'+POST_REPLY_CONTENT+'</p>';
		    						      htmls+='</div>';
		    							  htmls+='</div>' ;
		    							  htmls+='<div class="item-title-row">';
		    							  htmls+='<div></div>';
		    							  htmls+='<div class="item-after" style="font-size:14px">'+POST_REPLY_TIME+'</div>';
		    							  htmls+='</div>';
		    						  htmls+='</li>' ;
		    					  };
		    							if(htmls!=null && htmls!=""){
		    								$("#replyul").append(htmls);
		    								//$("#fpmxList").listview("refresh");
		    								setTimeout(function() { // <-- Simulate network congestion, remove setTimeout from production!			
		    								if (Number(replyNum) >= Number(count)) {
		    									//myAlert('已加载完全部信息');
		    								}
		    							}, 1500);
		    							}
		    				},
		    				complete : function(XMLHttpRequest, textStatus) {
		    				},
		    				error : function(xhr) {
		    					//jsonp 方式此方法不被触发
		    					//请求出错处理 
		    					//myAlert("请求出错(请检查相关度网络状况.)");
		    					myScroll.refresh();
		    				}
		    			});
	                wrapper.refresh();/****remember to refresh after action completed！！！   ---id.refresh(); --- ****/
	                
	            }, 1000);
	        }
	        function replyinitial(){
	        	
	    		//count = 5; //总页数
	    		$.ajax({
	    			async : false,
	    				url : replyURL+"&currentPage="+replyNum+"&pageSize=5&postid="+postidq, // 跨域URL
	    				type : 'get',
	    				data : replyNum,
	    				timeout : 4000, 
	    				success : function(datas){
	    					var json  = $.parseJSON(datas);  
	    					if(json.length>0){
	    						json = eval('(' + json + ')');
	    					}
	    					var pageCount=(json[0])/5;
	    					if(parseInt(pageCount)==pageCount){
	    						count =pageCount;
	    					}else{
	    						count = parseInt(pageCount)+1;
	    					}
	    				
	    					  var htmls="";
	    					  for(var i=0;i<json.length;i++){ 
	    						  var POST_REPLY_TIME;
	    						  if(json[i].POST_REPLY_TIME==null || json[i].POST_REPLY_TIME =="undefined"){
	    							  POST_REPLY_TIME="";
	    						  }else{
	    							  POST_REPLY_TIME=json[i].POST_REPLY_TIME;
	    						  }
	    						  var POST_REPLY_CONTENT;
	    						  if(json[i].POST_REPLY_CONTENT==null || json[i].POST_REPLY_CONTENT =="undefined"){
	    							  POST_REPLY_CONTENT="";
	    						  }else{
	    							  POST_REPLY_CONTENT=json[i].POST_REPLY_CONTENT;
	    						  }
	    						  var POST_REPLY_USER_NAME;
	    						  if(json[i].POST_REPLY_USER_NAME==null || json[i].POST_REPLY_USER_NAME == "undefined"){
	    							  POST_REPLY_USER_NAME="";
	    						  }else{
	    							  POST_REPLY_USER_NAME=json[i].POST_REPLY_USER_NAME;
	    						  }
//	    						  var SEND_OP_INFO;
//	    						  if(json[i].SEND_OP_INFO==null || json[i].SEND_OP_INFO == "undefined"){
//	    							  SEND_OP_INFO="";
//	    						  }else{
//	    							  SEND_OP_INFO=json[i].SEND_OP_INFO;
//	    						  }
//	    						  var CASE_POS_DESC;
//	    						  if(json[i].CASE_POS_DESC==null || json[i].CASE_POS_DESC == "undefined"){
//	    							  CASE_POS_DESC="";
//	    						  }else{
//	    							  CASE_POS_DESC=json[i].CASE_POS_DESC;
//	    						  } 
//	    						  var CASE_BIZ_TYPE_NAME;
//	    						  if(json[i].CASE_BIZ_TYPE_NAME==null || json[i].CASE_BIZ_TYPE_NAME == "undefined"){
//	    							  CASE_BIZ_TYPE_NAME="";
//	    						  }else{
//	    							  CASE_BIZ_TYPE_NAME=json[i].CASE_BIZ_TYPE_NAME;
//	    						  } 
//	    						  var CASE_BIZ_TYPE_ID;
//	    						  if(json[i].CASE_BIZ_TYPE_ID==null || json[i].CASE_BIZ_TYPE_ID == "undefined"){
//	    							  CASE_BIZ_TYPE_ID="";
//	    						  }else{
//	    							  CASE_BIZ_TYPE_ID=json[i].CASE_BIZ_TYPE_ID;
//	    						  }
//	    						  var CASE_ID;
//	    						  if(json[i].CASE_ID==null || json[i].CASE_ID == "undefined"){
//	    							  CASE_ID="";
//	    						  }else{
//	    							  CASE_ID=json[i].CASE_ID;
//	    						  }
//	    						  var CASE_BIZ_SN;
//	    						  if(json[i].CASE_BIZ_SN==null || json[i].CASE_BIZ_SN == "undefined"){
//	    							  CASE_BIZ_SN="";
//	    						  }else{
//	    							  CASE_BIZ_SN=json[i].CASE_BIZ_SN;
//	    						  }
	    						  
	    						  htmls+='<li>'
	    							  htmls+='<div class="item-subtitle" style="padding: 7px 10px;color: #5183E2">'+POST_REPLY_USER_NAME+'</div>'
		    							  htmls+='<div class="item-title-row">'
		    							  htmls+='<div class="content-padded" style="border-width:1px;padding:0px 10px ;font-size:17px;color: #5183E2">'
		    							  htmls+='<p>'+POST_REPLY_CONTENT+'</p>'
		    						      htmls+='</div>'
		    							  htmls+='</div>'
		    							  htmls+='<div class="item-title-row">'
		    							  htmls+='<div></div>'
		    							  htmls+='<div class="item-after" style="font-size:14px">'+POST_REPLY_TIME+'</div>'
		    							  htmls+='</div>'
	    						  htmls+='</li>' 
	    					  };
	    							if(htmls!=null && htmls!=""){
	    								$("#replyul").append(htmls);
	    								//$("#fpmxList").listview("refresh");
	    								setTimeout(function() { // <-- Simulate network congestion, remove setTimeout from production!			
	    								if (Number(replyNum) >= Number(count)) {
	    									//myAlert('已加载完全部信息');
	    								}
	    							}, 1500);
	    							}
	    				},
	    				complete : function(XMLHttpRequest, textStatus) {
	    				},
	    				error : function(xhr) {
	    					//jsonp 方式此方法不被触发
	    					//请求出错处理 
	    					//myAlert("请求出错(请检查相关度网络状况.)");
	    					myScroll.refresh();
	    				}
	    			});
	        }
	        function refresh(){
	        	$('#replyul li').remove();
//	        	$("#replyul").append("");
	        	replyNum=1;
	        	replyinitial();
	        }
	        function replyrefresh(){
	        	$('#replyul li').remove();
//	        	$("#replyul").append("");
	        	replyNum=1;
	        	replyinitial();
	        }