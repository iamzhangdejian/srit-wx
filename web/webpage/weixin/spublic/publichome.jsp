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
    <script src="plug-in/swork/default/js/jweixin-1.0.0.js"></script>
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
<div class="content" style="top:2.2rem">
 <form  method="post" name="parentCheck" id="parentCheck">
  <div class="list-block" style="     margin: 0.4rem 0 !important; ">
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
              <textarea  id="questDesc" placeholder="请填写事项说明......" style="height: 4rem;"></textarea>
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
            <textarea  id="spaceDesc" placeholder="请填写位置描述......" style="height: 4rem;"></textarea>
<!--               <input type="text" id="spaceDesc" ></input> -->
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
                    <div id="uploader-demos" class="weui_uploader_bd">
                        <ul class="weui_uploader_files">
<!--                         <li class="weui_uploader_file"  style="background-image:url('http://img3.douban.com/view/photo/photo/public/p2152134700.jpg')"></li> -->
                        <li class="weui_uploader_file" >
                        <div id="uploader-demo"  class="weui_uploader_input_wrp">
                        </div>
                        </li>
                        </ul>
                        <input type="hidden" id="pid" name="pid"/>
                        <input type="hidden" id="divSlideurl" name=divSlideurls />
                        
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

</html>
