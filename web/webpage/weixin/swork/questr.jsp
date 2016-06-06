<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>问题上报</title>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <link rel="stylesheet" type="text/css" href="plug-in/bootstrap/css/multilevelmenu.css"/>
    <link rel="stylesheet" type="text/css" href="plug-in/bootstrap/css/component.css"/>
    <link rel="stylesheet" type="text/css" href="plug-in/bootstrap/css/animations.css"/>
    <link rel="stylesheet" type="text/css" href="plug-in/bootstrap/css/bootstrap-treeview.css"/>
    <script src="plug-in/bootstrap/js/modernizr.custom.js"></script>
    <link rel="stylesheet" type="text/css" href="plug-in/swork/plugin/treeJquery/css/default.css">
    <link href="plug-in/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="plug-in/swork/default/css/weui.css"/>
    <link rel="stylesheet" href="plug-in/swork/default/css/example.css"/>
    <link rel="stylesheet" href="plug-in/swork/default/css/questr.css"/>
    <link rel="stylesheet" href="plug-in/swork/tasklist/css/custom.css"/>
    <script src="plug-in/jquery/jquery-1.11.2.min.js"></script>
    <script src="plug-in/bootstrap/js/bootstrap.min.js"></script>
    <script src="plug-in/swork/plugin/treeJquery/js/bootstrap-treeview.js"></script>
    <!-- 微信原生jssdk接口js -->
    <script src="plug-in/swork/default/js/jweixin-1.0.0.js"></script>

<style type="text/css">
.weui_toastF {
    position: fixed;
    z-index: 3;
    /* width: 7.6em; */
    min-height: 7.6em;
    top: 180px;
    left: 50%;
    margin-left: -3.8em;
    background: rgba(40, 40, 40, 0.75);
    text-align: center;
    border-radius: 5px;
    color: #FFFFFF;
}
</style>
<script>
function myFunction(lab,div){
			document.getElementById(lab).style.color="#47cb2c"; 
			document.getElementById(div).style.borderColor = "#47cb2c"; 
			
		}
function Function(lab,div){
	document.getElementById(lab).style.color="#333"; 
	document.getElementById(div).style.borderColor = "#b5b5b5"; 
	}
		</script>

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

</head>
<body ontouchstart style="overflow: hidden;" >

<div id="pt-main" class="pt-perspective">
    <div class="pt-page pt-page-1">
        <form action="sworkQuesrController.do?questForm" method="post" name="parentCheck" id="parentCheck">
            <div class="page slideIn cell button">
                <!--         <div class="weui_cells_title">表单</div> -->
                <div class="weui_cells weui_cells_form weui_cells_access" style="margin-top:0.176471em">
                    <div class="weui_cell ">

                        <div class="weui_cell_hd">
                            <label class="weui_label">问题类别:</label>
                        </div>
                        <div class="weui_cell_bd weui_cell_primary">
                            <input id="questType1" name="questType1"
                                   class="weui_input" placeholder="请输入问题类别" readOnly="true"/>
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
                                   name="eventRegionId1" placeholder="请输入事发区域" readOnly="true"/>
                            <!-- 返回事发区域选择值得隐藏input -->
                            <input type="text" style="display: none" id="eventRegionId" name="eventRegionId"/>
                        </div>
                        <div class="weui_cell_ft"></div>

                    </div>
                    <div class="weui_cell" id="quest">
                        <div class="weui_cell_hd">
                            <label class="weui_label">问题描述:</label>
                        </div>
                        <div class="weui_cell_bd weui_cell_primary" id="qu">
                            <input onFocus="myFunction('quest','qu');" onBlur="Function('quest','qu');"  class="weui_input" id="questDesc" name="questDesc" placeholder="请输入问题描述"/>
                        </div>
                    </div>
                    <div class="weui_cell " id="space">
                        <div class="weui_cell_hd">
                            <label class="weui_label">位置描述:</label>
                        </div>
                        <div class="weui_cell_bd weui_cell_primary" id="sp">
                            <input  onFocus="myFunction('space','sp');" onBlur="Function('space','sp');" class="weui_input" id='spaceDesc' name='spaceDesc' 
                                   placeholder="请选择位置描述"/>
                        </div>
                    </div>
                    <div class="weui_cell weui_cell_select weui_select_after">
                        <label class="weui_cell_hd">问题程度:</label>
                        <div class="weui_cell_bd weui_cell_primary">
                            <select class="weui_select" name="questLevel" id="questLevel" style="height:27px">
                                <option value="1">一般问题</option>
                                <option value="2">紧急问题</option>
                                <option value="3">重大隐患</option>
                            </select>
                        </div>
                    </div>
