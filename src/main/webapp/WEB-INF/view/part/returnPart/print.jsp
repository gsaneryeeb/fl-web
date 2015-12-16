<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	function search(id) {
		$("#searchForm").submit();
	}
	$(function(){
		$("#refreshBtn").click(function(){
			$("#searchForm :input").val("");
			$("#searchForm").submit();
		});
		$("a[name='showBtn']").click(function(){
			$("#_curdDiv").load($(this).attr("url"),function(){
				$("#_detailModal").modal("show");	
			});
		});
	});
	
</script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/screen_index.css" />
<form id="searchForm" action="${pageContext.request.contextPath}/part/returnPart/print" method="get">
	<table style="width: 100%;" id="searchTable">
		<tr>
			<td style="width: 25%;">CallNo: <input name="search_LIKE_callNo" id="s_callNo" value="${search_LIKE_callNo }" class="input-control"></td>
			<td style="width: 25%;">打印单号: <input name="search_LIKE_printNo" id="s_printNo" value="${search_LIKE_printNo}" class="input-control"></td>
			<td align="right">
				<button class="btn btn-primary btn-sm"  onclick="search('#searchTable')">
					<span class="glyphicon glyphicon-search"></span>查询
				</button>
				<button id="refreshBtn" type="button" class="btn btn-primary btn-sm">
					<span class="glyphicon glyphicon-repeat"></span>刷新
				</button>
			</td>
		</tr>
	</table>
</form>
<div id="initStaffsHis" class="panel panel-default div_screen" style="height:385px; overflow:scroll;">
	<!-- Default panel contents -->
	<table class="table  table-striped table-bordered table-hover table-condensed active" >
		<thead>
			<tr>
				<th class="table_screentitle">序号</th>
				<th class="table_screentitle">打印单号</th>
				<th class="table_screentitle">CallNo</th>
				<th class="table_screentitle">操作</th>
			</tr>
		</thead>
		<c:forEach items="${t}" var="t" varStatus="index">
			<tr align="center">
				<td>${index.index+1}</td>
				<td>${t.printNo}</td>
				<td>${t.callno}</td>
				<th><a name="showBtn" url="${pageContext.request.contextPath}/part/returnPart/detailShow?id=${t.id}">明细</a></th>
			</tr>
		</c:forEach>
	</table>
</div>

<div id="_curdDiv"></div>
<div id="_partsDiv"></div>
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
