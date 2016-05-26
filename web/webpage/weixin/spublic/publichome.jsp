<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <title>投诉举报</title>
  <link href="plug-in/swork/plugin/sui/css/sm.min.css" rel="stylesheet">
  <link rel="stylesheet" href="plug-in/swork/default/css/weui.css"/>
  <script type="text/javascript" src="plug-in/swork/tasklist/js/jquery.min.js"></script>
     <!-- 微信原生jssdk接口js -->
<!--     <script src="plug-in/swork/default/js/jweixin-1.0.0.js"></script> -->
</head>
<body>
<header class="bar bar-nav">
  <button class="button pull-left">
    <span class="icon icon-phone"></span>
  </button>
  
  <button class="button pull-right" onclick="hisop()">
  <span class="icon icon-share "></span>
<!--     按钮 -->
  </button>
  <h1 class="title">投诉举报</h1>
</header>
<div class="content" style="top:0.4rem">
 <form  method="post" name="parentCheck" id="parentCheck">
  <div class="list-block">
    <ul>
      <li class="align-top">
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-comment"></i></div>
          <div class="item-inner">
          
            <div class="item-title label"><span class="icon icon-app"></span>事项说明</div>
            
          </div>
        </div>
      </li>
      <li class="align-top">
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-comment"></i></div>
          <div class="item-inner">
            <div class="item-input">
              <textarea  id="questDesc" placeholder="请填写事项说明......"></textarea>
            </div>
          </div>
        </div>
      </li>
      <li class="align-top">
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-comment"></i></div>
          <div class="item-inner">
          
            <div class="item-title label"><span class="icon icon-browser"></span></span>位置描述</div>
            
          </div>
        </div>
      </li>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-input">
              <input type="text" id="spaceDesc" ></input>
            </div>
          </div>
        </div>
      </li>
      <li class="align-top">
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-comment"></i></div>
          <div class="item-inner">
          
            <div class="item-title label"><span class="icon icon-picture"></span></span>图片上传</div>
            
          </div>
        </div>
      </li>
      <li>
        <div class="item-content">
         <!-- 图片上传 -->
        <div class="weui_cell">
            <div class="weui_cell_bd weui_cell_primary">
                <div class="weui_uploader">
                    <div class="weui_uploader_hd weui_cell">
                    </div>
                    <div id="uploader-demos" class="weui_uploader_bd">
                        <ul class="weui_uploader_files">
                        </ul>
                        <input type="hidden" id="pid" name="pid"/>
                        <input type="hidden" id="divSlideurl" name=divSlideurls />
                        <div id="uploader-demo"  class="weui_uploader_input_wrp">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
      </li>
      
    </ul>
    
  </div>
  
 
  <div class="content-block">
    <div class="row">
<!--       <div class="col-50"><a href="#" class="button button-big button-fill button-danger">取消</a></div> -->
      <div class="col-100">					
<!--       <input class="weui_btn weui_btn_primary" href="javascript:" type="submit" id="showTooltipss" -->
<!--                            value="提交21"/> -->
      <a href="javascript:void(0)"    onclick="chomesubmit()"  class="button button-big button-fill button-success">提交</a></div>
    </div>
  </div>
  
  </form>
</div>
</body>
<script type="text/javascript">
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

	
	// 获取地理位置
 	$(function(){
         wx.getLocation({
             success: function (res) {
				
//                  alert(JSON.stringify(res));
					var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
					var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
					var wz=longitude+","+latitude;
					$("#spaceDesc").val(wz);
//                  $("#spaceDesc").val=JSON.stringify(res);
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
        images.localId = res.localIds;
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
	            alert('已上传：' + i + '/' + length);
	            serverId = res.serverId; // 返回图片的服务器端ID
	            images.serverId.push(res.serverId);
	            if (i < length) {
	              upload();
				  
	            }
				//上传到本地服务器的方法
				var url = "sworkQuesrController.do?upLoad&serverId="+serverId.toString();
     			var data = "{serverId:"+serverId.toString()+"}";
     			$.post(url,data,function(attStr){
					var atr=JSON.parse(attStr).attStr;
					if ($("#pid").val() == "") {
			           $("#pid").val($("#pid").val() + atr);
			           alert( $("#pid").val());
			       } else {
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
// 	      判断上传图片是否够2张
		   if(images.localId.length>=2||j==2){
    	    	$(".weui_uploader_input_wrp").attr('style','display: none');
    	    }
      }
    
    });
   
  };

  
})

// 预览图片方法
function showPictureF(ws){
//alert(12)
      wx.previewImage({
          current: ''+ws+'',
          urls: [
//				ws,
            ''+ws+''
//	            '',
//	            'http://img3.douban.com/view/photo/photo/public/p2152134700.jpg'
          ]
        });
     }

</script>
</html>
