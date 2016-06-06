<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <title>公众服务平台</title>
<!--   <script src="plug-in/swork/plugin/sui/js/jquery.min.js"></script> -->
<!--   <link href="plug-in/swork/plugin/sui/css/sm-extend.css" rel="stylesheet"> -->
<!--   <link href="plug-in/swork/plugin/sui/css/sm-extend.min.css" rel="stylesheet"> -->
<!--   <link href="plug-in/swork/plugin/sui/css/sm.css" rel="stylesheet"> -->
	<link rel="stylesheet" href="plug-in/swork/plugin/sui/css/reset.css" />
	<link rel="stylesheet" href="plug-in/swork/plugin/sui/css/custom.css" />
    <link rel="stylesheet" href="plug-in/swork/plugin/sui/css/pullToRefresh.css" />
	<script src="plug-in/swork/plugin/sui/js/iscroll.js"></script>
	<script src="plug-in/swork/plugin/sui/js/pullToRefresh.js"></script>
	<script src="plug-in/swork/plugin/sui/js/colorful.js"></script>
	<script src="plug-in/swork/main/forum.js"></script>
	<script src="plug-in/swork/main/cityNews.js"></script>
	<script src="plug-in/swork/main/replypost.js"></script>
	<script src="plug-in/swork/main/history.js"></script>
	<script src="plug-in/swork/plugin/sui/js/iscroll.js"></script>						
  	<link href="plug-in/swork/plugin/sui/css/sm.min.css" rel="stylesheet">
  	<script type="text/javascript" src="plug-in/swork/plugin/sui/js/jquery.min.js"></script>
  	<script type="text/javascript" src="plug-in/swork/main/sui.js"></script>
  	   <!-- 微信原生jssdk接口js -->
    <script src="plug-in/swork/default/js/jweixin-1.0.0.js"></script>
  	 <style type="text/css">
#Main {
	width: 0px;
	height: 0px;
	margin: 0 auto;
	background-color: #a1e4d8;
	border: 1px solid #efefef;
	overflow: hidden;
	opacity: 0;
}
#Main>h3 {
	float: left;
	margin: 5px 0 0 5px;
	font: 16px "微软雅黑", Arial, Helvetica, sans-serif;
	font-weight: 800;
	color: #3873d0;
	width: 100%;
}
#foots {
	height: 58px;
	margin-top: 30px;
}
#foots>a {
	float: left;
	width: 100%;
	font: 18px "微软雅黑", Arial, Helvetica, sans-serif;
	text-align: center;
	background-color: #ff7777;
	color: #fff;
	text-decoration: none;
	cursor: pointer;
}
#foots>a:hover {
	background-color: #e84c3d;
}
#foots>a:active {
	background-color: #c54143;
}
/* #center { */
/* 	float: left; */
/* 	margin: 20px 5px 20px 5px; */
/* 	font: 16px "微软雅黑", Arial, Helvetica, sans-serif; */
/* 	color: #fff; */
/* 	line-height: 20px; */
/* } */
</style>
    
</head>

<body>
<!--  <div class="page"> -->
  
  <nav class="bar bar-tab">
  <a class="tab-item external " href="javascript:void(0)"    onclick="map(0)">
    <span class="icon icon-browser"></span>
<!--     <span class="tab-label">地图</span> -->
  </a>
  <a class="tab-item external" href="javascript:void(0)"    onclick="map(1)">
    <span class="icon icon-home"></span>
<!--     <span class="tab-label">新闻</span> -->
<!--     <span class="badge">48</span> -->
  </a>
  <a class="tab-item external active" href="javascript:void(0)"    onclick="map(2)">
    <span class="icon icon-phone"></span>
<!--     <span class="tab-label">投诉举报</span> -->
  </a>
  <a class="tab-item external" href="javascript:void(0)"    onclick="map(3)">
    <span class="icon icon-message"></span>
<!--     <span class="tab-label">社区论坛</span> -->
  </a>
  <a class="tab-item external" href="javascript:void(0)"    onclick="map(4)">
    <span class="icon icon-me"></span>
<!--     <span class="tab-label">个人中心</span> -->
  </a>
</nav>
  <div class="content" id="divid" >

  </div>
<!-- </div> -->
<div id=back style="display:none; position: relative;
    z-index: 999999;POSITION:absolute; left:0; top:0; width:100%; height:100%; background-color:rgba(0, 0, 0, 0); filter:alpha(opacity=60)"></div>

     <!-- 提示框 -->
<!-- 	<div id="Demo" style="margin-top:200px; display:none;position: relative;z-index: 9999999;"> -->
<!--         <div id="Main" style="margin-top:100px;"> -->
<!--           <h3>提示!</h3> -->
<!--           <div id="center">我是弹出对话框</div> -->
<!--           <div id="foots"><a id="btnCannel">确定</a></div> -->
<!--         </div> -->
<!--       </div> -->
</body>
<script type="text/javascript">