<!-- 图片上传 -->
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
                        <input type="hidden" id="divSlideurl" name=divSlideurls />
                        <div id="uploader-demo" style="margin-top: -9px;" class="weui_uploader_input_wrp">
<!--                             <input class="weui_uploader_input"  accept="image/jpg,image/jpeg,image/png,image/gif" multiple /> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!--     </div> -->
                    <!--附件集合结束 -->
					<!-- <div id="container" style="display: none;"></div> -->

                <div class="weui_btn_area">
                    <input class="weui_btn weui_btn_primary" onclick="return validate()" href="javascript:void(0)" type="submit" id="showTooltipss"
                           value="提交"/>
                </div>
                </div>


            </div>

        </form>
    </div>
    <div class="pt-page pt-page-2">

        <div class="page slideIn cell button">
            <div class="weui_cells weui_cells_form weui_cells_access" style="overflow:auto">
                <div class="weui_btn_area" style="display:none;"> 
                    <input class="weui_btn weui_btn_primary"  type=button value="确 定" name=''
                           id="problembut"/>
                </div>
                <div id="treeview12"></div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="caseId" value="${caseId }"/>


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
<!-- 	上传成功 -->
<div id="toastForm" style="display: none;">
    <div class="weui_mask_transparent"></div>
    <div class="weui_toast">
        <i class="weui_icon_toast"></i>
        <p class="weui_toast_content">上传成功！</p>
    </div>
</div>
<!--     上传失败 -->
<div id="toastFormF" style="display: none;">
    <div class="weui_mask_transparent"></div>
    <div class="weui_toast">
        <i class="weui_icon_toast"></i>
        <p class="weui_toast_content">上传失败！</p>
    </div>
</div>
<!-- 选择提示 -->
<div id="toast" style="display: none;">
    <div class="weui_mask_transparent"></div>
    <div class="weui_toast">
        <i class="weui_icon_toast"></i>
        <p class="weui_toast_content">选择错误！</p>
    </div>
</div>
<!-- 案件类别不能为空！ -->
<div id="caseType" style="display: none;">
    <div class="weui_mask_transparent"></div>
    <div class="weui_toastF">
     	<div style="margin-top: 16px">
        <i class="weui_icon_warn" ></i>
        <p class="weui_toast_content">问题类别不能为空！</p>
     	</div>
    </div>
</div>
<!-- 事发区域不能为空！ -->
<div id="CaseRegionId" style="display: none;">
    <div class="weui_mask_transparent"></div>
    <div class="weui_toastF">
    <div style="margin-top: 16px">
        <i class="weui_icon_warn"></i>
        <p class="weui_toast_content">事发区域不能为空！</p>
        </div>
    </div>
</div>
<!-- 问题描述不能为空！ -->
<div id="CaseQuest" style="display: none;">
    <div class="weui_mask_transparent"></div>
    <div class="weui_toastF">
    <div style="margin-top: 16px">
        <i class="weui_icon_warn" ></i>
        <p class="weui_toast_content">问题描述不能为空！</p>
        </div>
    </div>
</div>

