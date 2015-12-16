<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/screen_index.css" />
<script>
	function search(id) {
		$("#searchForm").submit();
	}
	$(function(){
		$("#refreshBtn").click(function(){
			var _flag=$("#_flag").val();
			$("#searchForm :input").val("");
			$("#_flag").val(_flag);
			$("#searchForm").submit();
		});
		$("#newBtn").click(function(){
			$.ajax({
				type : "POST",
				url : $("#newBtn").attr("url"),
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
		});
	});


</script>
<div class="panel panel-default div_screen">
			<form id="searchForm"
				action="${pageContext.request.contextPath}/sys/wac/hisPage"
				method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input type="hidden" name="pageSize" id="_pageSize" value="10">
				<input type="hidden" name="search_EQ_flag" id="_flag" value="${search_EQ_flag}"> 
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
							<td style="width: 25%;">备件No: <input name="search_LIKE_partNo"
								id="s_partNo" value="${search_LIKE_partNo }" class="input-control"></td>
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
			<td width="92%" style="padding-left: 10px">备件价格列表
			</td>
			<td>
				<button id="newBtn" class="btn btn-primary btn-sm" url="${pageContext.request.contextPath}/sys/wac/doWac" modal="modal">
					运算WAC
				</button>
			</td>
		</tr>
	</table>
	<table
		class="table  table-striped table-bordered table-hover table-condensed active">
		<thead>
			<tr>
				<th class="table_screentitle">备件No</th>
				<th class="table_screentitle">单价</th>
				<th class="table_screentitle">WAC</th>
				<th class="table_screentitle">时间</th>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td>${t.partNo}</td>
				<td>${t.price}</td>
				<td><fmt:formatNumber type="number" value="${t.wac }" maxFractionDigits="2"/></td>
				<td>${t.years}年${t.months }月</td>
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