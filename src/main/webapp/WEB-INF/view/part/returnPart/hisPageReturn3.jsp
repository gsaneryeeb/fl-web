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
		$("#printBtn").click(function(){
			$(".PrintArea").printArea();
		});
	});

</script>
<form id="searchForm" action="${pageContext.request.contextPath}/part/returnPart/hisPageReturn3" method="post">
	<input type="hidden" name="page" id="_page" value="0"> <input type="hidden" name="pageSize" id="_pageSize" value="10">
	<table style="width: 100%;" id="searchTable">
		<tr>
			<td style="width: 20%;">CallNo: <input name="search_LIKE_callno" id="s_callno" value="${search_LIKE_callno }" class="input-control"></td>
			<td style="width: 20%;">服务站: <input name="search_LIKE_station" id="s_station" value="${search_LIKE_station}" class="input-control"></td>
			<td style="width: 35%;">状态: 
				<select name="search_LIKE_status">
					<option></option>
					<c:forEach items="${status }" var="s">
						<option value="${s.key}" <c:if test="${search_LIKE_status==s.key }">selected="selected"</c:if>>${s.value }</option>
					</c:forEach>
				</select>
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
<div id="initStaffsHis" class="PrintArea panel panel-default div_screen" style="height:385px; overflow:scroll;">
	<!-- Default panel contents -->
	<table class="table table-striped table-bordered table-hover table-condensed active" >
		<thead>
			<tr>
				<th class="table_screentitle">CallNo</th>
				<th class="table_screentitle">服务站名称</th>
				<th class="table_screentitle">返回备件号</th>
				<th class="table_screentitle">返回时间</th>
				<th class="table_screentitle">分配时间</th>
				<th class="table_screentitle">状态</th>
				<th class="table_screentitle">维修结果</th>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td>${t.callno}</td>
				<td>${t.station}</td>
				<td>${t.relParts}</td>
				<td>${t.returnDate}</td>
				<td>${t.distributionDate}</td>
				<td>${status[t.status]}</td>
				<td>${t.repairResult}</td>
			</tr>
		</c:forEach>
	</table>
</div>
<div align="right">
	<button type="button" class="btn btn-primary" id="printBtn" >打 印</button>
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
