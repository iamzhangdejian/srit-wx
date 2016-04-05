<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>问题类别</title>
<!--     <link href="plug-in/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="../../../plug-in/sworkWexin/css/weui.css"/>
    <link rel="stylesheet" href="../../../plug-in/sworkWexin/css/example.css"/>
   <script src="../../../plug-in/jquery/jquery-1.8.0.min.js"></script>
</head>
<body>
<form name=childCheck action="../../../sworkQuesrController.do?choiceType" method="post"> 

<!-- <input type=text name="questId" id="questId" value="">  -->
<input class="weui_input" type="number" pattern="[0-9]*" name="questId" placeholder="请输入号码"/>
<input class="weui_btn weui_btn_primary" href="javascript:" type="submit" id="showTooolPhone"></input>
</form> 
</body>
</html>