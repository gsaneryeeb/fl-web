<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/screen_index.css" />
<script>
	function search(id) {
		$("#searchForm").submit();
	}
	$(function(){
		$("#refreshBtn").click(function(){
			$("#searchForm :input").val("");
			$("#searchForm").submit();
		});
	});

	function checkSave() {
		var bl=true;
		if($("#_userNo").val()==""){
			alert("员工编号为必填");
			bl=false;
			$("#_userNo").focus();
			return bl;
		}
		return bl;
	}

	function del(delurl) {
		$.ajax({
			type : "GET",
			url : delurl,
			beforeSend : function() {
				$("#loading").show();
			},
			success : function(msg) {
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
	}
	var setting = {  
			check: {
				enable: true,
				chkStyle: "checkbox",
				chkboxType: { "Y": "ps", "N": "ps" }
			},
			data: {
				simpleData: {
					enable: true
				}
			}
	};
	function add(url) {
		$("#_curdDiv").load(url, function() {
			$("#_operModal").modal("show");
			$("#saveBtn").click(function(){
				checkroleSave('save');
			});
			$("#tree").load("${pageContext.request.contextPath}/sys/user/getProjects",function(msg){
				$.fn.zTree.init($("#tree"), setting, eval(msg));
			});
			$("#tree_role").load("${pageContext.request.contextPath}/sys/user/getRoles",function(msg){
				$.fn.zTree.init($("#tree_role"), setting, eval(msg));
			});
		});
	}
	function checkroleSave(method) {
		var bl=true;
		if($("#_userNo").val()==""){
			alert("员工编号为必填");
			bl=false;
			$("#_userNo").focus();
			return bl;
		}
		if($("#_userName").val()==""){
			alert("登录账户为必填");
			bl=false;
			$("#_userName").focus();
			return bl;
		}
		if($("#_uPass").val()==""){
			alert("登录密码为必填");
			bl=false;
			$("#_uPass").focus();
			return bl;
		}
		if($("#_uPass").val().length<6 || $("#_uPass").val().length>12){
			alert("登录密码范围在6到12位之间.");
			bl=false;
			$("#_uPass").focus();
			return bl;
		}
		var treeObj = $.fn.zTree.getZTreeObj("tree");
		var nodes = treeObj.getCheckedNodes(true);
		var resourcesIds="";
		$(nodes).each(function(i){
			resourcesIds+=nodes[i].id+",";
		});
		if(resourcesIds!=""){
			resourcesIds=resourcesIds.substring(0,resourcesIds.length-1);
		}
		$("#ids").val(resourcesIds);
		
		//Roles
		var treeRoleObj = $.fn.zTree.getZTreeObj("tree_role");
		var nodesRole = treeRoleObj.getCheckedNodes(true);
		var rIds="";
		$(nodesRole).each(function(i){
			rIds+=nodesRole[i].id+",";
		});
		if(rIds!=""){
			rIds=rIds.substring(0,rIds.length-1);
		}
		$("#roleIds").val(rIds);
		$.ajax({
			type : "GET",
			url : $("#_operForm").attr("action")+"/"+method,
			data : $("#_operForm").serialize(),
			dataType : "json",
			beforeSend : function() {
				$("#loading").show();
				$("#_operModal").modal("hide");
			},
			success : function(msg) {
				$("#loading").hide();
				if (msg.result == "success") {
					$("#globalSuccessDiv > strong").html("操作成功");
					$("#globalSuccessDiv").slideDown();
					setTimeout(function() {
						location.reload();
					}, 2000);
				} else {
					$("#globalErrorDiv > strong").html("错误=" + msg.ex);
					$("#globalErrorDiv").slideDown();
					setTimeout(function() {
						$("#globalErrorDiv").hide();
					}, 5000);
				}
			}
		});
	}
	function update(url,id) {
		$("#_curdDiv").load(url, function() {
			$("#_operModal").modal("show");
			$("#saveBtn").click(function(){
				checkroleSave('update');
			});
			$("#tree").load("${pageContext.request.contextPath}/sys/user/getProjects?id="+id,function(msg){
				$.fn.zTree.init($("#tree"), setting, eval(msg));
			});
			$("#tree_role").load("${pageContext.request.contextPath}/sys/user/getRoles?id="+id,function(msg){
				$.fn.zTree.init($("#tree_role"), setting, eval(msg));
			});
		});
	}
	function show(url,id) {
		$("#_curdDiv").load(url, function() {
			var settingDetail = {
					check: {
						enable: true,
						chkDisabledInherit: true
					},
					data: {
						simpleData: {
							enable: true
						}
					}
			};
			$("#_detailModal").modal("show");
			$("#tree").load("${pageContext.request.contextPath}/sys/user/getProjects?id="+id,function(msg){
				var treeObj=$.fn.zTree.init($("#tree"), settingDetail, eval(msg));
				var nodes = treeObj.getNodes();
				for (var i=0, l=nodes.length; i < l; i++) {
					treeObj.setChkDisabled(nodes[i], true);
				}
			});
			$("#tree_role").load("${pageContext.request.contextPath}/sys/user/getRoles?id="+id,function(msg){
				var treeObj=$.fn.zTree.init($("#tree_role"), settingDetail, eval(msg));
				var nodes = treeObj.getNodes();
				for (var i=0, l=nodes.length; i < l; i++) {
					treeObj.setChkDisabled(nodes[i], true);
				}
			});
		});
	}
</script>
<div class="panel panel-default div_screen">
			<form id="searchForm"
				action="${pageContext.request.contextPath}/sys/user/hisPage"
				method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input
					type="hidden" name="pageSize" id="_pageSize" value="10">
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
							<td style="width: 25%;">员工编号: <input name="search_LIKE_userNo"
								id="s_userName" value="${search_LIKE_userNo }" class="input-control"></td>
							<td style="width: 25%;">员工姓名: <input name="search_LIKE_uName"
								id="s_userName" value="${search_LIKE_uName }" class="input-control"></td>
							<td align="right">
								<button class="btn btn-primary btn-sm"
									onclick="search('#searchTable')">
									<span class="glyphicon glyphicon-search"></span>查询
								</button>
																<button id="refreshBtn" type="button"
									class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-repeat"></span>刷新
								</button>
							</td>
						</tr>
					</table>
				</div>
			</form>
</div>
<div id="initStaffsHis" class="panel panel-default div_screen">
	<!-- Default panel contents -->
	<table style="width: 100%;" frame="below" bordercolorlight="#f5f5f5"
		class="panel-heading">
		<tr bgcolor="#f5f5f5" height="35px">
			<td width="92%" style="padding-left: 10px">用户列表
			</td>
			<td>
				<button class="btn btn-primary btn-sm"
					onclick="add('${pageContext.request.contextPath}/sys/user/new')">
					<span class="glyphicon glyphicon-plus"></span>新增
				</button>
			</td>
		</tr>
	</table>
	<table
		class="table  table-striped table-bordered table-hover table-condensed active">
		<thead>
			<tr>
				<th class="table_screentitle">员工编号</th>
				<th class="table_screentitle">姓名</th>
				<th class="table_screentitle">电话</th>
				<th class="table_screentitle">状态</th>
				<th class="table_screentitle" width="9%">操作</th>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td><a href="javascript:void(0)" onclick="show('${pageContext.request.contextPath}/sys/user/${t.id}','${t.id }')">${t.userNo}</a></td>
				<td>${t.uName}</td>
				<td>${t.tel}</td>
				<td>
					<c:choose>
						<c:when test="${t.flag==1}"> 启用 </c:when>
						<c:when test="${t.flag==0}"> 停用</c:when>
					</c:choose></td>
				<td>
				<a href="javascript:void(0)" onclick="update('${pageContext.request.contextPath}/sys/user/edit?id=${t.id}','${t.id }')">修改</a> 
				|| <a href="javascript:void(0)"
					onclick="del('${pageContext.request.contextPath}/sys/user/changeFlag?id=${t.id}&flag=${t.flag}')">
					<c:choose>
						<c:when test="${t.flag==0}"> 启用 </c:when>
						<c:when test="${t.flag==1}"> 停用</c:when>
					</c:choose>
					</a></td>
			</tr>
		</c:forEach>
	</table>
</div>

<div id="_curdDiv"></div>

<jsp:include page="../../common/pageHis.jsp" />
<jsp:include page="../../common/bottom.jsp" />
<script>
	function goPageHis(size, page, accessPath, totalPage) {
		var reg = new RegExp("^[0-9]*$");
		if (!reg.test(page)) {
			alert("请输入正确的数字");
			return;
		}
		if (page - totalPage > 0) {
			page = totalPage;
		}
		$("#_page").val(page - 1);
		$("#_pageSize").val(size);
		$("#searchForm").submit();
	}
</script>