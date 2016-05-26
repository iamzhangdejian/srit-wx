<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0"/>
<title>历史列表</title>
	<link rel="stylesheet" href="plug-in/swork/tasklist/css/jquery.mobile.min.css" />
	<link rel="stylesheet" href="plug-in/swork/tasklist/css/theme/theme.min.css" />
	<link rel="stylesheet" href="plug-in/swork/tasklist/css/styles.css" />
	<link rel="stylesheet" href="plug-in/swork/tasklist/css/customtask.css" />
	<script src="plug-in/swork/tasklist/js/jquery.min.js"></script>
	<script src="plug-in/swork/tasklist/js/mobileinit.js"></script>
	<script src="plug-in/swork/tasklist/js/jquery.mobile.min.js"></script>
	<script src="plug-in/swork/tasklist/js/fastclick.js"></script>
	<script type="text/javascript">
		function showHis(case_id){
			console.log(case_id);
			document.getElementById("case_id").value=case_id;
			document.form.submit();
}
</script>
	<style type="text/css">
	.ui-content{
	padding:30 !important;
}
.ui-content .ui-listview, .ui-panel-inner>.ui-listview{
	margin:0px !important;
}
.ui-li, .ui-li.ui-field-contain{
	margin:0px !important;
}
.ui-li-has-arrow .ui-btn-inner a.ui-link-inherit, .ui-li-static.ui-li-has-arrow{
	padding:0 !important;
}
.ui-li .ui-btn-inner a.ui-link-inherit, .ui-li-static.ui-li{
	padding:0 68px !important;
}
.list-fpmx a.ui-link-inherit{
	padding:0 !important;
}
.ui-li.ui-btn, .ui-li.ui-field-contain, .ui-li-divider, .ui-li-static{
	margin:-1px !important;
	padding:0px 0 !important;
}
.ui-li-desc{
 	margin:3px 0 3px 0 !important;
}
	</style>
</head>
<body ontouchstart>
	<!-- page -->
	<div data-role="page" id="historyRecord" data-iscroll="enable">
		<link rel="stylesheet" href="plug-in/swork/tasklist/css/pull.css" />
		<script type="text/javascript" charset="utf-8" src="plug-in/swork/tasklist/js/iscroll.js"></script>
		<script type="text/javascript" charset="utf-8" src="plug-in/swork/history/initScroll.js"></script>
		<script type="text/javascript">
		$(document).bind("pageinit", function() {
			isInit=0;
			serverURL = "sworkTaskController.do?historyRecord"; //服务器地址
			startNum = 1;//当前页
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
							  var OCCUR_TIME;
							  if(json[i].OCCUR_TIME==null || json[i].OCCUR_TIME =="undefined"){
								  OCCUR_TIME="";
							  }else{
								  OCCUR_TIME=json[i].OCCUR_TIME;
							  }
							  var CASE_TYPE_NAME;
							  if(json[i].CASE_TYPE_NAME==null || json[i].CASE_TYPE_NAME == "undefined"){
								  CASE_TYPE_NAME="";
							  }else{
								  CASE_TYPE_NAME=json[i].CASE_TYPE_NAME;
							  }
							  var CASE_POS_DESC;
							  if(json[i].CASE_POS_DESC==null || json[i].CASE_POS_DESC == "undefined"){
								  CASE_POS_DESC="";
							  }else{
								  CASE_POS_DESC=json[i].CASE_POS_DESC;
							  }
							  var CASE_DESC;
							  if(json[i].CASE_DESC==null || json[i].CASE_DESC == "undefined"){
								  CASE_DESC="";
							  }else{
								  CASE_DESC=json[i].CASE_DESC;
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
							  
							  
// 							  htmls+='<li><a href="javascript:"  onclick="openNew(\''+CASE_BIZ_SN+'\',\''+CASE_ID+'\',\''+CASE_CODE+'\',\''+SEND_OP_INFO+'\',\''+CASE_POS_DESC+'\',\''+CASE_BIZ_TYPE_NAME+'\',\''+CASE_BIZ_TYPE_ID+'\')"<img src="">'
							  htmls+='<li><a href="javascript:" onclick="showHis(\''+CASE_ID+'\')"<img src="">'
							  htmls+='<p>案卷编号：<span class="text-no" style="font-size:15px;font-weight:normal">'+CASE_CODE+'</span></p>';
							  htmls+='<p>案件类别：<span class="text-no" style="font-size:15px;font-weight:normal">'+CASE_TYPE_NAME+'</span></p>';
							  htmls+='<p>问题描述：<span class="text-no" style="font-size:15px;font-weight:normal">'+CASE_DESC+'</span></p>';
							  htmls+='<p>上报时间：<span class="text-no" style="font-size:15px;font-weight:normal">'+OCCUR_TIME+'</span></p>';
							  htmls+='</a></li>' 
						  };
								if(htmls!=null && htmls!=""){
									$("#fpmxList").append(htmls);
									$("#fpmxList").listview("refresh");
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
			
			
		});
		
</script>	
<!-- content-->
<div data-role="content" >
	<div id="wrapperIndex" class="wrapper" >
		<div id="scrollerIndex" class="scroller">
			<div id="pullDown" >
				<span class="pullDownIcon"></span><span class="pullDownLabel">下拉刷新...</span>
			</div>
			<div style="margin: 10px 0px; padding:5px;">
			</div>
			<ul data-role="listview" data-theme="a" class="list-fpmx" id="fpmxList">
			</ul>
			<div id="pullUp">
				<span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span>
			</div>
		</div>
	</div>
	<div style="display: none">
	 <form action="sworkTaskController.do?hisDetail" method="post" name="form" id="form">
<!-- 	  <input id="case_code" name="case_code" class="weui_input" readOnly="true"/> -->
<!-- 	  <input id="send_op_info" name="send_op_info" class="weui_input" readOnly="true"/> -->
<!-- 	  <input id="case_pos_desc" name="case_pos_desc" class="weui_input" readOnly="true"/> -->
<!-- 	  <input id="case_biz_type_id" name="case_biz_type_id" class="weui_input" readOnly="true"/> -->
<!-- 	  <input id="case_biz_type_name" name="case_biz_type_name" class="weui_input" readOnly="true"/> -->
	  <input id="case_id" name="case_id" class="weui_input" readOnly="true"/>
<!-- 	  <input id="case_biz_sn" name="case_biz_sn" class="weui_input" readOnly="true"/> -->
	 </form>
	</div>
</div>
</div>

</body>
</html>