<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="plug-in/swork/plugin/webuploader/css/webuploader.css"/>
    <link rel="stylesheet" href="plug-in/swork/default/css/questr.css"/>
       <link rel="stylesheet" href="plug-in/swork/tasklist/css/custom.css"/>

    <!--     预览图片插件css -->
    <link rel="stylesheet" href="plug-in/swork/plugin/banners/css/style.css"/>
    <link rel="stylesheet" href="plug-in/swork/plugin/banners/css/styleShow.css"/>
    <!--     end！！ -->
    <!--     <script src="plug-in/jquery/jquery-1.8.0.min.js"></script> -->
    <script src="plug-in/jquery/jquery-1.11.2.min.js"></script>
    <script src="plug-in/swork/plugin/webuploader/js/webuploader.js"></script>
    <script src="plug-in/bootstrap/js/bootstrap.min.js"></script>
    <script src="plug-in/swork/plugin/treeJquery/js/bootstrap-treeview.js"></script>
    <!--     webupload初始化js -->
    <script src="plug-in/swork/plugin/webuploader/js/webuploaderBegin.js"></script>
    <!-- 微信原生jssdk接口js -->
    <script src="plug-in/swork/default/js/jweixin-1.0.0.js"></script>
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
<body ontouchstart style="overflow: hidden;">

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

                    <!--图片上传部分-->
                    <div class="weui_cells" style="margin-top:0.186471em">
                        <div id="uploader-demo">
                            <!--     用来存放item -->
                            <!--                             <div id="fileList" class="uploader-list" style="width: 100%;margin-left: 14px;"></div> -->
                            <div id="fileList" class="uploader-list" style="width: 100%;margin-left: 14px;"></div>
                            <div id="filePicker" style="overflow: hidden;margin-left: 14px;margin-top: 18px;"></div>
                        </div>
                        <!--     <input type="text" style="display: none"  id="filename"  /> -->
                        <input type="hidden" id="pid" name="pid"/>
                        <input type="hidden" id="divSlideurl" name=divSlideurls />
                    </div>
                    <!--附件集合结束 -->


                </div>


                <div class="weui_btn_area">
                    <input class="weui_btn weui_btn_primary" href="javascript:" type="submit" id="showTooltipss"
                           value="提交"/>
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

<script src="plug-in/bootstrap/js/jquery.dlmenu.js"></script>
<script src="plug-in/bootstrap/js/pagetransitions.js"></script>
<script type="text/javascript">
    $(function () {
    	
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

    document.querySelector('#spaceDesc').onclick = function () {
    	alert(1)
        wx.getLocation({
            success: function (res) {
                alert(JSON.stringify(res));
                $("#spaceDesc").val = JSON.stringify(res);
            },
            cancel: function (res) {
                alert('用户拒绝授权获取地理位置');
            }
        });
    };


</script>
<script src="plug-in/swork/plugin/banners/js/slider.js"></script>
<script type="text/javascript">
function tanchu() {

};
</script>
</body>
</html>

