function map(id){
				for(i=0;i<$('nav.bar a').length;i++){
				if(id==i){
					$('nav.bar a')[i].className="tab-item external active"
				}else{
					$('nav.bar a')[i].className="tab-item external"
				}
		}
				if(id=="2"){
					Submitted();
				}if(id=="0"){
					dmp();
				}
				if(id=="3"){
					forum();
				}
				if(id=="4"){
					personal();
				}
				if(id=="1"){
					
					showNews();
				}
	}
	//投诉举报
	function Submitted(){
		$.ajax({
			async : false,
				url :"SworkPublicController.do?publichome" , // 跨域URL
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
	}
	//地图
	function dmp(){
		$.ajax({
			async : false,
				url :"SworkPublicController.do?publicMap" , // 跨域URL
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
	}
	//社区论坛
	function forum(){
		startNum=1;
		$.ajax({
			async : false,
				url :"SworkShareController.do?shareForum" , // 跨域URL
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
		setTimeout(jz(),2000);
		setTimeout(initial(),2100);
		
	}
	//社区论坛标签也点击方法
	function forumMap(id,post_typeid){
		for(i=0;i<$('div.buttons-tab a').length;i++){
			if(id==i){
				$('div.buttons-tab a')[i].className="tab-link active button"
					posttypeid=post_typeid;
				refresh();
// 				$('div.tabs div.tab')[i].className="tab active";
			}else{
				$('div.buttons-tab a')[i].className="tab-link  button"
// 					$('div.tabs div.tab')[i].className="tab"; 
			}
	}
			
	}
	//发布帖子点击方法
	function post(){
		$.ajax({
			async : false,
				url :"SworkShareController.do?sharePost" , // 跨域URL
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
	}
	//点击回帖 rpost(\''+POST_ID+'\',\''+POST_SUBJECT_NAME+'\',\''+POST_RPT_USER_NAME+'\',\''+POST_RPT_TIME+'\',\''+POST_TYPE_NAME+'\')
	function rpost(id,post_subject_name,post_rpt_user_name,post_rpt_time,post_type_name,post_type_id,post_content){
		postidq=id;
		posttypeid=post_type_id;
		$.ajax({
			async : false,
				url :"SworkShareController.do?shareReplypost" , // 跨域URL
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
		replyrefresh();
		setTimeout(replyjz(),2000);
		setTimeout(function(){
			var html="";
			html+='<li>'
			html+='<div class="item-inner">'
			html+='<div class="item-subtitle" style="padding: 7px 10px;color: #5183E2">'+post_subject_name+'</div>'
			html+='<div class="item-title-row">'
			html+='<div class="item-title" style="display:inline;font-size:14px">'
			html+='<ul style="text-align: center;"><li style="display: inline-block;padding: 0px 10px;float: left;">'+post_rpt_user_name+'</li><li style="display: inline-block;">'+post_rpt_time+'</li><li style="display: inline-block;float: right;">'+post_type_name+'</li></ul></div>'
//			html+='<div class="item-title" style="display:inline;padding:0px 10px ;font-size:14px;color: #5183E2;float:right">'+post_type_name+'</div>'
			html+='</div>'
			html+='<div class="item-subtitle" style="padding: 7px 10px;font-size:17px;color: #5183E2">'+post_content+'</div>'
			html+='</div>'
			html+='</li>'
		$("#postxx").append(html);
		},100);
		//setTCimeout(replyinitial(),2100);
	}
	//个人中心
	function personal(){
		$.ajax({
			async : false,
				url :"SworkPublicController.do?publicCore" , // 跨域URL
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
	}
	//回复帖子评论提交
	function replysubmit(){
		var post_reply_content=$("#post_reply_content").val();
		var  data ={"post_reply_content":encodeURI(post_reply_content),"postid":postidq,"post_type_id":posttypeid};
		$.ajax({
				  
				url :"SworkShareController.do?shareFrom" , // 跨域URL
				type : 'get',
				data:data,
				timeout : 4000, 
				success : function(datas){
					var result = eval("(" + datas + ")"); 
					alert(result.msg);
					if(result.msg=="操作成功"){
					$("#post_reply_content").val("");
					 replyrefresh();
					}
				},
				complete : function(XMLHttpRequest, textStatus) {
				},
				error : function(xhr) {
					//jsonp 方式此方法不被触发
					//请求出错处理 
				}
			});
	}
	//新增帖子提交方法
	function poatsubmit(){
		var post_subject_name=$("#post_subject_name").val();
		var psot_type_id=$("#psot_type_id").val();
		var post_content=$("#post_content").val();
		var  data ={"post_subject_name":encodeURI(post_subject_name),"psot_type_id":psot_type_id,"post_content":encodeURI(post_content)};
		$.ajax({
				url :"SworkShareController.do?poatsubmit" , // 跨域URL
				type : 'get',
				data:data,
				timeout : 4000, 
				success : function(datas){
					var result = eval("(" + datas + ")"); 
// 					 $.alert('Here goes alert text');
					alert(result.msg);
					if(result.msg=="操作成功"){
						$("#post_subject_name").val("");
						$("#psot_type_id").val("");
						$("#post_content").val("");
					}
				},
				complete : function(XMLHttpRequest, textStatus) {
				},
				error : function(xhr) {
					//jsonp 方式此方法不被触发
					//请求出错处理 
				}
			});
	}
	//投诉举报提交
	function  chomesubmit(){
		var case_desc=$("#questDesc").val();
		var case_pos_desc=$("#spaceDesc").val();
		var rpt_attch=$("#pid").val();
		var  data ={"case_desc":encodeURI(case_desc),"rpt_attch":rpt_attch,"case_pos_desc":encodeURI(case_pos_desc)};
		$.ajax({
				url :"SworkPublicController.do?publicForm" , // 跨域URL
				type : 'get',
				data:data,
				timeout : 4000, 
				success : function(datas){
					var result = eval("(" + datas + ")"); 
// 					 $.alert('Here goes alert text');
					alert(result.msg);
					if(result.msg=="操作成功"){
						$("#questDesc").val("");
						$("#spaceDesc").val("");
						$("#pid").val("");
					}
				},
				complete : function(XMLHttpRequest, textStatus) {
				},
				error : function(xhr) {
					//jsonp 方式此方法不被触发
					//请求出错处理 
				}
			});
	}
	//新闻列表
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