<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <title>社区论坛</title>
  <link href="plug-in/swork/plugin/sui/css/sm.min.css" rel="stylesheet">
  <script type="text/javascript" src="plug-in/swork/tasklist/js/jquery.min.js"></script>
  <link rel="stylesheet" href="plug-in/swork/plugin/sui/css/reset.css" />
  <link rel="stylesheet" href="plug-in/swork/plugin/sui/css/pullToRefresh.css" />
  <script src="plug-in/swork/plugin/sui/js/iscroll.js"></script>
  <script src="plug-in/swork/plugin/sui/js/pullToRefresh.js"></script>
  <script src="plug-in/swork/plugin/sui/js/colorful.js"></script>
  <style type="text/css" media="all">
        body, html {
            padding: 0;
            margin: 0;
            height: 100%;
            font-family: Arial, Microsoft YaHei;
            color: #111;
        }

        li {
            /*border-bottom: 1px #CCC solid;*/
/*             text-align: center; */
            line-height: 18px;
        }
        p{
        	text-align: center;
        }
    </style>
</head>
<body >
<div id="forum">
<header class="bar bar-nav">
  <button class="button pull-right" onclick="post()">
 	<span class="icon icon-edit"></span>
  </button>
  <h1 class="title">社区论坛</h1>
</header>
	<div class="content">
		  <div class="buttons-tab" style="position: relative;z-index: 99999;">
		    <a href="javascript:void(0)"    onclick="forumMap(0,'全部')" class="tab-link active button">全部</a>
		    <a href="javascript:void(0)"    onclick="forumMap(1,0)" class="tab-link button">旧货</a>
		    <a href="javascript:void(0)"    onclick="forumMap(2,1)" class="tab-link button">家政</a>
		    <a href="javascript:void(0)"    onclick="forumMap(3,2)" class="tab-link button">宠物</a>
		    <a href="javascript:void(0)"    onclick="forumMap(4,3)" class="tab-link button">家教</a>
		    <a href="javascript:void(0)"    onclick="forumMap(5,4)" class="tab-link button">拼车</a>
		  </div>
		  <div class="content-block" >
		    <div class="tabs">
		      <div id="tab1" class="tab active">
		<!--         <div class="content-block"> -->
		         <div id="wrapper" class="list-block media-list" style="margin:-2.2rem 0;border-width:0px;    padding-top: 2.2rem;">
			        <ul id="lbul">
			            
			        </ul>
		    </div>
		<!--         </div> -->
		      </div>
		      </div>
		    </div>
  </div>
</div>
<script>
//         for (var i = 0; i < document.querySelectorAll("#wrapper ul li").length; i++) {
//             document.querySelectorAll("#wrapper ul li")[i].colorfulBg();
//         }
//         refresher.init({
//             id: "wrapper",//<------------------------------------------------------------------------------------┐
//             pullDownAction: Refresh,
//             pullUpAction: Load
//         });
//         var generatedCount = 0;
//         function Refresh() {
//         	alert("下拉");
//             setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
//                 var el, li, i;
//                 el = document.querySelector("#wrapper ul");
//                 el.innerHTML = '';
//                 for (i = 0; i < 11; i++) {
//                     li = document.createElement('li');
//                     li.appendChild(document.createTextNode('async row ' + (++generatedCount)));
//                     el.insertBefore(li, el.childNodes[0]);
//                 }
//                 wrapper.refresh();/****remember to refresh after  action completed！ ---yourId.refresh(); ----| ****/
                
//             }, 1000);

//         }

//         function Load() {
//         	alert("上拉");
//             setTimeout(function () {// <-- Simulate network congestion, remove setTimeout from production!
//                 var el, li, i;
//                 el = document.querySelector("#wrapper ul");
//                 for (i = 0; i < 2; i++) {
//                     li = document.createElement('li');
//                     li.appendChild(document.createTextNode('async row ' + (++generatedCount)));
//                     el.appendChild(li, el.childNodes[0]);
//                 }
//                 wrapper.refresh();/****remember to refresh after action completed！！！   ---id.refresh(); --- ****/
                
//             }, 1000);
//         }
        
        
        
    </script>
    </div>
</body>

</html>