$(function(){
	alert(window.location.href);
})

$.ajax({
	async : false,
		url :"SworkPublicController.do?publichome" , // 跨域URL
		type : 'get',
		timeout : 4000, 
		success : function(datas){
			//$('#divid').load("https://www.baidu.com/");
			 document.getElementById("divid").innerHTML=datas;
			//$('#divid').load(datas);
			//$('#divid').load("http://192.168.1.61:8080/srit-wx/sworkLoginController.do?swTaskcheck");
		},
		complete : function(XMLHttpRequest, textStatus) {
		},
		error : function(xhr) {
			//jsonp 方式此方法不被触发
			//请求出错处理 
		}
	});
//通过config接口注入权限验证配置
wx.config({
	debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	appId: '${map["appid"]}', // 必填，公众号的唯一标识
	timestamp: '${map["timestamp"]}', // 必填，生成签名的时间戳
	nonceStr: '${map["noncestr"]}', // 必填，生成签名的随机串
	signature: '${map["signature"]}',// 必填，签名，见附录1
	jsApiList: ['chooseImage', 'uploadImage', 'previewImage', 'downloadImage', 'openLocation', 'getLocation'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});
wx.ready(function(){

// 获取地理位置
$(function(){
wx.getLocation({
    success: function (res) {
	
//         alert(JSON.stringify(res));
		var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
		var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
		var wz=longitude+","+latitude;
		$("#spaceDesc").val(wz);
//         $("#spaceDesc").val=JSON.stringify(res);
    },
    cancel: function (res) {
        alert('用户拒绝授权获取地理位置');
    }
});
});
var j=0;
//图片上传接口
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
//	        alert("images.localId"+images.localId);
//	        alert('已选择 ' + res.localIds.length + ' 张图片');
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
// 	        	isShowProgressTips: 1, // 默认为1，显示进度提示
	          localId: images.localId[i].toString(),
	          
	          success: function (res) {
	            i++;
	            //alert('已上传：' + i + '/' + length);
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
//			            $("#pid").val($("#pid").val() + response);
			           $("#pid").val($("#pid").val() + atr);
			           //alert( $("#pid").val());
			       } else {
//			            $("#pid").val($("#pid").val() + "," + response);
			           $("#pid").val($("#pid").val() + "," + atr);
			          // alert( $("#pid").val());
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
    wx.previewImage({
        current: ''+ws+'',
        urls: [
          ''+ws+''
        ]
      });
   }
      	     
//验证表单是否为空
function validate(){
	var chooseType="";
	var text1=$("#questDesc").val();
	var text2=$("#pid").val();
// 	var text3=$("#questDesc").val();
	if(text1==''){
// 		alert("问题类别不能为空！！");
		chooseType=1;
		var $matter = $('#matter');
	    if ($matter.css('display') != 'none') {
	        return;
	    }
	    $matter.show();
	    setTimeout(function () {
	    	$matter.hide();
	    }, 2000);	
		return false;
	}else if(text2==''){
		
		var $CaseRegionId = $('#CaseRegionId');
	    if ($CaseRegionId.css('display') != 'none') {
	        return;
	    }
	    $CaseRegionId.show();
	    setTimeout(function () {
	    	$CaseRegionId.hide();
	    }, 2000);	
		return false;
	}else{
		chomesubmit();
	}

}
</script>
<script type="text/javascript">
$(document).ready(function(e) {
	var mWidth=$("#Demo").width();
	var mHeight=$("#Demo").height();
// 	Show();
	$("#btnCannel").click(function(){
		$("#Main").animate({width:"232px",height:"113px",marginTop:mHeight/2-145+"px",opacity:1},100,function(){
			$("#Main").animate({width:"232px",height:"113px",marginTop:mHeight/2-125+"px",},100);
		});
		document.getElementById("Demo").style.display="none";
	});
	
});
function Show(text){
	alert(text);
// 	document.getElementById("Demo").style.display="";
// 	if($("#Main").width()>0){
// // 		$("#center").html("已经弹出");
// 		return;
// 	} 
// 	$("#center").html(text);
// 	var mWidth=$("#Demo").width();
// 	var mHeight=$("#Demo").height();
// 	$("#Main").css("margin-top",mHeight/2+"px");
// 	//$("#Main").css("margin-left",mWidth/2+"px");
// 	$("#Main").animate({width:"232px",height:"113px",marginTop:mHeight/2-145+"px",opacity:1},300,function(){
// 	$("#Main").animate({width:"232px",height:"113px",marginTop:mHeight/2-125+"px",},100);
// 	});
}
</script>
</html>
