<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<title>新闻动态</title>

<link href="plug-in/swork/plugin/sui/css/sm.min.css" rel="stylesheet">
<script type="text/javascript"
	src="plug-in/swork/tasklist/js/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="plug-in/swork/plugin/sui/css/reset.css" /> -->
<link rel="stylesheet"
	href="plug-in/swork/plugin/sui/css/pullToRefresh.css" />
<script src="plug-in/swork/plugin/sui/js/iscroll.js"></script>
<script src="plug-in/swork/plugin/sui/js/pullToRefresh.js"></script>
<script src="plug-in/swork/plugin/sui/js/colorful.js"></script>

<style type="text/css" media="all">
body,html {
	padding: 0;
	margin: 0;
	height: 100%;
	font-family: Arial, Microsoft YaHei;
	color: #111;
}

li {
	/*border-bottom: 1px #CCC solid;*/
	/*             text-align: center; */
	line-height: 18px;
}

p {
	text-align: center;
}
</style>
</head>
<body>

<!-- 锁定的目录栏 -->
	<header class="bar bar-nav">
		<!--   <button class="button pull-right" onclick="post()"> -->
		<!--  	<span class="icon icon-edit"></span> -->
		<!--   </button> -->
		  <h1 class="title">新闻动态</h1>
	</header>
	<div class="content">
<!-- 		<div class="buttons-tab" style="position: static;"> -->
<!-- 			<a href="javascript:void(0)" onclick="forumMap(0)" -->
<!-- 				class="tab-link active button">全部</a> -->

<!-- 		</div> -->
		<div class="content-block">
			<div class="tabs">
				<div id="tab1" class="tab active">
					<!--         <div class="content-block"> -->
					<div id="wrapper" class="list-block media-list"
						style="margin: -1.87rem 0; border-width: 0px;">
						<ul id="lbuln">

						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="display: none">
	 <form action="sshareNewsController.do?newsContent" method="post" name="form" id="form">
	  <input id="news_id" name="news_id" class="weui_input" readOnly="true"/>
	 </form>
	</div>
	
</body>

</html>
