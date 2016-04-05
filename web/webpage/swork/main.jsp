<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
<title>微信公众平台</title>
	<link rel="stylesheet" href="plug-in/sworkWexin/css/weui.css"/>
    <link rel="stylesheet" href="plug-in/sworkWexin/css/example.css"/>
<!--     <script type="text/javascript" src="../../static/jquery/1.8.0/jquery.min.js"></script> -->
</head>
<body ontouchstart>
	<div class="container js_container"></div>
	
	<script type="text/html" id="tpl_home">
<div class="page">
    <div class="hd">
        <h1 class="page_title">微信公众平台</h1>
        <p class="page_desc">${phoneNum}</p>
    </div>
    <div class="bd">
        <div class="weui_grids">
            <a href="sworkController.do?goPage&page=quesr" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/icon_nav_button.png" alt="">
                </div>
                <p class="weui_grid_label">
                    问题报送
                </p>
            </a>
            <a href="sworkController.do?goPage&page=quespg" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/icon_nav_cell.png" alt="">
                </div>
                <p class="weui_grid_label">
                    问题跟踪
                </p>
            </a>
            <a href="javascript:;" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/icon_nav_toast.png" alt="">
                </div>
                <p class="weui_grid_label">
                    打折优惠
                </p>
            </a>
            <a href="http://www.96156.com.cn/convenience/" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/icon_nav_dialog.png" alt="">
                </div>
                <p class="weui_grid_label">
                    服务指南
                </p>
            </a>
            <a href="http://map.baidu.com" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/icon_nav_button.png" alt="">
                </div>
                <p class="weui_grid_label">
                    周边查询
                </p>
            </a>
            <a href="sworkController.do?goPage&page=changerule" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/icon_nav_msg.png" alt="">
                </div>
                <p class="weui_grid_label">
                    积分兑换
                </p>
            </a>
            <a href="sworkController.do?goPage&page=mpoint" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/icon_nav_article.png" alt="">
                </div>
                <p class="weui_grid_label">
                    积分查询
                </p>
            </a>
            <a href="sworkController.do?goPage&page=person" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/icon_nav_actionSheet.png" alt="">
                </div>
                <p class="weui_grid_label">
                    个人信息
                </p>
            </a>
            <a href="javascript:;" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/icon_nav_icons.png" alt="">
                </div>
                <p class="weui_grid_label">
                    二维码扫描
                </p>
            </a>
        </div>
    </div>
</div>
</script>
	
	<script src="plug-in/sworkWexin/js/zepto.min.js"></script>
    <script src="plug-in/sworkWexin/js/example.js"></script>
</body>
</html>