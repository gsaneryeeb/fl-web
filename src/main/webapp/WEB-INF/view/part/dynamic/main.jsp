<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/screen_index.css" />
<script>
	var vl=true;
	$(function(){
		$("#printBtn").click(function(){
			$(".PrintArea").printArea();
		});
		/** $("#printBtn").click(function(){
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
		}); */
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
							window.location.href="${pageContext.request.contextPath}/part/dynamic/toMain";
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
<div class="panel panel-default div_screen PrintArea" style="width: 100%;text-align: center;margin-left: auto;margin-right: auto;">
	<c:if test="${READ_ONLY==true }">
		<div class="panel-heading">
			<form id="_operForm" action="${pageContext.request.contextPath}/part/dynamic/backSave" method="POST">
				<table class="table  table-striped table-bordered table-hover table-condensed active" >
					<thead>
						<tr>
							<th class="table_screentitle">备件号</th>
							<th class="table_screentitle">货架号</th>
							<th class="table_screentitle">入库数量</th>
							<th class="table_screentitle">出库数量</th>
							<th class="table_screentitle">调整数量</th>
							<th class="table_screentitle">系统数量</th>
							<th class="table_screentitle">实盘数量</th>
							<th class="table_screentitle">备注</th>
						</tr>
					</thead>
					<c:if test="${t==null }">
						无备件
					</c:if>
					<c:if test="${t!=null }">
					<c:forEach items="${t}" var="t">
						<tr align="center">
							<td><input name="ids" value="${t.partId }" type="hidden"/>${t.parts}</td>
							<td>${t.rack}</td>
							<td>${t.inStoreage}</td>
							<td>${t.outStoreage}</td>
							<td>${t.adjust}</td>
							
							<td>${t.sysNumber}</td>
							<td><input dir="${t.partId}" name="initNumbers" size="6" maxlength="6" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')"/></td>
							<td><input dir="${t.partId}" name="remarks" size="40"/></td>
						</tr>
					</c:forEach>
						<tr>
							<td colspan="8" align="right">
								<button type="button" class="btn btn-primary btn-sm" id="saveCycle">
									保存
								</button>
								<button type="button" class="btn btn-primary btn-sm" id="printBtn">
									打印
								</button>
							</td>
						</tr>
					</c:if>
				</table>
			</form>
		</div>
	</c:if>
</div>
<c:if test="${READ_ONLY==false }">
		<div id="globalErrorDiv" class="alert alert-danger alert-dismissable" style="text-align:center;margin-left: auto;margin-right: auto;width: 300px;max-width: 300px;">
			<strong>昨日异动已入库,不能重复操作!</strong>
		</div>
</c:if>
<jsp:include page="../../common/bottom.jsp" />
