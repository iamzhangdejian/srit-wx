<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>新闻详细内容</title>
    <link rel="stylesheet" href="plug-in/swork/default/css/weui.css"/>
    <link rel="stylesheet" href="plug-in/swork/default/css/example.css"/>
    <script src="plug-in/jquery/jquery-1.11.2.min.js"></script>
    <script type="text/javascript">
		$(function(){
        var lr=${a};
		$(".page_title").html(lr[0].news_title);
		$("#subtitle").html(lr[0].news_subtitle);
		var newsPicture="http://192.168.1.33:8099/sritplat-mserver/"+lr[0].news_attachment;
		$("#imageNews").attr("src",newsPicture);
		$('p').html(lr[0].news_content);
// 		var lrs=JSON.parse(lr);
		console.info(lr);
// 		console.info(lr[0].news_title)
// 		var lrs=eval('(' + lr + ')');;
// 		alert(lrs.news_subtitle);
		}); 
	</script>
</head>
<body>
<div class="hd">
    <h1 class="page_title" style="max-width: 100%"> </h1>
</div>
<div class="bd">
    <article class="weui_article">
        <h1 id="subtitle"></h1>
        <section>
<!--             <h2 class="title">章标题</h2> -->
            <section>
<!--                 <h3>1.1 节标题</h3> -->
<!--                 <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod -->
<!--                     tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, -->
<!--                     quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo -->
<!--                     consequat. Duis aute</p> -->
<!--                 <p> -->
                    <img id="imageNews" src="" alt="" style="max-width: 100%">
<!--                     <img src="./images/pic_article.png" alt=""> -->
                </p>
            </section>
            <section>
                <p></p>
            </section>
        </section>
    </article>
</div>

</body>

</html>