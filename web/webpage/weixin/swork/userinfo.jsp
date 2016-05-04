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
<!--     <link rel="stylesheet" href="plug-in/swork/tasklist/css/custom.css"/> -->
    <!--     <script type="text/javascript" src="../../static/jquery/1.8.0/jquery.min.js"></script> -->
    <!-- 微信原生jssdk接口js -->
    <script src="plug-in/swork/default/js/jweixin-1.0.0.js"></script>
    
</head>

<body ontouchstart>
<div class="container js_container">

</div>
<script type="text/html" id="tpl_home">
    <div class="page" >
<!--         <div class="hd"> -->
<!--             <h1 class="page_title">头像</h1> -->
<%--             <p class="page_desc">${phone_num}</p> --%>
<!--         </div> -->	
			<div class="hd">
		        <div id="divcss5"><img id="imgd" src="http://uc.zhibo8.cc/data/avatar/000/74/79/39_avatar_small.jpg"  style="border-radius: 50%;margin:0 auto;display:table-cell;vertical-align: middle;"/></a></div> 
<%-- 		        <p class="page_desc">${phoneNum}</p> --%>
		    </div>
        <div class="bd">
            <!--         <div class="weui_cells_title">表单</div> -->
            <div class="weui_cells weui_cells_access">
                <a class="weui_cell" href="javascript:;">
                    <div class="weui_cell_bd weui_cell_primary">
<!--                         <p>姓名</p> -->
                        <label class="weui_label">姓名</label>
						
                    </div>
                    <div class="weui_cell_ft">${user_name}</div>
                </a>
                <a class="weui_cell" href="javascript:;">
                    <div class="weui_cell_bd weui_cell_primary">
<!--                         <p>电话</p> -->
                        <label class="weui_label">电话</lable>
                    </div>
                    <div class="weui_cell_ft">${phone_num}</div>
                </a>
                <a class="weui_cell" href="javascript:;">
                    <div class="weui_cell_bd weui_cell_primary">
<!--                         <p>角色</p> -->
                        <label class="weui_label">角色</label>
                    </div>
                    <div class="weui_cell_ft">${role_name}</div>
                </a>
                <a class="weui_cell" href="javascript:;">
                    <div class="weui_cell_bd weui_cell_primary">
<!--                         <p>部门</p> -->
                        <label class="weui_label">部门</label>
                    </div>
                    <div class="weui_cell_ft">${depart_name}</div>
                </a>

            </div>

            <div class="weui_btn_area">
                <a class="weui_btn weui_btn_primary" href="javascript:" id="showTooltips">修改</a>
            </div>

        </div>

    </div>

   </script>

<script src="template/swork/default/js/zepto.min.js"></script>
<script src="template/swork/default/js/example.js"></script>
<script type="text/javascript">
//     通过config接口注入权限验证配置
wx.config({
	debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	appId: '${map["appid"]}', // 必填，公众号的唯一标识
	timestamp: '${map["timestamp"]}', // 必填，生成签名的时间戳
	nonceStr: '${map["noncestr"]}', // 必填，生成签名的随机串
	signature: '${map["signature"]}',// 必填，签名，见附录1
	jsApiList: ['chooseImage', 'uploadImage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});

wx.ready(function(){
	
	 var images = {
     	    localId: [],	
     	    serverId: []
     	  };
	 
	 document.querySelector('#imgd').onclick = function () {
// 		 alert(1)
		    wx.chooseImage({
		      success: function (res) {
		        images.localId = res.localIds;
// 		        选中图片替换进头像
		        $("#imgd").attr("src",images.localId);
		        alert('已选择 ' + res.localIds.length + ' 张图片');
		      }
		    });
		  };
	
})


</script>
</body>
</html>