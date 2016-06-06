<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <title>新闻列表</title>
	<link rel="stylesheet" href="plug-in/swork/plugin/sui/css/reset.css" />
    <link rel="stylesheet" href="plug-in/swork/plugin/sui/css/pullToRefresh.css" />
	<script src="plug-in/swork/plugin/sui/js/iscroll.js"></script>
	<script src="plug-in/swork/plugin/sui/js/pullToRefresh.js"></script>
	<script src="plug-in/swork/plugin/sui/js/colorful.js"></script>
	<script src="plug-in/swork/main/cityNews.js"></script>					
  	<link href="plug-in/swork/plugin/sui/css/sm.min.css" rel="stylesheet">
  <script type="text/javascript" src="plug-in/swork/tasklist/js/jquery.min.js"></script>
</head>

<body>
<!--  <div class="page"> -->
  
  <nav class="bar bar-tab">
  
  <a class="tab-item external active" href="javascript:void(0)" >
  </a>
  
</nav>
  <div class="content" id="divid">

  </div>
<!-- </div> -->

</body>
<script type="text/javascript">

$.ajax({
	async : false,
		url :"SworkPublicController.do?publicNews" , // 跨域URL
		type : 'get',
		timeout : 4000, 
		success : function(datas){
			//$('#divid').load("https://www.baidu.com/");
			 document.getElementById("divid").innerHTML=datas;
			 showNews();
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

	
	//新闻
	function showNews(){
		$.ajax({
			async : false,
				url :"SworkPublicController.do?publicNews" , // 跨域URL
				type : 'get',
				timeout : 4000, 
				success : function(datas){
					 document.getElementById("divid").innerHTML=datas;
				},
				complete : function(XMLHttpRequest, textStatus) {
				},
				error : function(xhr) {
					//jsonp 方式此方法不被触发
					//请求出错处理 
				}
			});
		setTimeout(newsJz(),2000);
		setTimeout(initialNews(),2100);
	}
	
	
</script>

</html>
