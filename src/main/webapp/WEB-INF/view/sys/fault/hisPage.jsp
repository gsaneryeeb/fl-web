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
		if($("#_name").val()==""){
			alert("故障现象名称为必填");
			bl=false;
			$("#_name").focus();
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

</script>
<div class="panel panel-default div_screen">
			<form id="searchForm"
				action="${pageContext.request.contextPath}/sys/fault/hisPage"
				method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input
					type="hidden" name="pageSize" id="_pageSize" value="10">
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
							<td style="width: 25%;">故障现象名称: <input name="search_LIKE_name"
								value="${search_LIKE_name }" class="input-control"></td>
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
			<td width="92%" style="padding-left: 10px">故障现象列表
			</td>
			<td>
				<button id="_newBtn" class="btn btn-primary btn-sm" url="${pageContext.request.contextPath}/sys/fault/new" modal="modal">
					<span class="glyphicon glyphicon-plus"></span>新增
				</button>
			</td>
		</tr>
	</table>
	<table
		class="table  table-striped table-bordered table-hover table-condensed active">
		<thead>
			<tr>
				<th class="table_screentitle">故障现象名称</th>
				<th class="table_screentitle">故障现象编号</th>
				<th class="table_screentitle">状态</th>
				<th class="table_screentitle" width="9%">操作</th>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td><a name='_showBtn' href="javascript:void(0)" url="${pageContext.request.contextPath}/sys/fault/${t.id}">${t.name}</a></td>
				<td>${t.no}</td>
				<td>
					<c:choose>
						<c:when test="${t.flag==1}"> 启用 </c:when>
						<c:when test="${t.flag==0}"> 停用</c:when>
					</c:choose></td>
				<td><a name="_upBtn" href="javascript:void(0)" url="${pageContext.request.contextPath}/sys/fault/edit/${t.id}">修改
				</a> || <a href="javascript:void(0)"
					onclick="del('${pageContext.request.contextPath}/sys/fault/changeFlag?id=${t.id}&flag=${t.flag}')">
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