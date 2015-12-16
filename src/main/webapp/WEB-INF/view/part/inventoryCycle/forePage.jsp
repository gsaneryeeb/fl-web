<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/screen_index.css" />
<script>
	var vl=true;
	$(function(){
		$("#printBtn").click(function(){
			if(vl){
				$.ajax({
					type : "POST",
					url : $("#_operForm").attr("action"),
					data : $("#_operForm").serialize(),
					dataType : "json",
					beforeSend : function() {
						$("#loading").show();
						$("#_operModal").modal("hide");
					},
					success : function(msg) {
						if(msg.result=="success"){
							$("#globalSuccessDiv > strong").html("操作成功");
							$("#globalSuccessDiv").slideDown();
							setTimeout(function () {
								$("#saveCycle").addClass("disabled");
								$(".PrintArea").printArea();
								$("#globalSuccessDiv").hide();
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
				vl=false;
			}else{
				$(".PrintArea").printArea();
			}
		});
		$("#saveCycle").click(function(){
			vl=false;
			$.ajax({
				type : "POST",
				url : $("#_operForm").attr("action"),
				data : $("#_operForm").serialize(),
				dataType : "json",
				beforeSend : function() {
					$("#loading").show();
					$("#_operModal").modal("hide");
				},
				success : function(msg) {
					if(msg.result=="success"){
						$("#globalSuccessDiv > strong").html("操作成功");
						$("#globalSuccessDiv").slideDown();
						setTimeout(function () {
							window.location.href="${pageContext.request.contextPath}/part/inventoryCycle/toMain";
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

<div id="initStaffsHis" class="panel panel-default div_screen PrintArea" style="height:385px; overflow:scroll;width: 800px;margin-left: auto;margin-right: auto;">
	<!-- Default panel contents -->
	<form id="_operForm" action="${pageContext.request.contextPath}/part/inventoryCycle/bachSave">
		<table class="table  table-striped table-bordered table-hover table-condensed active" >
			<thead>
				<tr>
					<th class="table_screentitle">备件号</th>
					<th class="table_screentitle">备件名称</th>
					<th class="table_screentitle">货架号</th>
					<th class="table_screentitle">系统数</th>
					<th class="table_screentitle">差异数</th>
				</tr>
			</thead>
			<c:if test="${t==null }">
				无备件
			</c:if>
			<c:if test="${t!=null }">
			<c:forEach items="${t}" var="t">
				<tr align="center">
					<td><input name="ids" value="${t.id }" type="hidden"/>${t.no}</td>
					<td>${t.partName}</td>
					<td>${t.rack}</td>
					<td>${t.number }</td>
					<td>${t.diffNumber }</td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="5" align="right">
						<button type="button" class="btn btn-primary btn-sm" id="saveCycle">
							保存
						</button>
						<button type="button" class="btn btn-primary btn-sm printBtn" id="printBtn">
							打印
						</button>
					</td>
				</tr>
			</c:if>
		</table>
	</form>
</div>
<jsp:include page="../../common/bottom.jsp" />
