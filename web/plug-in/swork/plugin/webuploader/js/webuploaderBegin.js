 

//          var divSlideurl="";//存储后台返回大图的地址
				var divSlideurl=new Array();
				i=0;

        //图片上传demo
        jQuery(function () {
            var $ = jQuery,
                    $list = $('#fileList'),
            // 优化retina, 在retina下这个值是2
                    ratio = window.devicePixelRatio || 1,
                   	
                    // 缩略图大小
                    thumbnailWidth = 40* ratio,
                    thumbnailHeight = 40 * ratio,
                    
            // Web Uploader实例
                    uploader;

            // 初始化Web Uploader
            uploader = WebUploader.create({
        
                // 自动上传。
                auto: true,

        		// 文件接收服务端。
       			 server: 'sworkQuesrController.do?upLoad',
                // swf文件路径
                swf: 'plug-in/webuploader/js/Uploader.swf',

              
                // 选择文件的按钮。可选。
                // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                pick: '#filePicker',

                // 只允许选择文件，可选。
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png',
                    mimeTypes: 'image/*'
                }
            });
            //上传之后

           
            uploader.on('uploadSuccess', function (file, response) {
            	console.log(response);
            	//获取上传图片的返回ID
                if ($("#pid").val() == "") {
//                     $("#pid").val($("#pid").val() + response);
                    $("#pid").val($("#pid").val() + response.attStr);
                } else {
//                     $("#pid").val($("#pid").val() + "," + response);
                    $("#pid").val($("#pid").val() + "," + response.attStr);
                }
                
			                //将后台返回的img地址添加的预览图片模块
			                var s,ss;
			                s=response.files;
			                ss=s.substr(s.indexOf("attach"));
			                $('.slides').append('<li ><div><img class="wuli" src="'+ss+'" width="100%" height=" 390px;"   alt="" /></div></li>');
			                //存储预览图片的地址
//			                if(divSlideurl==""){
//			                	divSlideurl=ss;
//			                }else{
//			                	divSlideurl=divSlideurl+","+ss;
//			                }
			                
			                
			                if(divSlideurl==null||divSlideurl.length=='0'){
			                	
			                	divSlideurl[i]=ss;
			                }else{
			                	console.log("wwwww:"+ss);
			                	if("" !=ss && ss!=null){
			                	i=i+1;
			                	divSlideurl[i]=ss;
			                	}
			                }
			                $("#divSlideurl").val(divSlideurl);
			                console.log("divSlideurl2:"+divSlideurl.length);
			                console.log("divSlideurl2:"+divSlideurl);
            });
            // 当有文件添加进来的时候
            uploader.on('fileQueued', function (file) {
                var $li = $(
                                '<div id="' + file.id + '" class="file-item thumbnail" onclick="showPicture()">' +
                                '<img>' +
                                '</div>'
                        ),
                        $img = $li.find('img');

                $list.append($li);
                if (file.id == "WU_FILE_3") {
                    $("#fileList").attr("style", "overflow: hidden;width: 100%;margin-top: 10px;margin-left: 14px;");
                } else if (file.id == "WU_FILE_4") {
                    $("#filePicker").attr("style", "display:none");
                }

                // 创建缩略图
                uploader.makeThumb(file, function (error, src) {
                    if (error) {
                        $img.replaceWith('<span>不能预览</span>');
                        return;
                    }

                    $img.attr('src', src);
                }, thumbnailWidth, thumbnailHeight);
            });

        });