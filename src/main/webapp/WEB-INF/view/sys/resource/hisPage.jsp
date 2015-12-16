<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
	function add(url) {
		$("#curdDiv").load(url, function() {
			$("#resourcesModal").modal("show");
		});
	}
	function checkresourcesSave() {
		var bl=true;
		if($("#_name").val()==""){
			alert("资源名称为必填");
			bl=false;
			$("#_name").focus();
			return bl;
		}	
		$.ajax({
			type : "GET",
			url : $("#resourcesForm").attr("action"),
			data : $("#resourcesForm").serialize(),
			dataType : "json",
			beforeSend : function() {
				$("#loading").show();
			},
			success : function(msg) {
				if (msg.result == "success") {
					$("#loading").hide();
					$("#resourcesModal").modal("hide");
					$("#globalSuccessDiv > strong").html("操作成功");
					$("#globalSuccessDiv").slideDown();
					setTimeout(function() {
						location.reload();
					}, 2000);
				} else {
					$("#loading").hide();
					$("#resourcesModal").modal("hide");
					$("#globalErrorDiv > strong").html("错误=" + msg.ex);
					$("#globalErrorDiv").slideDown();
				}
			}
		});
	}

	function del(delurl) {
		$.ajax({
			type : "GET",
			url : delurl,
			beforeSend : function() {
				$("#loading").show();
			},
			success : function(msg) {
				$("#loading").hide();
				location.reload();
			}
		});
	}
	function update(url) {
		$("#curdDiv").load(url, function() {
			$("#resourcesModal").modal("show");
		});
	}
	function show(url) {
		$("#curdDiv").load(url, function() {
			$("#resourcesModal").modal("show");
		});
	}
	function detail(url) {
		$("#curdDiv").load(url, function() {
			$("#detailModal").modal("show");
		});
	}
</script>
<div class="panel panel-default div_screen">
			<form id="searchForm"
				action="${pageContext.request.contextPath}/sys/resource/hisPage"
				method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input
					type="hidden" name="pageSize" id="_pageSize" value="10">
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
							<td style="width: 25%;">资源名称: <input name="search_LIKE_name"
								id="s_name" value="${search_LIKE_name }" class="input-control"></td>
							<td style="width: 20%;">状态: <select name="search_EQ_flag"
								class="input-control">
									<c:set var="selected2" value=""></c:set>
									<c:set var="selected3" value=""></c:set>
									<c:choose>
										<c:when test="${search_EQ_flag eq '1' }">
											<c:set var="selected2" value="selected"></c:set>
										</c:when>
										<c:when test="${search_EQ_flag eq '0' }">
											<c:set var="selected3" value="selected"></c:set>
										</c:when>
									</c:choose>
									<option value="">全部</option>
									<option value="1" ${selected2}>启用</option>
									<option value="0" ${selected3}>停用</option>
							</select></td>
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
			<th width="92%" style="padding-left: 10px">资源列表</th>
			<td>
				<button class="btn btn-primary btn-sm"
					onclick="add('${pageContext.request.contextPath}/sys/resource/new')">
					<span class="glyphicon glyphicon-plus"></span>新增
				</button>
			</td>
		</tr>
	</table>
	<table
		class="table  table-striped table-bordered table-hover table-condensed active">
		<thead>
			<tr>
				<th class="table_screentitle">资源名称</th>
				<th class="table_screentitle">状态</th>
				<th class="table_screentitle">备注</th>
				<th class="table_screentitle" width="9%">操作</th>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td><a  href="javascript:void(0)" onclick="detail('${pageContext.request.contextPath}/sys/resource/detail?id=${t.id}')">${t.name}</a></td>
				<td><c:choose>
						<c:when test="${t.flag==1}"> 启用 </c:when>
						<c:when test="${t.flag==0}"> 停用</c:when>
					</c:choose></td>
				<td>${t.des}</td>
				<td><a href="javascript:void(0)" onclick="update('${pageContext.request.contextPath}/sys/resource/edit?id=${t.id}')">修改
				</a> || <a href="javascript:void(0)" onclick="del('${pageContext.request.contextPath}/sys/resource/del?id=${t.id}&flag=${t.flag}')"><c:choose>
						<c:when test="${t.flag==0}"> 启用 </c:when>
						<c:when test="${t.flag==1}"> 停用</c:when>
					</c:choose></a>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

<div id="curdDiv"></div>

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