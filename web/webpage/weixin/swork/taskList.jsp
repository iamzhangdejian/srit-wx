<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head> 
	<title>待办列表</title> 
	<meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0"/>
	 <meta charset="UTF-8"/>
	<link rel="stylesheet" href="plug-in/swork/tasklist/css/jquery.mobile.min.css" />
	<link rel="stylesheet" href="plug-in/swork/tasklist/css/theme/theme.min.css" />
	<link rel="stylesheet" href="plug-in/swork/tasklist/css/styles.css" />
	<link rel="stylesheet" href="plug-in/swork/default/css/weui.css"/>
    <link rel="stylesheet" href="plug-in/swork/default/css/example.css"/>
	<script src="plug-in/swork/tasklist/js/jquery.min.js"></script>
	<script src="plug-in/swork/tasklist/js/mobileinit.js"></script>
	<script src="plug-in/swork/tasklist/js/jquery.mobile.min.js"></script>
	<script src="plug-in/swork/tasklist/js/fastclick.js"></script>
	
	
	<script>
	function openNew(case_biz_sn,case_id,case_code,send_op_info,case_pos_desc,case_biz_type_name,case_biz_type_id){
				document.getElementById("case_code").value=case_code;
				document.getElementById("send_op_info").value=send_op_info;
				document.getElementById("case_pos_desc").value=case_pos_desc;
				document.getElementById("case_biz_type_id").value=case_biz_type_id;
				document.getElementById("case_biz_type_name").value=case_biz_type_name;
				document.getElementById("case_biz_sn").value=case_biz_sn;
				document.getElementById("case_id").value=case_id;
			    document.form.submit();
		 }
	</script>
	<style type="text/css">
	.ui-content{
	padding:40 !important;
}
.ui-content .ui-listview, .ui-panel-inner>.ui-listview{
	margin:-6px !important;
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
body{
   line-height:1.2  !important;
}
.ui-btn-up-a{
border-bottom:1px solid #cccccc!important;
border-left:0px solid #cccccc!important;
border-right:0px solid #cccccc!important;
border-top:1px solid #cccccc!important; 
}
	</style>
</head> 
<body ontouchstart >
<header class="header">
<!-- 	<a href="http://sc.admin5.com/" class="logo"><img src="images/logo.png" alt="嘉华旅游"></a> -->
<!-- 	<a href="http://sc.admin5.com/" class="search"><span>目的地搜索</span></a> -->
<!-- 	<a href="http://sc.admin5.com/" class="user-icon"><span>用户中心</span></a> -->
	<div id="dl-menu" class="dl-menuwrapper">
		<button id="dl-menu-button">Open Menu</button>
		<ul class="dl-menu">
			<li><a href="http://sc.admin5.com/">首页</a></li>
			<li><a href="http://sc.admin5.com/">台湾游</a></li>
			<li><a href="http://sc.admin5.com/">出境游</a></li>
			<li><a href="http://sc.admin5.com/">国内游</a></li>
			<li><a href="http://sc.admin5.com/">周边游</a></li>
			<li>
				<a href="Line">自由行</a>
				<ul class="dl-submenu">
					<li class="dl-back"><a href="#">返回上一级</a></li>
					<li><a href="http://sc.admin5.com/">线路</a></li>
					<li><a href="http://sc.admin5.com/">签证</a></li>
					<li><a href="http://sc.admin5.com/">门票</a></li>
				</ul>
			</li>
		</ul>
	</div>
</header>

<script type="text/javascript">
$(function(){
	$( '#dl-menu' ).dlmenu();
});
</script>
	<!-- page -->
	<div data-role="page" id="fpmxListPage" data-iscroll="enable">
		<link rel="stylesheet" href="plug-in/swork/tasklist/css/pull.css" />
		<script type="text/javascript" charset="utf-8" src="plug-in/swork/tasklist/js/iscroll.js"></script>
		<script type="text/javascript" charset="utf-8" src="plug-in/swork/tasklist/js/initScroll.js"></script>
		<script type="text/javascript">
		$(document).bind("pageinit", function() {
			isInit=0;
			serverURL = "sworkQuesrController.do?taskList"; //服务器地址
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
							  
							  
							  htmls+='<li><a href="javascript:"  onclick="openNew(\''+CASE_BIZ_SN+'\',\''+CASE_ID+'\',\''+CASE_CODE+'\',\''+SEND_OP_INFO+'\',\''+CASE_POS_DESC+'\',\''+CASE_BIZ_TYPE_NAME+'\',\''+CASE_BIZ_TYPE_ID+'\')"<img src="">'
							  htmls+='<p>案卷编号：<span class="text-no"  style="font-size:15px;font-weight:normal">'+CASE_CODE+'</span></p>';
							  htmls+='<p>案件类别：<span class="text-no" style="font-size:15px;font-weight:normal">'+CASE_TYPE_NAME+'</span></p>';
							  htmls+='<p>位置描述：<span class="text-no" style="font-size:15px;font-weight:normal">'+CASE_POS_DESC+'</span></p>';
							  htmls+='<p>派发时间：<span class="text-no" style="font-size:15px;font-weight:normal">'+SEND_TIME+'</span></p>';
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
			<div style="margin: 13px 0px; padding:8px;">
			</div>
			<ul data-role="listview" data-theme="a" class="list-fpmx" id="fpmxList">
			</ul>
			<div id="pullUp">
				<span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span>
			</div>
		</div>
	</div>
	<div style="display: none">
	 <form action="sworkLoginController.do?swTaskcheck" method="post" name="form" id="form">
	  <input id="case_code" name="case_code" class="weui_input" readOnly="true"/>
	  <input id="send_op_info" name="send_op_info" class="weui_input" readOnly="true"/>
	  <input id="case_pos_desc" name="case_pos_desc" class="weui_input" readOnly="true"/>
	  <input id="case_biz_type_id" name="case_biz_type_id" class="weui_input" readOnly="true"/>
	  <input id="case_biz_type_name" name="case_biz_type_name" class="weui_input" readOnly="true"/>
	  <input id="case_id" name="case_id" class="weui_input" readOnly="true"/>
	  <input id="case_biz_sn" name="case_biz_sn" class="weui_input" readOnly="true"/>
	 </form>
	</div>
</div>
</div>
<div id="success" style="display: none;">
    <div class="weui_mask_transparent"></div>
    <div class="weui_toast">
    <i class="weui_icon_toast"></i>
        
        <p class="weui_toast_content">反馈成功！</p>
    </div>
</div>
<div id="fail" style="display: none;">
    <div class="weui_mask_transparent"></div>
    <div class="weui_toast">
       <img  style=" padding: 12px;" src="plug-in/swork/tasklist/images/fault.png"></img>
        <p class="weui_toast_content">反馈失败！</p>
    </div>
</div>
<script type="text/javascript">
$(function () {
	if ("${failsuccess}"== "1") {
    var $success = $('#success');
    if ($success.css('display') != 'none') {
         return;
    }
    $success.show();
    setTimeout(function () {
//     	$success.hide();
    }, 2000);
	}
if ("${failsuccess}"== "2") {
    var $fail = $('#fail');
    if ($fail.css('display') != 'none') {
         return;
    }
    $fail.show();
    setTimeout(function () {
    	$fail.hide();
    }, 2000); 
}
})
</script>
</body>
</html>