<script src="plug-in/bootstrap/js/jquery.dlmenu.js"></script>
<script src="plug-in/bootstrap/js/pagetransitions.js"></script>
<script type="text/javascript">
    $(function () {
//     	上报提示
        if ($("#caseId").val() == 1) {
            var $toastForm = $('#toastForm');
            if ($toastForm.css('display') != 'none') {
                return;
            }
            $toastForm.show();
            setTimeout(function () {
                $toastForm.hide();
            }, 2000);
        } else if ($("#caseId").val() == 2) {
            var $toastFormF = $('#toastFormF');
            if ($toastFormF.css('display') != 'none') {
                return;
            }
            $toastFormF.show();
            setTimeout(function () {
                toastFormF.hide();
            }, 2000);
        }

    });
    
    

    
    
    function problem() {
        if ($("li").hasClass("node-selected")) {
            var id = document.getElementById('problembut').name;
            var liId = "";
            liId = $("li.node-selected")[0].id.toString();
            document.getElementById(id.substring(0, id.length - 1)).value = liId;
            if ($("li.node-selected")[0].value == "1") {
                if (id == "questType1") {
                    if (liId.length > 2) {
                        var textname = $("li.node-selected")[0].innerText;
                        for (var i = 2; i < liId.length; i++) {
                            var suliId = liId.substring(0, liId.length - i);
                            textname = document.getElementById(suliId).innerText + "/" + textname;
                            i++;
                        }
                        document.getElementById(id).value = textname;

                    } else {
                        document.getElementById(id).value = $("li.node-selected")[0].innerText;
                        document.getElementById(id.substring(0, id.length - 1)).value = liId;
                    }
                } else {
                    if (liId.length > 3) {
                        var textname = $("li.node-selected")[0].innerText;
                        for (var i = 3; i < liId.length; i++) {
                            var suliId = liId.substring(0, liId.length - i);
                            textname = document.getElementById(suliId).innerText + "/" + textname;
                            i++;
                            i++;
                        }
                        document.getElementById(id).value = textname;

                    } else {
                        document.getElementById(id).value = $("li.node-selected")[0].innerText;
                        document.getElementById(id.substring(0, id.length - 1)).value = liId;
                    }
                }

            } else {
                var $toast = $('#toast');
                if ($toast.css('display') != 'none') {
                    return;
                }
                $toast.show();
                setTimeout(function () {
                    $toast.hide();
                }, 2000);
            }
        }
    }

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
   		 
//    		 获取地理位置
    	$(function(){
            wx.getLocation({
                success: function (res) {
				
//                     alert(JSON.stringify(res));
					var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
					var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
					var wz=longitude+","+latitude;
					$("#spaceDesc").val(wz);
//                     $("#spaceDesc").val=JSON.stringify(res);
                },
                cancel: function (res) {
                    alert('用户拒绝授权获取地理位置');
                }
            });
    	});
    	 var j=0;
//         图片上传接口
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
//         	        alert("images.localId"+images.localId);
//         	        alert('已选择 ' + res.localIds.length + ' 张图片');
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
//             	        	isShowProgressTips: 1, // 默认为1，显示进度提示
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
//						            $("#pid").val($("#pid").val() + response);
						           $("#pid").val($("#pid").val() + atr);
						           alert( $("#pid").val());
						       } else {
//						            $("#pid").val($("#pid").val() + "," + response);
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
// 	  alert(12)
        	      wx.previewImage({
        	          current: ''+ws+'',
        	          urls: [
// 						ws,
        	            ''+ws+''
//         	            '',
//         	            'http://img3.douban.com/view/photo/photo/public/p2152134700.jpg'
        	          ]
        	        });
        	     }
    

//    	 验证表单是否为空
function validate(){
	var chooseType="";
	var text1=$("#questType").val();
	var text2=$("#eventRegionId").val();
	var text3=$("#questDesc").val();
	if(text1==''){
// 		alert("问题类别不能为空！！");
		chooseType=1;
		var $caseType = $('#caseType');
	    if ($caseType.css('display') != 'none') {
	        return;
	    }
	    $caseType.show();
	    setTimeout(function () {
	    	$caseType.hide();
	    }, 2000);	
		return false;
	}else if(text2==''){
// 		alert("事发区域不能为空！！");
		
		var $CaseRegionId = $('#CaseRegionId');
	    if ($CaseRegionId.css('display') != 'none') {
	        return;
	    }
	    $CaseRegionId.show();
	    setTimeout(function () {
	    	$CaseRegionId.hide();
	    }, 2000);	
		return false;
	}else if(text3==''){
// 		alert("问题描述不能为空！！");
		var $CaseQuest = $('#CaseQuest');
	    if ($CaseQuest.css('display') != 'none') {
	        return;
	    }
	    $CaseQuest.show();
	    setTimeout(function () {
	    	$CaseQuest.hide();
	    }, 2000);	
		return false;
	}else if(text1==''&&text2==''){
		alert("问题类别、事发区域为必填项！");
		return false;
	}else if(text3==''&&text2==''){
		alert("问题描述、事发区域为必填项！");
		return false;
	}else if(text3==''&&text2==''&&text1==''){
		alert("问题类别、事发区域、问题描述为必填项！");
		return false;
	}else{
		return true;
	}
//  案件类别
    if(chooseType==1){
    	alert(1);
    }
}
</script>
<!-- <script src="plug-in/swork/plugin/banners/js/slider.js"></script> -->

</body>
</html>
