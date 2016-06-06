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
					 	
//					          alert(JSON.stringify(res));
					 		var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
					 		var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
					 		var wz=longitude+","+latitude;
					 		$("#spaceDesc").val(wz);
//					          $("#spaceDesc").val=JSON.stringify(res);
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
//					 	        alert("images.localId"+images.localId);
//					 	        alert('已选择 ' + res.localIds.length + ' 张图片');
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
//					  	        	isShowProgressTips: 1, // 默认为1，显示进度提示
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
//					 			            $("#pid").val($("#pid").val() + response);
					 			           $("#pid").val($("#pid").val() + atr);
					 			           //alert( $("#pid").val());
					 			       } else {
//					 			            $("#pid").val($("#pid").val() + "," + response);
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
		posttypeid="";
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
					if(post_typeid=="全部"){
						posttypeid="";
					}else{
						posttypeid=post_typeid;
					}
					
				$('#lbul li').remove();
	        	startNum=1;
	        	initial();
// 				$('div.tabs div.tab')[i].className="tab active";
			}else{
				$('div.buttons-tab a')[i].className="tab-link  button"
// 					$('div.tabs div.tab')[i].className="tab"; 
			}
	}
			
	}
	//历史记录条件查询
	function hisMap(id,casestatusid){
		for(i=0;i<$('div.buttons-tab a').length;i++){
			if(id==i){
				$('div.buttons-tab a')[i].className="tab-link active button"
					case_status_id=casestatusid;
				$('#historyul li').remove();
	        	hisstartNum=1;
	        	hisinitial();
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
				url :"sworkUserController.do?showuser" , // 跨域URL
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
					Show(result.msg);
					
					if(result.msg=="操作成功"){
					$("#post_reply_content").val("");
					 replyrefresh();
//					 openLogin();
//					 setTimeout("closeLogin()",2000);
					 
					}else{
//						openshib()
//						setTimeout("closeLoginshib()",2000);
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
		if(post_subject_name =="" || post_subject_name==null || post_subject_name==undefined){
			Show("标题不能为空!");
			
				$("#post_subject_name").focus();
			
			return;
		}
		var psot_type_id=$("#psot_type_id").val();
		var post_content=$("#post_content").val();
		if(post_content =="" || post_content==null || post_content==undefined){
			Show("内容不能为空!");
			
				$("#post_content").focus();
			
			return;
		}
		var  data ={"post_subject_name":encodeURI(post_subject_name),"psot_type_id":psot_type_id,"post_content":encodeURI(post_content)};
		$.ajax({
				url :"SworkShareController.do?poatsubmit" , // 跨域URL
				type : 'get',
				data:data,
				timeout : 4000, 
				success : function(datas){
					var result = eval("(" + datas + ")"); 
// 					 $.alert('Here goes alert text');
					if(result.msg=="操作成功"){
						$("#post_subject_name").val("");
						$("#psot_type_id").val("");
						$("#post_content").val("");
//						openLogin();
//						 setTimeout("closeLogin()",2000);
						Show("操作成功");
					}else{
						Show("操作失败");
//						openshib()
//						setTimeout("closeLoginshib()",2000);
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
					//console.log(datas);
					var result = eval("(" + datas + ")"); 
// 					 $.alert('Here goes alert text');
//					console.log(result);
					if(result=="1"){
						$("#questDesc").val("");
						$("#spaceDesc").val("");
						$("#pid").val("");
						Show("操作成功");
//						openLogin();
//						 setTimeout("closeLogin()",2000);
					}else{
						Show("操作失败");
//						openshib()
//						setTimeout("closeLoginshib()",2000);
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
		newstartNum = 1
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
//	历史记录页面加载方法
	function hisop(){
		case_status_id="00";
		$.ajax({
			async : false,
				url :"SworkPublicController.do?publiHistory" , // 跨域URL
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
		setTimeout(hisjz(),2000);
		setTimeout(hisinitial(),2100);
	}
//	历史记录详细信息
	function showrecordinfo(case_desc,case_pos_desc,img){
		$.ajax({
			async : false,
				url :"SworkPublicController.do?recordinfo" , // 跨域URL
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
		var htmls="";
		// var images="http://tzezt.bjtzh.gov.cn/Image/"+case_pos_desc
			setTimeout(document.getElementById("questDesc").value=case_desc,5000);
			setTimeout(document.getElementById("spaceDesc").value=case_pos_desc,5000);
			var imagesUrl=img.split(",");
			for ( var i = 0; i < imagesUrl.length; i++) {
			var pictureImageUrl=imagesUrl[i];
				htmls+='<li class="weui_uploader_file" onclick="showPictureF(\''+pictureImageUrl+'\')" style="background-image:url('+pictureImageUrl+')"></li>';
			};
			if(htmls!=null && htmls!=""){
				$(".weui_uploader_files").append(htmls);
				
			}
	}
//	提示框
	function openLogin(){  
		document.getElementById("win").style.display=""; 
		document.getElementById("back").style.display="";
		}
	function closeLogin(){  
		document.getElementById("win").style.display="none"; 
		document.getElementById("back").style.display="none";
		}
	function openshib(){  
		document.getElementById("wins").style.display=""; 
		document.getElementById("back").style.display="";
		}
	function closeLoginshib(){  
		document.getElementById("wins").style.display="none"; 
		document.getElementById("back").style.display="none";
		}