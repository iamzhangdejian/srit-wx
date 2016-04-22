<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
<title>系统登录</title>
	<link rel="stylesheet" href="plug-in/swork/default/css/weui.css"/>
    <link rel="stylesheet" href="plug-in/swork/default/css/example.css"/>
<!--     <script type="text/javascript" src="../../static/jquery/1.8.0/jquery.min.js"></script> -->
</head>
<body ontouchstart>
   <div class="page slideIn login">
    <div class="hd">
        <h1 class="page_title">系统登录</h1>
    </div>
    <div class="bd">
         <form action="sworkLoginController.do?swUser" method="post">
         
<!--         <div class="weui_cells_title">表单</div> -->
        <div class="weui_cells weui_cells_form">
            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">用户名</label></div>
                <div class="weui_cell_bd weui_cell_primary">
<!--                     <input class="weui_input" type="number" pattern="[0-9]*" placeholder="请输入用户名"> -->
                    <input class="weui_input" type="text" name="userName" placeholder="请输入用户名">
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_hd"><label class="weui_label">密码</label></div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" name="password" type="password" placeholder="请输入登录密码">
                </div>
            </div>
        </div>
        <div class="weui_btn_area">
            <input class="weui_btn weui_btn_primary" href="javascript:" type="submit" id="showTooltips"></input>
        </div>
         </form>
         
         <div class="hd">
        <a href="sworkLoginController.do?swLogin"><p class="page_desc">公众通用户</p></a>
        </div>
    </div>
</div>
</body>
</html>