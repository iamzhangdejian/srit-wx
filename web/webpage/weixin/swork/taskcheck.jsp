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
    <link rel="stylesheet" href="plug-in/swork/tasklist/css/custom.css"/>
    <link rel="stylesheet" href="plug-in/swork/default/css/questr.css"/>
    

    <!--     预览图片插件css -->
    <link rel="stylesheet" href="plug-in/swork/plugin/banners/css/style.css"/>
    <link rel="stylesheet" href="plug-in/swork/plugin/banners/css/styleShow.css"/>
    <!--     end！！ -->
    <!--     <script src="plug-in/jquery/jquery-1.8.0.min.js"></script> -->
    <script src="plug-in/jquery/jquery-1.11.2.min.js"></script>
    <script src="plug-in/bootstrap/js/bootstrap.min.js"></script>
    <script src="plug-in/treeJquery/js/bootstrap-treeview.js"></script>
    <!-- 微信原生jssdk接口js -->
    <script src="plug-in/swork/default/js/jweixin-1.0.0.js"></script>


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
<!-- 				</div> -->
<!-- 				<div class="weui_cells_title"> </div> -->
<!-- 				<div class="weui_cells "> -->
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
<!--     <div class="weui_cells weui_cells_form"> -->
        <div class="weui_cell" style="margin-left: -8px;">
            <div class="weui_cell_bd weui_cell_primary">
                <div class="weui_uploader">
                    <div class="weui_uploader_hd weui_cell">
                        <div class="weui_cell_hd">图片上传</div>
                    </div>
                    <div id="uploader-demos" class="weui_uploader_bd">
                        <ul class="weui_uploader_files">
                        </ul>
                        <input type="hidden" id="pid" name="pid"/>
<!--                         <input type="hidden" id="divSlideurl" name=divSlideurls /> -->
                        <div id="uploader-demo" style="margin-top: -9px;" class="weui_uploader_input_wrp">
<!--                             <input class="weui_uploader_input"  accept="image/jpg,image/jpeg,image/png,image/gif" multiple /> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
					<!--附件集合结束 -->
<!-- 				</div> -->

				<div class="weui_btn_area">
					<input class="weui_btn weui_btn_primary" href="javascript:"
						type="submit" id="showTooltipss" value="提交" />
				</div>
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
		

		    //     通过config接口注入权限验证配置
					wx.config({
						debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
						appId: '${map["appid"]}', // 必填，公众号的唯一标识
						timestamp: '${map["timestamp"]}', // 必填，生成签名的时间戳
						nonceStr: '${map["noncestr"]}', // 必填，生成签名的随机串
						signature: '${map["signature"]}',// 必填，签名，见附录1
						jsApiList: ['chooseImage', 'uploadImage', 'previewImage', 'downloadImage', 'openLocation', 'getLocation'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
					});
		   	 wx.ready(function(){
		   		 var j=0;
//		         图片上传接口
		        var images = {
		        	    localId: [],
		        	    serverId: []
		        	  };
		        	  document.querySelector('#uploader-demo').onclick = function () {
		        	    wx.chooseImage({
		        	    	count:2,
		        	    sourceType: ['album', 'camera'],
		        	      success: function (res) {
		        	    	  //alert(res);
		        	        images.localId = res.localIds;
//		         	        alert("images.localId"+images.localId);
//		         	        alert('已选择 ' + res.localIds.length + ' 张图片');
								if (images.localId.length == 0) {
		            	        alert('请先使用 chooseImage 接口选择图片');
		            	        return;
		            	      }
		            	      var i = 0, length = images.localId.length;
		            	      images.serverId = res.localIds;
							 
		            	      function upload() {
		            	    	  j=j+1;
								  //添加缩略图
								  $(".weui_uploader_files").append('<li class="weui_uploader_file" onclick="showPictureF(\''+images.localId[i]+'\')" style="background-image:url('+images.localId[i]+')"></li>');        	        
		            	        wx.uploadImage({
//		             	        	isShowProgressTips: 1, // 默认为1，显示进度提示
		            	          localId: images.localId[i].toString(),
		            	          
		            	          success: function (res) {
		            	            i++;
		            	            alert('已上传：' + i + '/' + length);
		            	            serverId = res.serverId; // 返回图片的服务器端ID
		            	            images.serverId.push(res.serverId);
		            	            if (i < length) {
		            	              upload();
									  
		            	            }
									//var url="sworkQuesrController.do?questForm";
									var url = "sworkQuesrController.do?upLoad&serverId="+serverId.toString();
					     			var data = "{serverId:"+serverId.toString()+"}";
					     			//alert("serverId: "+data);
					     			$.post(url,data,function(attStr){
										//alert("success");
										//alert(attStr);
										var atr=JSON.parse(attStr).attStr;
										//alert(JSON.parse(attStr).attStr);
										if ($("#pid").val() == "") {
//								            $("#pid").val($("#pid").val() + response);
								           $("#pid").val($("#pid").val() + atr);
								           alert( $("#pid").val());
								       } else {
//								            $("#pid").val($("#pid").val() + "," + response);
								           $("#pid").val($("#pid").val() + "," + atr);
								           alert( $("#pid").val());
								       }
										
										 
									});
		            	          },
		            	          fail: function (res) {
		            	            alert(JSON.stringify(res));
		            	          }
		            	        });
		            	      }
		            	    
		            	      upload();
							   if(images.localId.length>=2||j==2){
				        	    	$(".weui_uploader_input_wrp").attr('style','display: none');
				        	    }
		        	      }
		        	    
		        	    });
		        	   
		        	  };
		        
		        	  
		  })
		  function showPictureF(ws){
//		 	  alert(12)
		        	      wx.previewImage({
		        	          current: ''+ws+'',
		        	          urls: [
//		 						ws,
		        	            ''+ws+''
//		         	            '',
//		         	            'http://img3.douban.com/view/photo/photo/public/p2152134700.jpg'
		        	          ]
		        	        });
		        	     }
		    
	</script>
</body>
</html>