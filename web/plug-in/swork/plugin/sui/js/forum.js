var serverURL = "sworkQuesrController.do?taskList"; //服务器地址
var startNum = 1;//当前页
	function jz(){
		for (var i = 0; i < document.querySelectorAll("#wrapper ul li").length; i++) {
	        document.querySelectorAll("#wrapper ul li")[i].colorfulBg();
	    }
	    refresher.init({
	        id: "wrapper",//<------------------------------------------------------------------------------------┐
	        pullDownAction: Refresh,
	        pullUpAction: Load
	    });
	}
	        
	        var generatedCount = 0;
	        function Refresh() {
	            setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
	            	refresh();
	                wrapper.refresh();/****remember to refresh after  action completed！ ---yourId.refresh(); ----| ****/
	                
	            }, 1000);

	        }

	        function Load() {
	            setTimeout(function () {// <-- Simulate network congestion, remove setTimeout from production!
	            	startNum=startNum+1;
	            	$.ajax({
		    			async : false,
		    				url : serverURL+"&currentPage="+startNum+"&pageSize=5", // 跨域URL
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
		    					  for(var i=1;i<json.length;i++){ 
		    						  var CASE_CODE;
		    						  if(json[i].CASE_CODE==null || json[i].CASE_CODE =="undefined"){
		    							  CASE_CODE="";
		    						  }else{
		    							  CASE_CODE=json[i].CASE_CODE;
		    						  }
		    						  var SEND_TIME;
		    						  if(json[i].SEND_TIME==null || json[i].SEND_TIME =="undefined"){
		    							  SEND_TIME="";
		    						  }else{
		    							  SEND_TIME=json[i].SEND_TIME;
		    						  }
		    						  var CASE_TYPE_NAME;
		    						  if(json[i].CASE_TYPE_NAME==null || json[i].CASE_TYPE_NAME == "undefined"){
		    							  CASE_TYPE_NAME="";
		    						  }else{
		    							  CASE_TYPE_NAME=json[i].CASE_TYPE_NAME;
		    						  }
		    						  var SEND_OP_INFO;
		    						  if(json[i].SEND_OP_INFO==null || json[i].SEND_OP_INFO == "undefined"){
		    							  SEND_OP_INFO="";
		    						  }else{
		    							  SEND_OP_INFO=json[i].SEND_OP_INFO;
		    						  }
		    						  var CASE_POS_DESC;
		    						  if(json[i].CASE_POS_DESC==null || json[i].CASE_POS_DESC == "undefined"){
		    							  CASE_POS_DESC="";
		    						  }else{
		    							  CASE_POS_DESC=json[i].CASE_POS_DESC;
		    						  } 
		    						  var CASE_BIZ_TYPE_NAME;
		    						  if(json[i].CASE_BIZ_TYPE_NAME==null || json[i].CASE_BIZ_TYPE_NAME == "undefined"){
		    							  CASE_BIZ_TYPE_NAME="";
		    						  }else{
		    							  CASE_BIZ_TYPE_NAME=json[i].CASE_BIZ_TYPE_NAME;
		    						  } 
		    						  var CASE_BIZ_TYPE_ID;
		    						  if(json[i].CASE_BIZ_TYPE_ID==null || json[i].CASE_BIZ_TYPE_ID == "undefined"){
		    							  CASE_BIZ_TYPE_ID="";
		    						  }else{
		    							  CASE_BIZ_TYPE_ID=json[i].CASE_BIZ_TYPE_ID;
		    						  }
		    						  var CASE_ID;
		    						  if(json[i].CASE_ID==null || json[i].CASE_ID == "undefined"){
		    							  CASE_ID="";
		    						  }else{
		    							  CASE_ID=json[i].CASE_ID;
		    						  }
		    						  var CASE_BIZ_SN;
		    						  if(json[i].CASE_BIZ_SN==null || json[i].CASE_BIZ_SN == "undefined"){
		    							  CASE_BIZ_SN="";
		    						  }else{
		    							  CASE_BIZ_SN=json[i].CASE_BIZ_SN;
		    						  }
		    						  
		    						  htmls+='<li>'
		    						  htmls+='<div class="item-inner">';
		    						  htmls+='<div class="item-subtitle" style="padding: 7px 10px;color: #5183E2">主题</div>';
		    						  htmls+='<div class="item-title-row">';
		    						  htmls+='<div class="item-title" style="padding:0px 10px ;color: #5183E2">'+SEND_TIME+'</div>';
		    						  htmls+='<div class="item-after">老张</div>';
		    						  htmls+='<div class="item-after">点击回帖</div>';
		    						  htmls+='</div>';
		    						  htmls+='</div>';
		    						  htmls+='</li>' 
		    					  };
		    							if(htmls!=null && htmls!=""){
		    								$("#lbul").append(htmls);
		    								//$("#fpmxList").listview("refresh");
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
		    					myScroll.refresh();
		    				}
		    			});
	                wrapper.refresh();/****remember to refresh after action completed！！！   ---id.refresh(); --- ****/
	                
	            }, 1000);
	        }
	        function initial(){
	        	
	    		//count = 5; //总页数
	    		$.ajax({
	    			async : false,
	    				url : serverURL+"&currentPage="+startNum+"&pageSize=5", // 跨域URL
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
	    					  for(var i=1;i<json.length;i++){ 
	    						  var CASE_CODE;
	    						  if(json[i].CASE_CODE==null || json[i].CASE_CODE =="undefined"){
	    							  CASE_CODE="";
	    						  }else{
	    							  CASE_CODE=json[i].CASE_CODE;
	    						  }
	    						  var SEND_TIME;
	    						  if(json[i].SEND_TIME==null || json[i].SEND_TIME =="undefined"){
	    							  SEND_TIME="";
	    						  }else{
	    							  SEND_TIME=json[i].SEND_TIME;
	    						  }
	    						  var CASE_TYPE_NAME;
	    						  if(json[i].CASE_TYPE_NAME==null || json[i].CASE_TYPE_NAME == "undefined"){
	    							  CASE_TYPE_NAME="";
	    						  }else{
	    							  CASE_TYPE_NAME=json[i].CASE_TYPE_NAME;
	    						  }
	    						  var SEND_OP_INFO;
	    						  if(json[i].SEND_OP_INFO==null || json[i].SEND_OP_INFO == "undefined"){
	    							  SEND_OP_INFO="";
	    						  }else{
	    							  SEND_OP_INFO=json[i].SEND_OP_INFO;
	    						  }
	    						  var CASE_POS_DESC;
	    						  if(json[i].CASE_POS_DESC==null || json[i].CASE_POS_DESC == "undefined"){
	    							  CASE_POS_DESC="";
	    						  }else{
	    							  CASE_POS_DESC=json[i].CASE_POS_DESC;
	    						  } 
	    						  var CASE_BIZ_TYPE_NAME;
	    						  if(json[i].CASE_BIZ_TYPE_NAME==null || json[i].CASE_BIZ_TYPE_NAME == "undefined"){
	    							  CASE_BIZ_TYPE_NAME="";
	    						  }else{
	    							  CASE_BIZ_TYPE_NAME=json[i].CASE_BIZ_TYPE_NAME;
	    						  } 
	    						  var CASE_BIZ_TYPE_ID;
	    						  if(json[i].CASE_BIZ_TYPE_ID==null || json[i].CASE_BIZ_TYPE_ID == "undefined"){
	    							  CASE_BIZ_TYPE_ID="";
	    						  }else{
	    							  CASE_BIZ_TYPE_ID=json[i].CASE_BIZ_TYPE_ID;
	    						  }
	    						  var CASE_ID;
	    						  if(json[i].CASE_ID==null || json[i].CASE_ID == "undefined"){
	    							  CASE_ID="";
	    						  }else{
	    							  CASE_ID=json[i].CASE_ID;
	    						  }
	    						  var CASE_BIZ_SN;
	    						  if(json[i].CASE_BIZ_SN==null || json[i].CASE_BIZ_SN == "undefined"){
	    							  CASE_BIZ_SN="";
	    						  }else{
	    							  CASE_BIZ_SN=json[i].CASE_BIZ_SN;
	    						  }
	    						  
	    						  htmls+='<li>'
	    						  htmls+='<div class="item-inner">';
	    						  htmls+='<div class="item-subtitle" style="padding: 7px 10px;color: #5183E2">主题</div>';
	    						  htmls+='<div class="item-title-row">';
	    						  htmls+='<div class="item-title" style="padding:0px 10px ;color: #5183E2">'+SEND_TIME+'</div>';
	    						  htmls+='<div class="item-after">老张</div>';
	    						  htmls+='<div class="item-after"><a>点击回帖</a></div>';
	    						  htmls+='</div>';
	    						  htmls+='</div>';
	    						  htmls+='</li>' 
	    					  };
	    							if(htmls!=null && htmls!=""){
	    								$("#lbul").append(htmls);
	    								//$("#fpmxList").listview("refresh");
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
	    					myScroll.refresh();
	    				}
	    			});
	        }
	        function refresh(){
	        	$('#lbul li').remove();
//	        	$("#lbul").append("");
	        	startNum=1;
	        	initial();
	        }