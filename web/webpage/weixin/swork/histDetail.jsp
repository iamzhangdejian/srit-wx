<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>详细信息</title>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
<!--    <link rel="stylesheet" href="plug-in/swork/default/css/weui.css"/> -->
<!--     <link rel="stylesheet" href="plug-in/swork/default/css/example.css"/> -->
<!-- 	<link rel="stylesheet" href="plug-in/swork/plugin/webuploader/css/webuploader.css"/> -->
<!--     <link rel="stylesheet" href="plug-in/swork/default/css/questr.css"/>     -->
 <link rel="stylesheet" type="text/css" href="plug-in/bootstrap/css/multilevelmenu.css"/>
    <link rel="stylesheet" type="text/css" href="plug-in/bootstrap/css/component.css"/>
    <link rel="stylesheet" type="text/css" href="plug-in/bootstrap/css/animations.css"/>
    <link rel="stylesheet" type="text/css" href="plug-in/bootstrap/css/bootstrap-treeview.css"/>
    <script src="plug-in/bootstrap/js/modernizr.custom.js"></script>
    <link rel="stylesheet" type="text/css" href="plug-in/swork/plugin/treeJquery/css/default.css">
    <link href="plug-in/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="plug-in/swork/default/css/weui.css"/>
    <link rel="stylesheet" href="plug-in/swork/default/css/example.css"/>
    <link rel="stylesheet" href="plug-in/swork/plugin/webuploader/css/webuploader.css"/>
    <link rel="stylesheet" href="plug-in/swork/default/css/questr.css"/>
       <link rel="stylesheet" href="plug-in/swork/tasklist/css/custom.css"/>
	
    <!--     预览图片插件css -->
<!--     <link rel="stylesheet" href="plug-in/swork/plugin/banners/css/style.css"/> -->
<!--     <link rel="stylesheet" href="plug-in/swork/plugin/banners/css/styleShow.css"/> -->
    <!--     end！！ -->
    <!--     <script src="plug-in/jquery/jquery-1.8.0.min.js"></script> -->
    <script src="plug-in/jquery/jquery-1.11.2.min.js"></script>
    <script src="plug-in/swork/plugin/webuploader/js/webuploader.js"></script>
    <script src="plug-in/bootstrap/js/bootstrap.min.js"></script>
    <script src="plug-in/swork/plugin/treeJquery/js/bootstrap-treeview.js"></script>
    <!-- 微信原生jssdk接口js -->
    <script src="plug-in/swork/default/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript">
    $(function(){
    	var imageSZ='${file_path }';
    	
    	var ss = imageSZ.split(",");
    	
    	for ( var i = 0; i < ss.length; i++) {
//     	var pictureImageUrl='http://192.168.1.232:9089/imageserver/${file_path }';
    	var pictureImageUrl='http://192.168.1.232:9089/imageserver/'+ss[i];
    	$(".weui_uploader_files").append('<li class="weui_uploader_file" onclick="showPictureF(\''+pictureImageUrl+'\')" style="background-image:url('+pictureImageUrl+')"></li>');
		}
    })
    </script>
</head>
<body ontouchstart>

