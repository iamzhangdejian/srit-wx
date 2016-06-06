<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
	 <meta name="description" content="">
	<title>个人中心</title>
	<link href="plug-in/swork/plugin/sui/css/sm.min.css" rel="stylesheet">
	<link rel="stylesheet" href="plug-in/swork/default/css/custom.css"/>
	<link rel="stylesheet" href="plug-in/swork/default/css/weui.css"/>
    <link rel="stylesheet" href="plug-in/swork/default/css/example.css"/>
  	<script type="text/javascript" src="plug-in/swork/tasklist/js/jquery.min.js"></script>
	<style type="text/css">
    html, body { color:#222; font-family:Microsoft YaHei, Helvitica, Verdana, Tohoma, Arial, san-serif; margin:0; padding: 0; text-decoration: none; }
    img { border:0; }
    ul { list-style: none outside none; margin:0; padding: 0; }
    body {
        background-color:#eee; 
    }
    body .mainmenu:after { clear: both; content: " "; display: block; }

    body .mainmenu li{ 
        float:left;
        margin-left: 2.5%;
        margin-top: 2.5%;
        width: 30%;  
        border-radius:3px; 
        overflow:hidden;
    }

    body .mainmenu li a{ display:block;  color:#FFF;   text-align:center }
    body .mainmenu li a b{ 
        display:block; height:80px;
    }
    body .mainmenu li a img{ 
        margin: 15px auto 15px;
        width: 50px;
        height: 50px;
    }

    body .mainmenu li a span{ display:block; height:30px; line-height:30px;background-color:#FFF; color: #999; font-size:14px; }

    body .mainmenu li:nth-child(8n+5) {background-color:#36A1DB}
    body .mainmenu li:nth-child(8n+7) {background-color:#678ce1}
    body .mainmenu li:nth-child(8n+6) {background-color:#8c67df}
    body .mainmenu li:nth-child(8n+8) {background-color:#84d018}
    body .mainmenu li:nth-child(8n+4) {background-color:#14c760}
    body .mainmenu li:nth-child(8n+3) {background-color:#f3b613}
    body .mainmenu li:nth-child(8n+2) {background-color:#ff8a4a}
    body .mainmenu li:nth-child(8n+1) {background-color:#fc5366}
    #divcss5{ margin:-5px auto;} ;
</style>
</head>

<body>
<header class="bar bar-nav">
  
  <h1 class="title">个人中心</h1>
</header>

<div class="hd">
        <div id="divcss5"><img id="imgd" src="http://uc.zhibo8.cc/data/avatar/000/74/79/39_avatar_small.jpg" style="border-radius: 50%;margin:0 auto;display:table-cell;vertical-align: middle;"></div> 
<%--         <p class="page_desc">${phoneNum}</p> --%>
    </div>
    <div class="">
  	<div class="list-block"style=" margin: 0.1rem;">
            <!--         <div class="weui_cells_title">表单</div> -->
            <div class="weui_cells weui_cells_access">
                <a class="weui_cell" href="javascript:;" style="height: 53px;">
                    <div class="weui_cell_bd weui_cell_primary">
<!--                         <p>姓名</p> -->
                        <label class="weui_label" style="display: inline-block">姓名</label>
                        <label class="" style="float: right;color: #1b1b19;">${user_name}</label>
						
                    </div>
<!--                     <div class="weui_cell_ft"><label class="weui_label">南郊农场主管领导</label></div> -->
                </a>
                <a class="weui_cell" href="javascript:;" style="height: 45px;">
                    <div class="weui_cell_bd weui_cell_primary">
                    
                        <label class="weui_label" style="display: inline-block">电话</label>
                        <label class="" style="float: right;color: #1b1b19;">${phone_num}</label>
                        </div>
                </a>
                <a class="weui_cell" href="javascript:;" style="height: 45px;">
                    <div class="weui_cell_bd weui_cell_primary">
<!--                         <p>角色</p> -->
                       <label class="weui_label" style="display: inline-block">角色</label>
                        <label class="" style="float: right;color: #1b1b19;">${role_name}</label>
                    </div>
                </a>
                <a class="weui_cell" href="javascript:;" style="height: 45px;">
                    <div class="weui_cell_bd weui_cell_primary">
<!--                         <p>部门</p> -->
                        <label class="weui_label" style="display: inline-block">部门</label>
                        <label class="" style="float: right;color: #1b1b19;">${depart_name}</label>
                    </div>
                </a>

            </div

        </div>
	</div>
	<div class="content-block" style="padding-top: 9px;">
		<div class="row">
	<!--       <div class="col-50"><a href="#" class="button button-big button-fill button-danger">取消</a></div> -->
		  <div class="col-100">					
	<!--       <input class="weui_btn weui_btn_primary" href="javascript:" type="submit" id="showTooltipss" -->
	<!--                            value="提交21"/> -->
		  <a href="javascript:void(0)" onclick="chomesubmit()" class="button button-big button-fill">修改</a></div>
		</div>
  </div>

</div>
</body>
</html>
