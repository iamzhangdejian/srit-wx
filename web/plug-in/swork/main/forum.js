var serverURL = "SworkShareController.do?shareList"; //服务器地址
var startNum = 1;//当前页
var posttypeid="";

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
		    				url : serverURL+"&currentPage="+startNum+"&pageSize=8&posttypeid="+posttypeid, // 跨域URL
		    				type : 'get',
		    				data : startNum,
		    				timeout : 4000, 
		    				success : function(datas){
		    					var json  = $.parseJSON(datas); 
		    					if(json.length>0){
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
		    						  //主题名称
		    						  var POST_SUBJECT_NAME;
		    						  if(json[i].POST_SUBJECT_NAME==null || json[i].POST_SUBJECT_NAME =="undefined"){
		    							  POST_SUBJECT_NAME="";
		    						  }else{
		    							  POST_SUBJECT_NAME=json[i].POST_SUBJECT_NAME;
		    						  }
		    						  //主题ID
		    						  var POST_ID;
		    						  if(json[i].POST_ID==null || json[i].POST_ID =="undefined"){
		    							  POST_ID="";
		    						  }else{
		    							  POST_ID=json[i].POST_ID;
		    						  }
		    						  //发帖人
		    						  var POST_RPT_USER_NAME;
		    						  if(json[i].POST_RPT_USER_NAME==null || json[i].POST_RPT_USER_NAME == "undefined"){
		    							  POST_RPT_USER_NAME="";
		    						  }else{
		    							  POST_RPT_USER_NAME=json[i].POST_RPT_USER_NAME;
		    						  }
		    						  //发帖时间
		    						  var POST_RPT_TIME;
		    						  if(json[i].POST_RPT_TIME==null || json[i].POST_RPT_TIME == "undefined"){
		    							  POST_RPT_TIME="";
		    						  }else{
		    							  POST_RPT_TIME=json[i].POST_RPT_TIME;
		    						  }
		    						  //发帖人name
		    						  var POST_RPT_USER_ID;
		    						  if(json[i].POST_RPT_USER_ID==null || json[i].POST_RPT_USER_ID == "undefined"){
		    							  POST_RPT_USER_ID="";
		    						  }else{
		    							  POST_RPT_USER_ID=json[i].POST_RPT_USER_ID;
		    						  } 
		    						  //发帖类型名称
		    						  var POST_TYPE_NAME;
		    						  if(json[i].POST_TYPE_NAME==null || json[i].POST_TYPE_NAME == "undefined"){
		    							  POST_TYPE_NAME="";
		    						  }else{
		    							  POST_TYPE_NAME=json[i].POST_TYPE_NAME;
		    						  } 
		    						  //发帖类型ID
		    						  var POST_TYPE_ID;
		    						  if(json[i].POST_TYPE_ID==null || json[i].POST_TYPE_ID == "undefined"){
		    							  POST_TYPE_ID="";
		    						  }else{
		    							  POST_TYPE_ID=json[i].POST_TYPE_ID;
		    						  }
		    						  //帖子最后修改时间
		    						  var LAST_CHANGE_TIME;
		    						  if(json[i].LAST_CHANGE_TIME==null || json[i].LAST_CHANGE_TIME == "undefined"){
		    							  LAST_CHANGE_TIME="";
		    						  }else{
		    							  LAST_CHANGE_TIME=json[i].LAST_CHANGE_TIME;
		    						  }
		    						  //帖子内容
		    						  var POST_CONTENT;
		    						  if(json[i].POST_CONTENT==null || json[i].POST_CONTENT == "undefined"){
		    							  POST_CONTENT="";
		    						  }else{
		    							  POST_CONTENT=json[i].POST_CONTENT;
		    						  }
		    						  
		    						  htmls+='<li style="padding:0px">';
		    						  htmls+='<a href="javascript:void(0)"  onclick="rpost(\''+POST_ID+'\',\''+POST_SUBJECT_NAME+'\',\''+POST_RPT_USER_NAME+'\',\''+POST_RPT_TIME+'\',\''+POST_TYPE_NAME+'\',\''+POST_TYPE_ID+'\',\''+POST_CONTENT+'\')">';
		    						  htmls+='<div class="item-inner">';
		    						  htmls+='<div class="item-subtitle" style="padding: 0px 10px;color: #5183E2"><'+POST_TYPE_NAME+'>'+POST_SUBJECT_NAME+'</div>';
		    						  htmls+='<div class="item-title-row" style="padding: 7px 0px 0px;">';
		    						  htmls+='<div class="item-title" style="padding:0px 10px ;color: #5183E2">'+POST_RPT_TIME+'</div>';
		    						  htmls+='<div class="item-after">'+POST_RPT_USER_NAME+'</div>';
		    						  htmls+='<div class="item-after">点击回帖</div>';
		    						  htmls+='</div>';
		    						  htmls+='</div>';
		    						  htmls+='</a></li>' 
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
	    				url : serverURL+"&currentPage="+startNum+"&pageSize=8&posttypeid="+posttypeid, // 跨域URL
	    				type : 'get',
	    				data : startNum,
	    				timeout : 4000, 
	    				success : function(datas){
	    					var json  = $.parseJSON(datas);  
	    					if(json.length>0){
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
	    						//主题名称
	    						  var POST_SUBJECT_NAME;
	    						  if(json[i].POST_SUBJECT_NAME==null || json[i].POST_SUBJECT_NAME =="undefined"){
	    							  POST_SUBJECT_NAME="";
	    						  }else{
	    							  POST_SUBJECT_NAME=json[i].POST_SUBJECT_NAME;
	    						  }
	    						  //主题ID
	    						  var POST_ID;
	    						  if(json[i].POST_ID==null || json[i].POST_ID =="undefined"){
	    							  POST_ID="";
	    						  }else{
	    							  POST_ID=json[i].POST_ID;
	    						  }
	    						  //发帖人
	    						  var POST_RPT_USER_NAME;
	    						  if(json[i].POST_RPT_USER_NAME==null || json[i].POST_RPT_USER_NAME == "undefined"){
	    							  POST_RPT_USER_NAME="";
	    						  }else{
	    							  POST_RPT_USER_NAME=json[i].POST_RPT_USER_NAME;
	    						  }
	    						  //发帖时间
	    						  var POST_RPT_TIME;
	    						  if(json[i].POST_RPT_TIME==null || json[i].POST_RPT_TIME == "undefined"){
	    							  POST_RPT_TIME="";
	    						  }else{
	    							  POST_RPT_TIME=json[i].POST_RPT_TIME;
	    						  }
	    						  //发帖人name
	    						  var POST_RPT_USER_ID;
	    						  if(json[i].POST_RPT_USER_ID==null || json[i].POST_RPT_USER_ID == "undefined"){
	    							  POST_RPT_USER_ID="";
	    						  }else{
	    							  POST_RPT_USER_ID=json[i].POST_RPT_USER_ID;
	    						  } 
	    						  //发帖类型名称
	    						  var POST_TYPE_NAME;
	    						  if(json[i].POST_TYPE_NAME==null || json[i].POST_TYPE_NAME == "undefined"){
	    							  POST_TYPE_NAME="";
	    						  }else{
	    							  POST_TYPE_NAME=json[i].POST_TYPE_NAME;
	    						  } 
	    						  //发帖类型ID
	    						  var POST_TYPE_ID;
	    						  if(json[i].POST_TYPE_ID==null || json[i].POST_TYPE_ID == "undefined"){
	    							  POST_TYPE_ID="";
	    						  }else{
	    							  POST_TYPE_ID=json[i].POST_TYPE_ID;
	    						  }
	    						  //帖子最后修改时间
	    						  var LAST_CHANGE_TIME;
	    						  if(json[i].LAST_CHANGE_TIME==null || json[i].LAST_CHANGE_TIME == "undefined"){
	    							  LAST_CHANGE_TIME="";
	    						  }else{
	    							  LAST_CHANGE_TIME=json[i].LAST_CHANGE_TIME;
	    						  }
	    						//帖子内容
	    						  var POST_CONTENT;
	    						  if(json[i].POST_CONTENT==null || json[i].POST_CONTENT == "undefined"){
	    							  POST_CONTENT="";
	    						  }else{
	    							  POST_CONTENT=json[i].POST_CONTENT;
	    						  }
	    						  
	    						  htmls+='<li style="padding:0px">';
	    						  htmls+='<a href="javascript:void(0)"  onclick="rpost(\''+POST_ID+'\',\''+POST_SUBJECT_NAME+'\',\''+POST_RPT_USER_NAME+'\',\''+POST_RPT_TIME+'\',\''+POST_TYPE_NAME+'\',\''+POST_TYPE_ID+'\',\''+POST_CONTENT+'\')">';
	    						  htmls+='<div class="item-inner">';
	    						  htmls+='<div class="item-subtitle" style="padding: 0px 10px;color: #5183E2"><'+POST_TYPE_NAME+'>'+POST_SUBJECT_NAME+'</div>';
	    						  htmls+='<div class="item-title-row" style="padding: 7px 0px 0px;">';
	    						  htmls+='<div class="item-title" style="padding:0px 10px ;color: #5183E2">'+POST_RPT_TIME+'</div>';
	    						  htmls+='<div class="item-after">'+POST_RPT_USER_NAME+'</div>';
	    						  htmls+='<div class="item-after">点击回帖</div>';
	    						  htmls+='</div>';
	    						  htmls+='</div>';
	    						  htmls+='</a></li>' 
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