<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>用户信息</title>
    <link rel="stylesheet" href="plug-in/swork/default/css/weui.css"/>
    <link rel="stylesheet" href="plug-in/swork/default/css/example.css"/>
    <!--     <script type="text/javascript" src="../../static/jquery/1.8.0/jquery.min.js"></script> -->
</head>

<body ontouchstart>
<div class="container js_container">

</div>
<script type="text/html" id="tpl_home">
    <div class="page">
        <div class="hd">
            <h1 class="page_title">头像</h1>
            <p class="page_desc">${phone_num}</p>
        </div>
        <div class="bd">
            <!--         <div class="weui_cells_title">表单</div> -->
            <div class="weui_cells weui_cells_access">
                <a class="weui_cell" href="javascript:;">
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>姓名</p>
                    </div>
                    <div class="weui_cell_ft">${user_name}</div>
                </a>
                <a class="weui_cell" href="javascript:;">
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>电话</p>
                    </div>
                    <div class="weui_cell_ft">${phone_num}</div>
                </a>
                <a class="weui_cell" href="javascript:;">
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>角色</p>
                    </div>
                    <div class="weui_cell_ft">${role_name}</div>
                </a>
                <a class="weui_cell" href="javascript:;">
                    <div class="weui_cell_bd weui_cell_primary">
                        <p>部门</p>
                    </div>
                    <div class="weui_cell_ft">${depart_name}</div>
                </a>

            </div>

            <div class="weui_btn_area">
                <a class="weui_btn weui_btn_primary" href="javascript:" id="showTooltips">修改</a>
            </div>

        </div>

    </div>

    <!-- </script>
-->
<script src="template/swork/default/js/zepto.min.js"></script>
<script src="template/swork/default/js/example.js"></script>
</body>
</html>