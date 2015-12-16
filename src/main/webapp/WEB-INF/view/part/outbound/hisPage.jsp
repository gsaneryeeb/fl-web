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
			var s_status=$("#_search_OR_status").val();
			$("#searchForm :input").val("");
			$("#_search_OR_status").val(s_status);
			$("#searchForm").submit();
		});
	});
																																						
</script>
<div class="panel panel-default div_screen">
			<form id="searchForm"
				action="${pageContext.request.contextPath}/part/outbound/hisPages" method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input type="hidden" name="pageSize" id="_pageSize" value="10">
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
							<td style="width: 25%;">出库单号: <input name="search_LIKE_outOrder"
								id="s_orders" value="${search_LIKE_outOrder }" class="input-control"></td>
							<td style="width: 25%;">CallNo: <input name="search_LIKE_callno"
								id="s_callno" value="${search_LIKE_callno }" class="input-control"></td>
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
			<td width="92%" style="padding-left: 10px">出库单列表
			</td>
		</tr>
	</table>
	<table id="diagnosisTable" class="table table-condensed table-nutrition">
	<tr>
		<td>
			<div>
				<div class="table-responsive nutrition-div content_scroll " >
						<table class="table table-condensed table-nutrition">
							<thead>
								<tr>
									<td width="40">出库单号</td> 
									<td width="60">服务站</td>
									<td width="60">CallNo</td>
									<td width="50">项目ID</td>
									<td width="80">客户姓名</td>
									<td width="100">申请时间</td>
									<td width="60">机器型号</td>
									<td width="80">机器序列号</td>
									<td width="80">申请备件号</td>
									<td width="80">备件描述</td>
									<td width="60">申请数</td>
									<td width="100">实出备件号</td>
									<td width="60">实出数量</td>
									<td width="110">维修类型</td>
									<td width="100">快递发出时间</td>
									<td width="100">架位号</td>
									<td width="60">状态</td>
								</tr>
							</thead>
							<tbody>
									<c:forEach items="${pageHis.content}" var="t">
										<tr>
											<td><a name='_showBtn' href="javascript:void(0)" url="${pageContext.request.contextPath}/part/outbound/${t.id}">${t.outOrder }</a></td>
											<td>${t.station }</td>
											<td>${t.callno }</td>
											<td>${t.project.no }</td>
											<td>${t.cusName }</td>
											<td>${t.applyDate }</td>
											<td>${t.machineModel }</td>
											<td>${t.serialNumber }</td>
											<td>${t.applyParts }</td>
											<td>${t.partsDes }</td>
											<td>${t.applyNumber }</td>
											<td>${t.actualUsePart }</td>
											<td>${t.useNumber }</td>
											<td>${status[t.repairType]}</td>
											<td>${t.sendTime }</td>
											<td>${t.shelves }</td>
											<td>${statusService[t.status]}</td>
										</tr>
									</c:forEach>
								
							</tbody>
						</table>
				</div>
			</div>
		</td>
	</tr>
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