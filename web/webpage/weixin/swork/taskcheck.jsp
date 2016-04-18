<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<title>${case_biz_type_name}</title>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/> 
    <link rel="stylesheet" type="text/css" href="plug-in/bootstrap/css/multilevelmenu.css"/>
    <link rel="stylesheet" type="text/css" href="plug-in/bootstrap/css/component.css"/>
    <link rel="stylesheet" type="text/css" href="plug-in/bootstrap/css/animations.css"/>
    <link rel="stylesheet" type="text/css" href="plug-in/bootstrap/css/bootstrap-treeview.css"/>
    <script src="plug-in/bootstrap/js/modernizr.custom.js"></script>
    <link rel="stylesheet" type="text/css" href="plug-in/treeJquery/css/default.css">
    <link href="plug-in/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="plug-in/swork/default/css/weui.css"/>
    <link rel="stylesheet" href="plug-in/swork/default/css/example.css"/>
    <link rel="stylesheet" href="plug-in/swork/plugin/webuploader/css/webuploader.css"/>
    <link rel="stylesheet" href="plug-in/swork/tasklist/css/custom.css"/>
    <link rel="stylesheet" href="plug-in/swork/default/css/questr.css"/>
    

    <!--     预览图片插件css -->
    <link rel="stylesheet" href="plug-in/swork/plugin/banners/css/style.css"/>
    <link rel="stylesheet" href="plug-in/swork/plugin/banners/css/styleShow.css"/>
    <!--     end！！ -->
    <!--     <script src="plug-in/jquery/jquery-1.8.0.min.js"></script> -->
    <script src="plug-in/jquery/jquery-1.11.2.min.js"></script>
    <script src="plug-in/webuploader/js/webuploader.js"></script>
    <script src="plug-in/bootstrap/js/bootstrap.min.js"></script>
    <script src="plug-in/treeJquery/js/bootstrap-treeview.js"></script>
    <!--     webupload初始化js -->
    <script src="plug-in/swork/plugin/webuploader/js/webuploaderBegin.js"></script>
    <!-- 微信原生jssdk接口js -->
    <script src="plug-in/sworkWexin/js/jweixin-1.0.0.js"></script>


    <script type="text/javascript">

        function showPicture() {
            var imglist = document.getElementById("fileList").getElementsByTagName('IMG');
        	var divSlideurls=new Array();
        		divSlideurls=divSlideurl;
            $(".weui_toastShow").empty();
            $(".weui_toastShow").append('<div class="dustbin" onclick="hiddenShow()"></div>');
            $(".weui_toastShow").append('<div id="showPictures" class="flexslider" style="margin-top: 25px;"></div>');
            $("#showPictures").append('<ul class="slides"></ul>');
            for ( var j = 0; j <= divSlideurls.length; j++) {
            	console.log("wwwewewewe:"+divSlideurls[j]);
            	if(divSlideurls[j] !="" && divSlideurls[j]!=undefined){
				$(".slides").append('<li ><div><img class="wuli" src="'+divSlideurls[j]+'" width="100%" height=" 390px;"   alt="" /></div></li>');
				
            	}
        }
// 			初始化预览图片框
            $('#showPictures').flexslider({
                animation: "slide",
                direction: "horizontal",
                easing: "swing"
            });
            
            
            var $toastFormP = $('#toastFormP');
            if ($toastFormP.css('display') != 'none') {
                return;
            }
            $toastFormP.show();
//            setTimeout(function () {
//                $toastFormP.hide();
//            }, 2000);
        }
        //        隐藏预览图片显示框
        function hiddenShow() {
            $('#toastFormP').attr("style", "display: none;width: 390px;");
           
        }
        
        
    </script>
<style type="text/css">
.hd {
    padding: 2em 0;
}
.weui_label{
	font-weight:bold;
}


#case_code{ 
padding-right:20px; 
background:url("plug-in/swork/default/images/xinx.png") no-repeat scroll right center transparent; 
} 

