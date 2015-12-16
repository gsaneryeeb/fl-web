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
			var _search_DESC_acceptDate= $("#_search_DESC_acceptDate").val();
			var s_acceptPersonId=$("#s_acceptPersonId").val();
			$("#searchForm :input").val("");
			$("#s_status").val(s_status);
			$("#_search_DESC_acceptDate").val(_search_DESC_acceptDate);
			$("#s_acceptPersonId").val(s_acceptPersonId);
			$("#searchForm").submit();
		});
		
		$("a[id='_showBtn']").click(function(){
			$("#_curdDiv").load($(this).attr("url"),function(){
				$("#_detailModal").modal("show");	
			});
		});
	});

	function checkSave() {
		var bl=true;
		if($("#_department").val()==""){
			alert("部门为必填");
			bl=false;
			$("#_department").focus();
			return bl;
		}
		if($("#_tel").val()==""){
			alert("联系电话为必填");
			bl=false;
			$("#_tel").focus();
			return bl;
		}
		if($("#_staffNo").val()==""){
			alert("员工编号为必填");
			bl=false;
			$("#_staffNo").focus();
			return bl;
		}
		if($("#_name").val()==""){
			alert("姓名为必填");
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
				action="${pageContext.request.contextPath}/service/doorRepairService/hisPage" method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input type="hidden" name="pageSize" id="_pageSize" value="10">
				<input type="hidden" name="search_DESC_acceptDate" id="_search_DESC_acceptDate" value="0">
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
							<td style="width: 22%;">维修单号: <input name="search_LIKE_orders"
								id="s_orders" value="${search_LIKE_orders }" class="input-control"></td>
							<td style="width: 22%;">客户姓名: <input name="search_LIKE_cusName"
								id="s_cusName" value="${search_LIKE_cusName }" class="input-control"></td>
								<td style="width: 22%;">送修时间: <input name="search_LIKE_acceptDate"
								id="s_acceptDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${search_LIKE_acceptDate }" class="input-control"></td>
							<td style="width: 20%;">CallNo: <input name="search_LIKE_callno"
								id="s_orders" value="${search_LIKE_callno }" class="input-control"></td>
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
			<td width="92%" style="padding-left: 10px">客户上门维修服务列表
			</td>
		</tr>
	</table>
	<table
		class="table  table-striped table-bordered table-hover table-condensed active">
		<thead>
			<tr>
				<th class="table_screentitle">维修单号</th>
				<th class="table_screentitle">故障分类</th>
				<th class="table_screentitle">产品服务机构</th>
				<th class="table_screentitle">客户名称</th>
				<th class="table_screentitle">送修日期</th>
				<th class="table_screentitle">解决方案</th>
				<th class="table_screentitle">状态</th>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td><a id='_showBtn' href="javascript:void(0)" url="${pageContext.request.contextPath}/service/doorRepairService/myDetail?id=${t.id}">${t.orders}</a>
				<td>${faultTypes[t.faultType]}</td>
				<td>${t.serviceAgencies}</td>
				<td>${t.cusName}</td>
				<td>${t.acceptDate}</td>
				<td>${t.processDes}</td>
				<td>
					<c:if test="${t.finishStatus==1}">${status[t.finishStatus]}</c:if>
					<c:if test="${t.finishStatus==0}">${status[t.status]}</c:if>
				</td>
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