<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>用户认证</title>
    <link rel="stylesheet" href="plug-in/swork/default/css/weui.css"/>
    <link rel="stylesheet" href="plug-in/swork/default/css/example.css"/>
</head>
<body ontouchstart>
<form action="sworkLoginController.do?swPhone" method="post">
    <input type="hidden" name="openId" value="${openId}"/>
    <div class="page slideIn phone">
        <div class="hd">
            <h1 class="page_title"><i class="weui_icon_safe weui_icon_safe_success"></i></h1>
            <p class="page_desc">用户认证</p>
        </div>
        <div class="weui_cells">
            <div class="weui_cell weui_cell_select weui_select_before">
                <div class="weui_cell_hd">
                    <select class="weui_select" name="select2">
                        <option value="1">+86</option>
                        <option value="2">+80</option>
                        <option value="3">+84</option>
                        <option value="4">+87</option>
                    </select>
                </div>
                <div class="weui_cell_bd weui_cell_primary">
                    <input class="weui_input" type="number" pattern="[0-9]*" name="phoneNum" placeholder="请输入号码"/>
                </div>
            </div>
        </div>
        <div class="weui_btn_area">
            <input class="weui_btn weui_btn_primary" href="javascript:" type="submit" id="showToolPhone"></input>
        </div>
        <div class="hd">
        <a href="sworkLoginController.do?swLoginUser"><p class="page_desc">社管通用户</p></a>
        </div>
    </div>
</form>
<script src="plug-in/swork/default/js/zepto.min.js"></script>
<script src="plug-in/swork/default/js/example.js"></script>
</body>
</html>