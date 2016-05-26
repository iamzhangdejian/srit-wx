<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html >
 <head>
    <meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<meta name="description" content="">
    <title>评论回复</title>
    <!-- Google Web Fonts -->
    <link rel="stylesheet" href="plug-in/swork/plugin/sui/css/sm.css">
    <link rel="stylesheet" href="plug-in/swork/plugin/sui/css/sm-extend.css">
    <link rel="stylesheet" href="plug-in/swork/plugin/sui/css/demos.css">
    <script src="plug-in/swork/plugin/sui/js/hm.js"></script>
    <script src="plug-in/swork/plugin/sui/js/zepto.js"></script>
    <script src="plug-in/swork/plugin/sui/js/config.js"></script>
    
    
    <link href="plug-in/swork/plugin/sui/css/sm.min.css" rel="stylesheet">
    <script type="text/javascript" src="plug-in/swork/tasklist/js/jquery.min.js"></script>
    <link rel="stylesheet" href="plug-in/swork/plugin/sui/css/reset.css" />
    <link rel="stylesheet" href="plug-in/swork/plugin/sui/css/pullToRefresh.css" />
    <script src="plug-in/swork/plugin/sui/js/iscroll.js"></script>
    <script src="plug-in/swork/plugin/sui/js/pullToRefresh.js"></script>
    <script src="plug-in/swork/plugin/sui/js/colorful.js"></script>

  </head>
  <body class=""><div class="page-group">
    <div id="bar-multi" class="page page-current">
  <nav class="bar bar-nav bar-standard">
    <a class="button button-link button-nav pull-left back" onclick="forum()">
      <span class="icon icon-left"></span>
      返回
    </a>
    <h1 class="title">评论回复</h1>
  </nav>

  <!-- Block button in standard bar fixed below top bar -->
  <div class="bar bar-header-secondary" style="height:5.2rem">
  <ul>
   <li>
   	<div class="item-inner">
    <div class="item-subtitle" style="padding: 7px 10px;color: #5183E2">主题</div>
    <div class="item-title-row">
    <div class="item-title" style="padding:0px 10px ;color: #5183E2">2014-01-02 13:00:48</div>
    <div class="item-after">老张</div>
    <div class="item-after">
    <a>点击回帖</a>
    </div>
    </div>
    </div>
   </li>
  </ul>
  </div>

  <!-- Block button in standard bar fixed above the footer -->
  <div class="bar bar-footer-secondary" style="bottom:0.2rem">
    <button class="button button-block">Block level button</button>
  </div>

  <!-- Icons in standard bar fixed to the bottom of the screen -->
<!--   <div class="bar bar-footer"> -->
<!--     <a class="icon icon-edit pull-left"></a> -->
<!--     <a class="icon icon-settings pull-right"></a> -->
<!--   </div> -->

  <div class="content native-scroll" style="top:7.4rem; bottom:2.4rem">
    <div class="content-padded">
       
           <div id="wrapper" class="list-block media-list" style="margin:-0.87rem 0;border-width:0px;">
			    <ul id="lbul">
			         <li>
<!-- 			         <div class="item-inner"> -->
			         <div class="item-subtitle" style="padding: 7px 10px;color: #5183E2">主题</div>
			         <div class="item-title-row">
			         <div class="content-padded" style="padding:0px 10px ;color: #5183E2">
			         <p>多少份简历开始的讲课费速度放进来看是否离开 开发建设科技疯狂圣诞节疯狂就是看到了非升级到付款了及时离开 收付款记录数据分类考试及附加睡觉
			         沙发沙发和经适房收到付款了就是老师的付款了就好了可 都是垃圾分类看见是收到了反馈就是 舒服了科技师范
			         伙食费和深刻理解六十多级分类考试 </p>
			         </div>
			         </div>
			         <div class="item-title-row">
			         <div></div>
			         <div class="item-after">2014-01-02 13:00:48</div>
			         </div>
			         
			         </li>   
			    </ul>
		    </div>
    </div>
  </div>
</div>

    </div>
    
    <script src="plug-in/swork/plugin/sui/js/sm.js"></script>
    <script src="plug-in/swork/plugin/sui/js/sm-extend.js"></script>
    <script src="plug-in/swork/plugin/sui/js/sm-city-picker.js"></script>
    <script src="plug-in/swork/plugin/sui/js/demos.js"></script>
<div class="modal-overlay"></div><div class="popup-overlay"></div>
<script>
        for (var i = 0; i < document.querySelectorAll("#wrapper ul li").length; i++) {
            document.querySelectorAll("#wrapper ul li")[i].colorfulBg();
        }
        refresher.init({
            id: "wrapper",//<------------------------------------------------------------------------------------┐
            pullDownAction: Refresh,
            pullUpAction: Load
        });
        var generatedCount = 0;
        function Refresh() {
        	alert("下拉");
            setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
                var el, li, i;
                el = document.querySelector("#wrapper ul");
                el.innerHTML = '';
                for (i = 0; i < 11; i++) {
                    li = document.createElement('li');
                    li.appendChild(document.createTextNode('async row ' + (++generatedCount)));
                    el.insertBefore(li, el.childNodes[0]);
                }
                wrapper.refresh();/****remember to refresh after  action completed！ ---yourId.refresh(); ----| ****/
                
            }, 1000);

        }

        function Load() {
        	alert("上拉");
            setTimeout(function () {// <-- Simulate network congestion, remove setTimeout from production!
                var el, li, i;
                el = document.querySelector("#wrapper ul");
                for (i = 0; i < 2; i++) {
                    li = document.createElement('li');
                    li.appendChild(document.createTextNode('async row ' + (++generatedCount)));
                    el.appendChild(li, el.childNodes[0]);
                }
                wrapper.refresh();/****remember to refresh after action completed！！！   ---id.refresh(); --- ****/
                
            }, 1000);
        }
        
        
        
    </script>

</body></html>