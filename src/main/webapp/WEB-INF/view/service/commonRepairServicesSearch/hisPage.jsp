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
			var s_status=$("#s_status").val();
			var s_acceptPersonId=$("#s_acceptPersonId").val();
			var s_search_DESC_applyDate =$("#_search_DESC_applyDate").val();
			$("#searchForm :input").val("");
			$("#s_status").val(s_status);
			$("#s_acceptPersonId").val(s_acceptPersonId);
			$("#_search_DESC_applyDate").val(s_search_DESC_applyDate);
			$("#searchForm").submit();
		});
	});

</script>
<div class="panel panel-default div_screen">
			<form id="searchForm"
				action="${pageContext.request.contextPath}/service/commonRepairServicesSearch/hisPage" method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input type="hidden" name="pageSize" id="_pageSize" value="10">
				<input type="hidden" name="search_DESC_applyDate" id="_search_DESC_applyDate" value="0">
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
							<td style="width: 25%;">CallNo: <input name="search_LIKE_callno"
								id="s_callno" value="${search_LIKE_callno}" class="input-control"></td>
							<td style="width: 25%;">服务站: <input name="search_LIKE_station"
								id="s_station" value="${search_LIKE_station }" class="input-control"></td>
							<td align="right">
								<button class="btn btn-primary btn-sm" onclick="search('#searchTable')">
									<span class="glyphicon glyphicon-search"></span>查询
								</button>
								<button id="refreshBtn" type="button" class="btn btn-primary btn-sm">
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
			<td width="92%" style="padding-left: 10px">普通维修服务列表
			</td>
		</tr>
	</table>
	<table
		class="table  table-striped table-bordered table-hover table-condensed active">
		<thead>
			<tr>
				<th class="table_screentitle">服务站名称</th>
				<th class="table_screentitle">客户名称</th>
				<th class="table_screentitle">CallNo</th>
				<th class="table_screentitle">申请时间</th>
				<th class="table_screentitle">申请单数量</th>
				<th class="table_screentitle">申请备件号</th>
				<th class="table_screentitle">是否重复维修</th>
				<th class="table_screentitle">申请备件名称</th>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td>${t.station}</td><!-- <a name='_showBtn' href="javascript:void(0)" url="${pageContext.request.contextPath}/service/commonRepairServicesSearch/${t.id}"> -->
				<td>${t.cusName}</td>
				<td>${t.callno}</td>
				<td>${t.applyDate}</td>
				<td>${t.applyNumber}</td>
				<td>${t.applyParts}</td>
				<td>
				<c:if test='${"1".equals(t.isRepeat)}'>是</c:if>
				<c:if test='${!("1".equals(t.isRepeat))}'>否</c:if>
				</td>
				<td>${PARTS[t.applyPartsId].name}</td>
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