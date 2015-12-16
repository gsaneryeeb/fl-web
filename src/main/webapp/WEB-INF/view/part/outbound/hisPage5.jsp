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
	function search(){
		if($("#s_parts").val()==""){
			alert("备件搜索条件不能为空!!");
			return;
		}
		$("#content").load("${pageContext.request.contextPath}/sys/part/getParts?parts="+$("#s_parts").val());
	}
	function update(url) {
		$("#_curdDiv").load(url, function() {
			$("#_operModal").modal("show");
			$("#_operModal").on('hidden.bs.modal', function (e) {
				$("#_curdDiv").text("");
			});
			$("#saveBtn").click(function(){
				if($("#_result").val()==""){
					alert("请输入解决方案");
					return false;
				}
				if($("#_solutionTime").val()==""){
					alert("请输入服务解决时间");
					return false;
				}
				$.ajax({
					type : "POST",
					url : $("#_operForm").attr("action"),
					data : $("#_operForm").serialize(),
					dataType : "json",
					beforeSend : function() {
						$("#loading").show();
						$("#_operModal").modal("hide");
					},error: function(XMLHttpRequest, textStatus, errorThrown) {
		                alert(XMLHttpRequest.status);
		                alert(XMLHttpRequest.readyState);
		                alert(textStatus);
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
			});
		});
	}
																																						
</script>
<div class="panel panel-default div_screen">
			<form id="searchForm"
				action="${pageContext.request.contextPath}/service/commonRepairService/hisPage5" method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input type="hidden" name="pageSize" id="_pageSize" value="10">
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
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
			<td width="92%" style="padding-left: 10px">普通维修服务
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
									<td width="60">服务站</td>
									<td width="60">CallNo</td>
									<td width="80">客户姓名</td>
									<td width="150">申请时间</td>
									<td width="60">机器型号</td>
									<td width="80">机器序列号</td>
									<td width="80">联系电话</td>
									<td width="80">服务单号</td>
									<td width="60">故障</td>
									<td width="100">工程师</td>
									
									<td width="60">操作</td>
								</tr>
							</thead>
							<tbody>
									<c:forEach items="${pageHis.content}" var="t">
										<tr>
											<td>${t.station }</td>
											<td>${t.callno }</td>
											<td>${t.cusName }</td>
											<td>${t.applyDate }</td>
											<td>${t.machineModel }</td>
											<td>${t.serialNumber }</td>
											<td>${t.cusTel }</td>
											<td>${t.serviceNo }</td>
											<td>${t.fault }</td>
											<td>${t.allocateEngineer }</td>
											<td><a href="javascript:void(0)" onclick="update('${pageContext.request.contextPath}/service/commonRepairService/update?id=${t.id}')">维修</a></td>
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