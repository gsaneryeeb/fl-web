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
			var _search_EQ_station=$("#_search_EQ_station").val();
			$("#searchForm :input").val("");
			$("#s_status").val(s_status);
			$("#_search_EQ_station").val(_search_EQ_station);
			$("#s_acceptPersonId").val(s_acceptPersonId);
			$("#searchForm").submit();
		});
	});

</script>
<div class="panel panel-default div_screen">
			<form id="searchForm"
				action="${pageContext.request.contextPath}/service/commonRepairService/hisPage" method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input type="hidden" name="pageSize" id="_pageSize" value="10">
				<input type="hidden" name="search_EQ_station" value="昌平IBM服务" id="_search_EQ_station">
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
							<td style="width: 25%;">客户姓名: <input name="search_LIKE_cusName"
								id="s_cusName" value="${search_LIKE_cusName}" class="input-control"></td>
							<td style="width: 25%;">CallNo: <input name="search_LIKE_callno"
								id="s_callno" value="${search_LIKE_callno}" class="input-control"></td>
							<td style="width: 25%;">员工编号: <input name="search_LIKE_staffNo"
								id="s_staffNo" value="${search_LIKE_staffNo }" class="input-control"></td>
							<td align="right">
								<button class="btn btn-primary btn-sm" onclick="search('#searchTable')">
									<span class="glyphicon glyphicon-search"></span>查询
								</button>
								<button id="refreshBtn" type="button" class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-repeat"></span>刷新
								</button>
							</td>
						</tr>
						<tr>
							<td style="width: 25%;">客户地点: <input name="search_LIKE_cusAddress"
								id="s_cusAddress" value="${search_LIKE_cusAddress}" class="input-control"></td>
							<td style="width: 25%;">工程师: <input name="search_LIKE_allocateEngineer"
								id="s_allocateEngineer" value="${search_LIKE_allocateEngineer}" class="input-control"></td>
							<td colspan="2" style="width: 25%;">时间段: <input name="search_GTE_cusContactTime" readonly="readonly"
								id="s_cusContactTime" value="${search_GTE_cusContactTime }" class="input-control" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" ><span class="glyphicon glyphicon-calendar"></span> - <input name="search_LTE_cusContactTime"
								id="s_cusContactTime2"  readonly="readonly" value="${search_LTE_cusContactTime }" class="input-control" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" ><span class="glyphicon glyphicon-calendar"></span></td>
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
				<th class="table_screentitle">客户地点</th>
				<th class="table_screentitle">CallNo</th>
				<th class="table_screentitle">机器型号</th>
				<th class="table_screentitle">客户部门</th>
				<th class="table_screentitle">机器序列号</th>
				<th class="table_screentitle">客户姓名</th>
				<th class="table_screentitle">联系电话</th>
				<th class="table_screentitle">维修类型</th>
				<th class="table_screentitle">员工号</th>
				<th class="table_screentitle">故障描述</th>
				<th class="table_screentitle">电话联系客户时间</th>
				<th class="table_screentitle">服务单号</th>
				<th class="table_screentitle">分配工程师</th>
				<th class="table_screentitle">服务解决时间</th>
				<th class="table_screentitle">备注</th>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td>${t.cusAddress}</td><!-- <a name='_showBtn' href="javascript:void(0)" url="${pageContext.request.contextPath}/service/commonRepairService/${t.id}"> -->
				<td>${t.callno}</td>
				<td>${t.machineModel}</td>
				<td>${t.cusDep}</td>
				<td>${t.serialNumber}</td>
				<td>${t.cusName}</td>
				
				<td>${t.cusTel}</td>
				<td><c:if test='${"MEDICAL".equals(t.type)}'>保外服务</c:if>
				<c:if test='${"NON_LOSS".equals(t.type)}'>保内非损</c:if>
				<c:if test='${"MEDICAL_LOSS".equals(t.type)}'>保外非损</c:if></td>
				<td>${t.staffNo}</td>
				<td>${t.fault}</td>
				<td>${t.cusContactTime}</td>
				<td>${t.serviceNo}</td>
				<td>${t.allocateEngineer}</td>
				<td>${t.solutionTime}</td>
				<td>${t.faultRemark}</td>
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