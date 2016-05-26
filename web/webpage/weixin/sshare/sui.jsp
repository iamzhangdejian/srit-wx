<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <title>新建待办事项</title>
<!--   <script src="plug-in/swork/plugin/sui/js/jquery.min.js"></script> -->
<!--   <link href="plug-in/swork/plugin/sui/css/sm-extend.css" rel="stylesheet"> -->
<!--   <link href="plug-in/swork/plugin/sui/css/sm-extend.min.css" rel="stylesheet"> -->
<!--   <link href="plug-in/swork/plugin/sui/css/sm.css" rel="stylesheet"> -->
	<link rel="stylesheet" href="plug-in/swork/plugin/sui/css/reset.css" />
    <link rel="stylesheet" href="plug-in/swork/plugin/sui/css/pullToRefresh.css" />
	<script src="plug-in/swork/plugin/sui/js/iscroll.js"></script>
	<script src="plug-in/swork/plugin/sui/js/pullToRefresh.js"></script>
	<script src="plug-in/swork/plugin/sui/js/colorful.js"></script>
	<script src="plug-in/swork/plugin/sui/js/forum.js"></script>
	<script src="plug-in/swork/plugin/sui/js/cityNews.js"></script>
	<script src="plug-in/swork/plugin/sui/js/replypost.js"></script>					
  	<link href="plug-in/swork/plugin/sui/css/sm.min.css" rel="stylesheet">
  	<script type="text/javascript" src="plug-in/swork/plugin/sui/js/jquery.min.js"></script>
  	<script type="text/javascript" src="plug-in/swork/plugin/sui/js/sui.js"></script>
<!--   <script type="text/javascript" src="plug-in/swork/plugin/sui/js/sm-city-picker.js"></script> -->
<!--   <script type="text/javascript" src="plug-in/swork/plugin/sui/js/sm-city-picker.min.js"></script> -->
<!--   <script type="text/javascript" src="plug-in/swork/plugin/sui/js/sm-extend.js"></script> -->
<!--   <script type="text/javascript" src="plug-in/swork/plugin/sui/js/sm-extend.min.js"></script> -->
<!--   <script type="text/javascript" src="plug-in/swork/plugin/sui/js/sm.js"></script> -->
<!--   <script type="text/javascript" src="plug-in/swork/plugin/sui/js/sm.min.js"></script> -->
</head>

<body>
<!--  <div class="page"> -->
  
  <nav class="bar bar-tab">
  <a class="tab-item external " href="javascript:void(0)"    onclick="map(0)">
    <span class="icon icon-browser"></span>
<!--     <span class="tab-label">地图</span> -->
  </a>
  <a class="tab-item external" href="javascript:void(0)"    onclick="map(1)">
    <span class="icon icon-home"></span>
<!--     <span class="tab-label">新闻</span> -->
<!--     <span class="badge">48</span> -->
  </a>
  <a class="tab-item external active" href="javascript:void(0)"    onclick="map(2)">
    <span class="icon icon-phone"></span>
<!--     <span class="tab-label">投诉举报</span> -->
  </a>
  <a class="tab-item external" href="javascript:void(0)"    onclick="map(3)">
    <span class="icon icon-message"></span>
<!--     <span class="tab-label">社区论坛</span> -->
  </a>
  <a class="tab-item external" href="javascript:void(0)"    onclick="map(4)">
    <span class="icon icon-me"></span>
<!--     <span class="tab-label">个人中心</span> -->
  </a>
</nav>
  <div class="content" id="divid">

  </div>
<!-- </div> -->

</body>
<script type="text/javascript">

$.ajax({
	async : false,
		url :"SworkPublicController.do?publichome" , // 跨域URL
		type : 'get',
		timeout : 4000, 
		success : function(datas){
			//$('#divid').load("https://www.baidu.com/");
			 document.getElementById("divid").innerHTML=datas;
			//$('#divid').load(datas);
			//$('#divid').load("http://192.168.1.61:8080/srit-wx/sworkLoginController.do?swTaskcheck");
		},
		complete : function(XMLHttpRequest, textStatus) {
		},
		error : function(xhr) {
			//jsonp 方式此方法不被触发
			//请求出错处理 
		}
	});
	
</script>

</html>
