$(function(){
	
	$(".close").click(function(){
		$(this).parent().slideUp();
	});
	
    $.ajaxSetup({   
        contentType:"application/x-www-form-urlencoded;charset=utf-8",
        timeout:15000,
        cache:false,
        beforeSend:function(xmlHttpRequest){
        	$("#loading").show();
        },
        complete:function(xmlHttpRequest,textStatus){   
        	$("#loading").hide();
	        var sessionstatus=xmlHttpRequest.getResponseHeader("sessionstatus"); //通过XMLHttpRequest取得响应头，sessionstatus，
	        if(sessionstatus=="timeout"){
	        	var baseurl=location.protocol+"//"+location.host+"/"+location.pathname.split("/")[1] + "/sys/logout";
	        	var msg="当前会话失效,请<a href='"+baseurl+"'>重新登录</a>";
	        	$("#globalErrorDiv > strong").html(msg);
	        	$("#globalErrorDiv").slideDown();
	        }   
        },
        error:function(XMLHttpRequest,errorInfomation,excptionObject){
        	if(errorInfomation!=null){
        		if(errorInfomation == "timeout"){
        			$("#globalErrorDiv > strong").html("请求超时");
        		}else if(errorInfomation == "error"){
        			$("#globalErrorDiv > strong").html("请求出错");
        		}
        	}
			 $("#globalErrorDiv").slideDown();
        }
      });  
	//新增
	$("#_newBtn").click(function(){
		var fuc=(typeof($(this).attr("fuc"))=="undefined" || $(this).attr("fuc")=="")?"":"?_fuc="+$(this).attr("fuc");
		if("modal"==$(this).attr("modal")){
			$("#_curdDiv").load($(this).attr("url")+fuc,function(){
				$("#_operModal").modal("show");	
			});
		}else{
			window.location.href=$(this).attr("url");
		}
	});
	
	$("#_operModal").on('hidden.bs.modal', function (e) {
		$("#_curdDiv").text("");		
	});
	
	$("button[name='_delBtn']").click(function(){
		$(this).attr("disabled","disabled");
		$.ajax({
			type: "DELETE",
			url:  $(this).attr("url"),
			beforeSend:function(){
				$("#loading").show();
			},
			error:function(XMLHttpRequest,textStatus,textStatus){
				 alert("通信错误="+XMLHttpRequest.status);
			},
			success: function(msg){
				if(msg.result=="success"){
					location.reload();
				}else{
					$("#loading").hide();
					$("#globalErrorDiv > strong").html("错误="+msg.ex);
					$("#globalErrorDiv").slideDown();
				}
			}
		});
	});
	
	$("button[name='_upBtn']").click(function(){
		var fuc=(typeof($(this).attr("fuc"))=="undefined" || $(this).attr("fuc")=="")?"":"?_fuc="+$(this).attr("fuc");
		$("#_curdDiv").load($(this).attr("url")+fuc,function(){
			$("#_operModal").modal("show");	
		});
	});
	
	$("a[name='_upBtn']").click(function(){
		var fuc=(typeof($(this).attr("fuc"))=="undefined" || $(this).attr("fuc")=="")?"":"?_fuc="+$(this).attr("fuc");
		$("#_curdDiv").load($(this).attr("url")+fuc,function(){
			$("#_operModal").modal("show");	
		});
	});
	
	$("a[name='_showBtn']").click(function(){
		$("#_curdDiv").load($(this).attr("url"),function(){
			$("#_detailModal").modal("show");	
		});
	});
	
	$("#_detailModal").on('close.bs.modal', function (e) {
		$("#_curdDiv").text("");
	});
	
	$(document).delegate("#_saveBtn","click",function(){
		$(this).attr("disabled","disabled");
		if(""!=$(this).attr("checkFuc")){
			var method = new dynamicMethod($(this).attr("checkFuc"));
			var result=method.func();
			if(!result || result=="false"){
				$(this).removeAttr("disabled");
				return;
			}			
		}
		$.ajax({
			type: $("#_operForm").attr("method"),
			url: $("#_operForm").attr("action"),
			beforeSend:function(){
				$("#loading").show();
				$("#_operModal").modal("hide");
			},error:function(XMLHttpRequest,textStatus,textStatus){
				 alert("通信错误="+XMLHttpRequest.status);
			},
			data: $("#_operForm").serialize(),
			success: function(msg){
				$("#loading").hide();
				if(msg.result=="success"){
					$("#globalSuccessDiv > strong").html("操作成功");
					$("#globalSuccessDiv").slideDown();
					setTimeout(function () {
						location.reload();
					},2000);
				}else{
					$("#globalErrorDiv > strong").html("错误="+msg.ex);
					$("#globalErrorDiv").slideDown();
					setTimeout(function () {
						$("#globalErrorDiv").hide();
					},5000);
				}
			}
		});
	});
	$("#todo_img").click(function(){			
		$("#todo_colse").show();
		$("#todoMenu").show("slow");
		$("#todo_img").hide();
	});
	$("#todo_colse").click(function(){			
			$("#todo_img").show();
			$("#todo_colse").hide();
			$("#todoMenu").hide("slow");
	});
});

function dynamicMethod(methodName){
	this.func = function(){};
	try{
		this.func = eval(methodName);
	}catch(e){
		alert("找不到"+methodName+"()这个方法");
	}
}


function goPage(size,page,path,totalPage){
	var reg=new RegExp("^[0-9]*$");
	if(!reg.test(page)){
		alert("请输入正确的数字");
		return ;
	}
	if(page-totalPage>0){
		page=totalPage;
	}
	var relpath=path+"?page="+page+"&size="+size;
	window.location.href=relpath;
}

function showDownMenu(menu_name){
	if($(menu_name).css("display") == "none"){
		$(menu_name).slideDown(500,function(){
			$(this).prev().find(".glyphicon").first().removeClass("glyphicon-chevron-down");
			$(this).prev().find(".glyphicon").first().addClass("glyphicon-chevron-up");
		});
	}else{
		$(menu_name).slideToggle(500,function(){
			$(this).prev().find(".glyphicon").first().addClass("glyphicon-chevron-down");
			$(this).prev().find(".glyphicon").first().removeClass("glyphicon-chevron-up");
		});
	}		
}
function showDownMenu2(menu_name){
	if($(menu_name).css("display") == "none"){
		$(menu_name).slideDown();
	}else{
		$(menu_name).slideUp();
	}
}
function showAjaxBeanMsg(data){
	if(data.message!=""){
		if(data.result=="success"){
	        $("#globalSuccessDiv > strong").html(data.message);
	        $("#globalSuccessDiv").slideDown().delay(1000).fadeOut();
		}else{
	        $("#globalErrorDiv > strong").html(data.message);
	        $("#globalErrorDiv").slideDown();
		}
	}
}
