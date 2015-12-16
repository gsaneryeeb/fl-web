<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/screen_index.css" />

<div id="initStaffsHis" class="panel panel-default div_screen" style="height:385px; overflow:scroll;">
	<!-- Default panel contents -->
	<table class="table  table-striped table-bordered table-hover table-condensed active" >
		<thead>
			<tr>
				<th class="table_screentitle">序号</th>
				<th class="table_screentitle">服务站名称</th>
				<th class="table_screentitle">未还备件数</th>
			</tr>
		</thead>
		<c:forEach items="${RETURN_MAP}" var="t" varStatus="index">
			<tr align="center">
				<td>${index.index+1}</td>
				<td>${t.key}</td>
				<td>${t.value}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="3" align="right" style="padding-right: 60px;"><font style="font-size: 2;"><b>合计:${size }</b></font></td>
		</tr>
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
