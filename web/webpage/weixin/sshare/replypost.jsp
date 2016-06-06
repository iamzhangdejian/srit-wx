<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<title>评论回复</title>
<!-- Google Web Fonts -->
<link rel="stylesheet" href="plug-in/swork/plugin/sui/css/sm.css">
<link rel="stylesheet" href="plug-in/swork/plugin/sui/css/sm-extend.css">
<link rel="stylesheet" href="plug-in/swork/plugin/sui/css/demos.css">
<script src="plug-in/swork/plugin/sui/js/hm.js"></script>
<script src="plug-in/swork/plugin/sui/js/zepto.js"></script>
<script src="plug-in/swork/plugin/sui/js/config.js"></script>


<link href="plug-in/swork/plugin/sui/css/sm.min.css" rel="stylesheet">
<script type="text/javascript"
	src="plug-in/swork/tasklist/js/jquery.min.js"></script>
<link rel="stylesheet" href="plug-in/swork/plugin/sui/css/reset.css" />
<link rel="stylesheet"
	href="plug-in/swork/plugin/sui/css/pullToRefresh.css" />
<script src="plug-in/swork/plugin/sui/js/iscroll.js"></script>
<script src="plug-in/swork/plugin/sui/js/pullToRefresh.js"></script>
<script src="plug-in/swork/plugin/sui/js/colorful.js"></script>

</head>
<body class="">
	<div class="page-group">
		<div id="bar-multi" class="page page-current">
			<header class="bar bar-nav">
				<button class="button pull-left" onclick="forum()"
					Style="color: white;">
					<!--     <span class="icon icon-left"></span> -->
					返回
				</button>
				<h1 class="title">评论回复</h1>
			</header>
			<!-- Block button in standard bar fixed below top bar -->
			<div class="bar bar-header-secondary" style="height: 10rem;">
				<ul id="postxx">

				</ul>
			</div>

			<!-- Block button in standard bar fixed above the footer -->
			<div class="bar bar-footer-secondary" style="bottom: 0.2rem">
				<div class="searchbar row">
					<div class="search-input col-90"style="margin-left: -0.2rem;">
						<textarea type="search" id="post_reply_content"
							placeholder="输入回复文字..."></textarea>
					</div>
					<a class="button button-fill button-primary col-15"
						onclick="replysubmit()" style="top: 0.09rem">评论</a>
				</div>
			</div>

			<!-- Icons in standard bar fixed to the bottom of the screen -->
			<!--   <div class="bar bar-footer"> -->
			<!--     <a class="icon icon-edit pull-left"></a> -->
			<!--     <a class="icon icon-settings pull-right"></a> -->
			<!--   </div> -->

			<div class="content native-scroll" style="top: 12rem; bottom: 2.4rem">
				<div class="content-padded">

					<div id="wrapper" class="list-block media-list"
						style="margin: -0.87rem -0.59rem; border-width: 0px;">
						<ul id="replyul">

						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script src="plug-in/swork/plugin/sui/js/sm.js"></script>
	<script src="plug-in/swork/plugin/sui/js/sm-extend.js"></script>
	<script src="plug-in/swork/plugin/sui/js/sm-city-picker.js"></script>
	<script src="plug-in/swork/plugin/sui/js/demos.js"></script>
	<div class="modal-overlay"></div>
	<div class="popup-overlay"></div>


</body>
</html>