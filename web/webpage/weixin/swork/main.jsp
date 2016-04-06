<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
<title>微信公众平台</title>
<style type="text/css">

#divcss5{ margin:10px auto;} ;

#imgd {
    border-radius: 45px;
    border: 1px solid #FFF;
    box-shadow: 1px 2px 2px rgba(0, 0, 0, 0.3);
    width: 60px;
    height: 60px;
}
</style>
	<link rel="stylesheet" href="plug-in/swork/default/css/weui.css"/>
    <link rel="stylesheet" href="plug-in/swork/default/css/example.css"/>
    <link rel="stylesheet" href="plug-in/swork/default/css/custom.css"/>
<!--     <script type="text/javascript" src="../../static/jquery/1.8.0/jquery.min.js"></script> -->
</head>
<body ontouchstart>
	<div class="container js_container"></div>
	<script type="text/html" id="tpl_home">
<div class="page">
    <div class="hd">
        <div id="divcss5"><img id="imgd" src="http://uc.zhibo8.cc/data/avatar/000/74/79/39_avatar_small.jpg"  style="border-radius: 50%;margin:0 auto;display:table-cell;vertical-align: middle;"/></div> 
        <p class="page_desc">${phoneNum}</p>
    </div>
    <div class="bd">
        <div class="weui_grids">
            <a href="sworkLoginController.do?swQuest" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/report.png" alt="">
                </div>
                <p class="weui_grid_label">
                    问题报送
                </p>
            </a>
            <a href="sworkLoginController.do?swTrack" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/task.png" alt="">
                </div>
                <p class="weui_grid_label">
                    待办任务
                </p>
            </a>
            <a href="sworkLoginController.do?swHistory" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/history.png" alt="">
                </div>
                <p class="weui_grid_label">
                    历史纪录
                </p>
            </a>
            <a href="http://www.96156.com.cn/convenience/" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/remind.png" alt="">
                </div>
                <p class="weui_grid_label">
                    城市动态
                </p>
            </a>
            <a href="http://map.baidu.com" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/city.png" alt="">
                </div>
                <p class="weui_grid_label">
                    城市周边
                </p>
            </a>
            <a href="sworkController.do?goPage&page=changerule" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/message.png" alt="">
                </div>
                <p class="weui_grid_label">
                    信息公开
                </p>
            </a>
            <a href="sworkController.do?goPage&page=mpoint" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/heart.png" alt="">
                </div>
                <p class="weui_grid_label">
                    便民服务
                </p>
            </a>
            <a href="sworkController.do?goPage&page=person" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/code.png" alt="">
                </div>
                <p class="weui_grid_label">
                   二维码
                </p>
            </a>
            <a href="javascript:;" class="weui_grid js_grid">
                <div class="weui_grid_icon">
                    <img src="template/swork/default/images/user.png" alt="">
                </div>
                <p class="weui_grid_label">
                    我的信息
                </p>
            </a>
        </div>
    </div>
</div>
</script>

	<script src="plug-in/swork/default/js/zepto.min.js"></script>
    <script src="plug-in/swork/default/js/example.js"></script>
</body>
</html>