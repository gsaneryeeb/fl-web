<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/screen_index.css" />
<script>
	$(function(){
		$("#saveCycle").click(function(){
			var bl=true;
			var part="";
			$("input[name='initNumbers']").each(function(){
				if($(this).val()==""){
					bl=false;
					part=$(this).attr("dir");
					return ;
				}
			});
			if(bl){
				$("#_operForm").submit();
			}else{
				alert(part+"初盘不能为空,如果没有,请输入0!");
			}
		});
	});
	
</script>

<div id="initStaffsHis" class="panel panel-default div_screen" style="height:385px; overflow:scroll;width: 800px;margin-left: auto;margin-right: auto;">
	<!-- Default panel contents -->
	<form id="_operForm" action="${pageContext.request.contextPath}/part/inventoryCycle/thressPage" method="POST">
		<table class="table  table-striped table-bordered table-hover table-condensed active" >
			<thead>
				<tr>
					<th class="table_screentitle">备件号</th>
					<th class="table_screentitle">备件名称</th>
					<th class="table_screentitle">货架号</th>
					<th class="table_screentitle">初盘数</th>
				</tr>
			</thead>
			<c:if test="${t==null }">
				无备件
			</c:if>
			<c:if test="${t!=null }">
			<c:forEach items="${t}" var="t">
				<tr align="center">
					<td><input name="ids" value="${t.id }" type="hidden"/>${t.no}</td>
					<td>${t.name}</td>
					<td>${t.rack}</td>
					<td><input dir="${t.no}" name="initNumbers" value="0" maxlength="6" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')"/></td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="4" align="right">
						<button type="button" class="btn btn-primary btn-sm" id="saveCycle">
							下一步
						</button>
					</td>
				</tr>
			</c:if>
		</table>
	</form>
</div>
<jsp:include page="../../common/bottom.jsp" />