</style>
</head>
<body ontouchstart>
	<form action="sworkTaskController.do?taskForm" method="post"
		name="parentCheck" id="parentCheck">
		<div class="page slideIn cell button">
			<div class="bd">
				<div class="weui_cells ">
					<div class="weui_cell " id="detail">
						<div class="weui_cell_hd">
							<label class="weui_label">案卷编号:</label>
						</div>
						<div class="weui_cell_bd weui_cell_primary">
						<input class="weui_input " value="${case_code}"  id="case_code" readOnly="true" />
							 <input class="weui_input weui_icon_info_circle" id="case_id"
								name="case_id" value="${case_id}" readOnly="true"
								style="display: none" /> <input class="weui_input"
								id="case_biz_type_id" name="case_biz_type_id"
								value="${case_biz_type_id}" readOnly="true"
								style="display: none" /> <input class="weui_input"
								id="case_biz_sn" name="case_biz_sn" value="${case_biz_sn}"
								readOnly="true" style="display: none" />
								
						</div>
<!-- 						<i class="weui_icon_info_circle"></i> -->
					</div>
					<div class="weui_cell ">
						<div class="weui_cell_hd">
							<label class="weui_label">处置要求:</label>
						</div>
						<div class="weui_cell_bd weui_cell_primary">
							<input class="weui_input" value="${send_op_info}" readOnly="true" />
						</div>
					</div>
					<div class="weui_cell ">
						<div class="weui_cell_hd">
							<label class="weui_label">位置描述:</label>
						</div>
						<div class="weui_cell_bd weui_cell_primary">
							<input class="weui_input" value="${case_pos_desc}"
								readOnly="true" />
						</div>
					</div>
				</div>
				<div class="weui_cells_title"> </div>
				<div class="weui_cells ">
					<div class="weui_cell">
						<div class="weui_cell_hd">
						<label class="weui_label">反馈结果:</label>
						</div>
						<div class="weui_cell_bd weui_cell_primary">
							<select class="weui_select" id="op_result_id" name="op_result_id" style="height:27px;padding-left:0px">
								<option value="1">已处理,核查属实</option>
								<option value="2">未处理,核查不属实</option>
							</select>
						</div>
					</div>
					<div class="weui_cell">
						<div class="weui_cell_hd">
							<label class="weui_label">反馈描述:</label>
						</div>
						<div class="weui_cell_bd weui_cell_primary">
							<input class="weui_input" id="verify_examine_desc"
								name="verify_examine_desc" placeholder="请输入反馈描述" />
						</div>
					</div>
					<div class="weui_cell ">
						<div class="weui_cell_hd">
							<label class="weui_label">反馈备注:</label>
						</div>
						<div class="weui_cell_bd weui_cell_primary">
							<input class="weui_input" id='verify_examine_remarks'
								name='verify_examine_remarks' placeholder="请输入反馈备注" />
						</div>
					</div>

					<!--图片上传部分-->
					<div class="weui_cells" style="margin-top: 0.186471em">
						<div id="attach_list">
							<!--     用来存放item -->
							<div id="fileList" class="uploader-list"
								style="width: 100%; margin-left: 14px;"></div>
							<div id="filePicker"
								style="overflow: hidden; margin-left: 14px; margin-top: 18px;"></div>
						</div>
						<!--     <input type="text" style="display: none"  id="filename"  /> -->
						<input type="hidden" id="pid" name="pid" />
					</div>
					<!--附件集合结束 -->
				</div>

				<div class="weui_btn_area">
					<input class="weui_btn weui_btn_primary" href="javascript:"
						type="submit" id="showTooltipss" value="提交" />
				</div>
			</div>
		</div>

	</form>
	
	<!-- 	预览图片-->
<div id="toastFormP" style="display: none;width: 390px;">
    <div class="weui_mask_transparent">
    </div>
    <div class="weui_toastShow">
        <!--预览图片关闭按钮 -->
        <div class="dustbin" onclick="hiddenShow()"></div>
        <div id="showPictures" class="flexslider" style="margin-top: 25px;">
            <ul class="slides">
            </ul>
        </div>
        <!-- 		flexslider end -->
    </div>
</div>
	<form action="sworkTaskController.do?taskDetail" method="post"
		name="parentCheckform" id="parentCheckform">
		<input class="weui_input" id="case_id" name="case_id"
			value="${case_id}" readOnly="true" style="display: none" />
	</form>
	<script src="plug-in/swork/default/js/zepto.min.js"></script>
	<script src="plug-in/swork/default/js/example.js"></script>
	<script src="plug-in/swork/plugin/banners/js/slider.js"></script>
	<script type="text/javascript">
		$('#detail').click(function() {
			$("#parentCheckform").submit();
		});
	</script>
</body>
</html>