<div id="pt-main" class="pt-perspective"    style="margin-top: -22px;">
    <div class="pt-page pt-page-1">
        <form  method="post" name="parentCheck" id="parentCheck">
            <div class="page slideIn cell button">
                <!--         <div class="weui_cells_title">表单</div> -->
                <div class="weui_cells weui_cells_form weui_cells_access">
                    <div class="weui_cell ">

                        <div class="weui_cell_hd">
                            <label class="weui_label">问题类别:</label>
                        </div>
                        <div class="weui_cell_bd weui_cell_primary">
                            <input id="questType1" name="questType1"
                                   class="weui_input" placeholder="请输入问题类别" readOnly="true" value="${case_type_name }"/>
                            <!-- 返回问题类别选择值得隐藏input -->
                            <input type="text" style="display: none" id="questType" name="questType"/>
                        </div>
                        <div class="weui_cell_ft"></div>

                    </div>
                    <div class="weui_cell ">
                        <div class="weui_cell_hd">
                            <label class="weui_label">事发区域:</label>
                        </div>
                        <div class="weui_cell_bd weui_cell_primary">
                            <input class="weui_input" id="eventRegionId1"
                                   name="eventRegionId1" value="${region_name}" placeholder="请输入事发区域" readOnly="true"/>
                            <!-- 返回事发区域选择值得隐藏input -->
                            <input type="text" style="display: none" id="eventRegionId" name="eventRegionId"/>
                        </div>
                        <div class="weui_cell_ft"></div>

                    </div>
                    <div class="weui_cell">
                        <div class="weui_cell_hd">
                            <label class="weui_label">问题描述:</label>
                        </div>
                        <div class="weui_cell_bd weui_cell_primary">
                            <input class="weui_input" id="questDesc"  value="${case_desc}" name="questDesc" readOnly="true" placeholder="请输入问题描述"/>
                        </div>
                    </div>
                    <div class="weui_cell ">
                        <div class="weui_cell_hd">
                            <label class="weui_label">位置描述:</label>
                        </div>
                        <div class="weui_cell_bd weui_cell_primary">
                            <input class="weui_input" id='spaceDesc' value="${case_pos_desc}"readOnly="true" name='spaceDesc'
                                   placeholder="请输入位置描述"/>
                        </div>
                    </div>
                    <div class="weui_cell weui_cell_select weui_select_after">
                        <div class="weui_cell_hd">问题程度:</div>
                        <div class="weui_cell_bd weui_cell_primary">
                            <select class="weui_select" name="questLevel" id="questLevel">
                                <option value="1">一般问题</option>
                                <option value="2">紧急问题</option>
                                <option value="3">重大隐患</option>
                            </select>
                        </div>
                    </div>

                    <!--图片查看部分-->
                     <div class="weui_cell" style="margin-left: -8px;">
            <div class="weui_cell_bd weui_cell_primary">
                <div class="weui_uploader">
                    <div class="weui_uploader_hd weui_cell">
                        <div class="weui_cell_hd">图片预览</div>
                    </div>
                    <div id="uploader-demos" class="weui_uploader_bd">
                        <ul class="weui_uploader_files">
                        </ul>
<!--                         <input type="hidden" id="pid" name="pid"/> -->
<!--                         <input type="hidden" id="divSlideurl" name=divSlideurls /> -->
<!--                         <div id="uploader-demo" style="margin-top: -9px;" class="weui_uploader_input_wrp"> -->
<!--                         </div> -->
                    </div>
                </div>
            </div>
        </div>
                </div>

            </div>

        </form>
    </div>
</div>

<script src="plug-in/bootstrap/js/jquery.dlmenu.js"></script>
<script src="plug-in/bootstrap/js/pagetransitions.js"></script>
<script type="text/javascript">

//     通过config接口注入权限验证配置
// wx.config({
// 	debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
// 	appId: '${map["appid"]}', // 必填，公众号的唯一标识
// 	timestamp: '${map["timestamp"]}', // 必填，生成签名的时间戳
// 	nonceStr: '${map["noncestr"]}', // 必填，生成签名的随机串
// 	signature: '${map["signature"]}',// 必填，签名，见附录1
// 	jsApiList: ['chooseImage', 'uploadImage', 'previewImage', 'downloadImage', 'openLocation', 'getLocation'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
// });
// wx.ready(function(){

	function showPictureF(ws){
// 	 	  alert(12)
	        	      wx.previewImage({
	        	          current: ''+ws+'',
	        	          urls: [
//	 						ws,
	        	            ''+ws+''
//	         	            '',
//	         	            'http://img3.douban.com/view/photo/photo/public/p2152134700.jpg'
	        	          ]
	        	        });
	        	     }
	
  

  
// })
</script>
</body>
</html>

