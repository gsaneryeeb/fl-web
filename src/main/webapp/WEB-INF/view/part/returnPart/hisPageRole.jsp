<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/screen_index.css" />
<script>
	function search(id) {
		$("#_search_OR_status").remove();
		$("#searchForm").submit();
	}
	$(function(){
		$("#refreshBtn").click(function(){
			var s_filterItct=$("#s_filterItct").val();	
			var _search_OR_status = $("#_search_OR_status").val();
			$("#searchForm :input").val("");
			$("#s_filterItct").val(s_filterItct);
			$("#_search_OR_status").val(_search_OR_status);
			$("#searchForm").submit();
		});
	});

	function checkSave(method) {
		if($("input[name='scrap']").is(':checked')==false){
			alert("请填写是否报废!此项不能为空!");
			return ;
		}
		$.ajax({
			type : method,
			url : $("#_operForm").attr("action"),
			data : $("#_operForm").serialize(),
			dataType : "json",
			beforeSend : function() {
				$("#loading").show();
				$("#_operModal").modal("hide");
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
	}

	function update(url) {
		$("#_curdDiv").load(url, function() {
			$("#_operModal").modal("show");
			$("#saveBtn").click(function(){
				checkSave('PUT');
			});
			$("#finishBtn").click(function(){
				checkSave('POST');
			});
			$("#_operModal").on('hidden.bs.modal', function (e) {
				$("#_curdDiv").text("");		
			});
		});
	}
	function openDetail(){
		var id="";
		$("input[name='ids']").each(function(){
			if($(this).is(":checked")){
				id+="id="+$(this).val()+"&";
			}
		});
		if(id!=""){
			$("#_curdDiv").load("${pageContext.request.contextPath}/part/returnPart/printRepair?"+id.substring(0, id.length-1),function(){
				$("#_detailModal").modal("show");	
			});
		}else{
			alert("请选择要打印的call");
		}
	}
	
</script>
<form id="searchForm" action="${pageContext.request.contextPath}/part/returnPart/hisPageRole" method="get">
	<input type="hidden" name="page" id="_page" value="0"> 
	<input type="hidden" name="pageSize" id="_pageSize" value="10">
	<input type="hidden" name="search_OR_status" id="_search_OR_status" value="3-4">
	
	<input name="filterItct" id="s_filterItct" value="OR_distribution" class="input-control" type="hidden">
	<table style="width: 100%;" id="searchTable">
		<tr>
			<td style="width: 25%;">CallNo: <input name="search_LIKE_callno" id="s_callNo" value="${search_LIKE_callno }" class="input-control"></td>
			<td style="width: 25%;">服务站: <input name="search_LIKE_station" id="s_station" value="${search_LIKE_station}" class="input-control"></td>
			<td>状态:
				<select name="search_OR_status">
					<option value="3-4"></option>
					<option value="3">待测试/待维修</option>
					<option value="4">待维中</option>
				</select>
			</td>
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
<div id="initStaffsHis" class="panel panel-default div_screen" >
	
	<!-- Default panel contents -->
	<table class="table  table-striped table-bordered table-hover table-condensed active" >
		<thead>
			<tr>
				<th class="table_screentitle">CallNo</th>
				<th class="table_screentitle">服务站名称</th>
				<th class="table_screentitle">申请备件号</th>
				<th class="table_screentitle">返回备件号</th>
				<th class="table_screentitle">返回备件名称</th>
				<th class="table_screentitle">返回时间</th>
				<th class="table_screentitle">状态</th>
				<th class="table_screentitle" width="140">操作</th>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td><input type="checkbox" value="${t.id }" name="ids" style="text-align: left;">${t.callno}</td>
				<td>${t.station}</td>
				<td>${t.parts}</td>
				<td>${t.relParts}</td>
				<td>${t.partsName}</td>
				<td>${t.returnDate}</td>
				<td>
					<c:if test="${t.status==3 && t.returnStatus==0}">
						待测试
					</c:if>
					<c:if test="${t.status==3 && t.returnStatus!=0}">
						待维修
					</c:if>
					<c:if test="${t.status==4 && t.repairResult==1}">
						已修复
					</c:if>
					<c:if test="${t.status==4 && t.repairResult==0}">
						未修复
					</c:if>
					<c:if test="${t.status!=3 && t.status!=4}">
						${status[t.status]}
					</c:if>
				
				</td>
				
				<td><a href="javascript:void(0)" onclick="update('${pageContext.request.contextPath}/part/returnPart/editRepair?id=${t.id}')">处理</a></td>
			</tr>
		</c:forEach>
	</table>
</div>

<div id="_curdDiv"></div>
<div id="_partsDiv"></div>
<jsp:include page="../../common/pageHis.jsp" />
<!-- 
<div style="text-align: right;">
	<button class="btn btn-primary btn-sm"  onclick="openDetail()">
		打印
	</button>
</div> -->
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
