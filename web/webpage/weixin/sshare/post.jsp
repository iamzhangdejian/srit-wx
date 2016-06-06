<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <title>发布帖子</title>
  <link href="plug-in/swork/plugin/sui/css/sm.min.css" rel="stylesheet">
  <script type="text/javascript" src="plug-in/swork/tasklist/js/jquery.min.js"></script>
</head>
<body>
<header class="bar bar-nav">
  <button class="button pull-left" onclick="forum()" Style="color: white;">
<!--     <span class="icon icon-left"></span> -->
    返回
  </button>
  
  
  <h1 class="title">发布帖子</h1>
</header>
<div class="content">
 <form action="SworkPublicController.do?publicForm" method="post" name="parentCheck" id="parentCheck">
  <div class="list-block" style="margin:0.4rem 0;">
    <ul>
    <li class="align-top">
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-comment"></i></div>
          <div class="item-inner">
          
            <div class="item-title label"><span class="icon icon-edit"></span></span>标题</div>
            
          </div>
        </div>
      </li>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-input">
              <input type="text" id="post_subject_name" ></input>
            </div>
          </div>
        </div>
      </li>
      <li class="align-top">
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-comment"></i></div>
          <div class="item-inner">
          
            <div class="item-title label"><span class="icon icon-app"></span></span>类型</div>
            
          </div>
        </div>
      </li>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div class="item-input">
              <select id="psot_type_id">
                <option  value="0">旧货</option>
                <option  value="1">家政</option>
                <option  value="2">宠物</option>
                <option  value="3">家教</option>
                <option  value="4">拼车</option>
              </select>
            </div>
          </div>
        </div>
      </li>
      <li class="align-top">
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-comment"></i></div>
          <div class="item-inner">
          
            <div class="item-title label"><span class="icon icon-menu"></span>内容</div>
            
          </div>
        </div>
      </li>
      <li class="align-top">
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-comment"></i></div>
          <div class="item-inner">
            <div class="item-input">
              <textarea  id="post_content" placeholder="请填写内容......"></textarea>
            </div>
          </div>
        </div>
      </li>
      <li class="align-top">
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-comment"></i></div>
          <div class="item-inner">
          </div>
        </div>
      </li>
    </ul>
  </div>
  <div class="content-block">
    <div class="row">
      <div class="col-100">
      <a href="javascript:void(0)"    onclick="poatsubmit();"  class="button button-big button-fill button-success">提交</a></div>
    </div>
  </div>
  </form>
</div>
</body>

</html>
