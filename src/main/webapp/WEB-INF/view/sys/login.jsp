<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="../common/meta.jsp"/>
<jsp:include page="../common/taglibs.jsp"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/screen_login.css"/>
<script>
	$(function(){
		var options={
				animation:true, 
				trigger:"hover" //触发tooltip的事件
		}
		$("#username").tooltip(options);
		$("#password").tooltip(options);
		
		
		$("#username").focus(function(){
			$('#errorAlert').popover("hide");	
		});
		$("#password").focus(function(){
			$('#errorAlert').popover("hide");	
		});
		$("#loginForm").submit(function(){
			if($("#username").val().trim()=="" || $("#password").val().trim()==""){
				$('#errorAlert').attr("data-content","用户名和密码不能为空");
				$('#errorAlert').popover("show");
				return false;
			}
		});
		if("${username}" != ""){
			$('#errorAlert').popover("show");
		}
		$("#login_content").css("height",$(window).height()*0.75+"px");
	}); 
</script>
</head>
<body>
    <!--头部内容开始-->
	
	<!--头部内容结束-->
	<!--中间内容开始-->
	<div id="login_center_rim">
	      <div id="login_bg03">
		      <div id="login_content03">
		      	   <div style="height:420px;background: url('${pageContext.request.contextPath}/static/images/login_banner04.png');width:650px;float:left;margin-left: 0px;margin-top: 50px;">
		      	   </div>
			       <div id="login_content02">
			        <div id="login_title">用户登录</div>				  
					    <fieldset>
					    	<form id="loginForm" method="POST" action="">
					    		<input type="hidden" name="rememberMe" value="true" />
								<div id="errorAlert" data-toggle="popover" data-placement="top" data-content="用户名或密码错误,请重新输入!"></div>
								<div class="input-group">
									<div class="input-group-addon">
										<div class="glyphicon glyphicon-user"></div>
									</div>
									<input type="text" id="username" name="username" data-container="#login_content02" value="${username}" placeholder="账号" class="form-control" data-toggle="tooltip" data-placement="right" data-original-title="请输入账号">
								</div>
									
								<div class="input-group" >
									<div class="input-group-addon">
										<div class="glyphicon glyphicon-lock"></div>
									</div>
									<input type="password" id="password" name="password" data-container="#login_content02" value="" placeholder="密码" class="form-control" data-toggle="tooltip" data-placement="right" data-original-title="请输入密码">
								</div>
								<div class="input-group">
								    <ul class="login_ul">
									    <li class="login_li01"></li>
										<li class="login_li02"></li>
									</ul>								     
								</div>
								
								<div class="input-group" >
									<label class="control-label"></label>
									<!-- Button -->
									<div class="controls" style="text-align:center;">
										<input id="login" class="btn btn-primary" type="submit" value="登录">
									</div>
								</div>
							</form>
						</fieldset>
			       </div>
			  </div>
		  </div>
	</div>
	
</body>

</html>