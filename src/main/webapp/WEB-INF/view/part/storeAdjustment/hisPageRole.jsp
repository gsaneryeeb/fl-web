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
			var search_OR_status=$("#search_OR_status").val();
			$("#searchForm :input").val("");
			$("#search_OR_status").val(search_OR_status);
			$("#searchForm").submit();
		});		
		$("#bachCancel").click(function(){
			if($("input[name='ids']:checked").length>0){
				var id="&";
				$("input[name='ids']:checked").each(function(){
					id=id+"ids="+$(this).val()+"&";
				});
				$.ajax({
					type : "POST",
					url : $(this).attr("url")+id,
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
			}else{
				alert("请选择要操作的记录!");
			}
		});
		$("#bachAgree").click(function(){
			if($("input[name='ids']:checked").length>0){
				var id="&";
				$("input[name='ids']:checked").each(function(){
					id=id+"ids="+$(this).val()+"&";
				});
				$.ajax({
					type : "POST",
					url : $(this).attr("url")+id,
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
			}else{
				alert("请选择要操作的记录!");
			}
		});
		$("#bachFinish").click(function(){
			if($("input[name='ids']:checked").length>0){
				var id="&";
				$("input[name='ids']:checked").each(function(){
					id=id+"ids="+$(this).val()+"&";
				});
				$.ajax({
					type : "POST",
					url : $(this).attr("url")+id,
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
			}else{
				alert("请选择要操作的记录!");
			}
		});
	});

	function checkSave() {
		var bl=true;
		if($("#_name").val()==""){
			alert("供应商名称为必填");
			bl=false;
			$("#_name").focus();
			return bl;
		}
		return bl;
	}
	
	function inStorage(obj){
		$.ajax({
			type : "POST",
			url : $(obj).attr("url"),
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
				action="${pageContext.request.contextPath}/part/storeAdjustment/hisPageRole?search_ASC_applyDate=0&search_ASC_tubeAsc=0"
				method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input
					type="hidden" name="pageSize" id="_pageSize" value="10">
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
							<td style="width: 25%;">状态: 
								<select name="search_OR_status">
									<option value="${search_OR_status }"></option>
									<option value="0" <c:if test="${search_OR_status=='0'}">selected='selected'</c:if>>待审批</option>
									<option value="1" <c:if test="${search_OR_status=='1'}">selected='selected'</c:if>>已调整</option>
									<option value="2" <c:if test="${search_OR_status=='2'}">selected='selected'</c:if>>已审批</option>
									<option value="3" <c:if test="${search_OR_status=='3'}">selected='selected'</c:if>>拒绝</option>
									<option value="4" <c:if test="${search_OR_status=='4'}">selected='selected'</c:if>>确认拒绝</option>
								</select>	
							</td>
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
			<td width="65%" style="padding-left: 10px">调整列表
			</td>
			<td align="right">
				<c:forEach items="${ROLEVO }" var="vo">
					<c:set var="bl" value="false"/>
					<c:if test="${vo.ename=='base_tube'}">
						<c:set var="bl" value="true"/>
					</c:if>
					<c:if test="${bl }">
						<button id="bachFinish" class="btn btn-primary btn-sm" url="${pageContext.request.contextPath}/part/storeAdjustment/bachProcess?oper=finish" >
							<span class="glyphicon glyphicon-plus"></span>确认
						</button>
						<button id="_newBtn" class="btn btn-primary btn-sm" url="${pageContext.request.contextPath}/part/storeAdjustment/new" modal="modal">
							<span class="glyphicon glyphicon-plus"></span>新增
						</button>
					</c:if>
					<c:set var="bl1" value="false"/>
					<c:if test="${vo.ename=='manager'}">
						<c:set var="bl1" value="true"/>
					</c:if>
					<c:if test="${bl1 }">
						<button id="bachAgree" class="btn btn-primary btn-sm" url="${pageContext.request.contextPath}/part/storeAdjustment/bachProcess?oper=agree" >
							<span class="glyphicon glyphicon-plus"></span>通过
						</button>
						<button id="bachCancel" class="btn btn-primary btn-sm" url="${pageContext.request.contextPath}/part/storeAdjustment/bachProcess?oper=cancel" >
							<span class="glyphicon glyphicon-plus"></span>拒绝
						</button>
					</c:if>
				</c:forEach>
			</td>
		</tr>
	</table>
	<table class="table  table-striped table-bordered table-hover table-condensed active">
		<thead>
			<tr>
				<th class="table_screentitle">备件号</th>
				<th class="table_screentitle">备件名称</th>
				<th class="table_screentitle">备件数量</th>
				<th class="table_screentitle">单价/WAC值</th>
				<th class="table_screentitle">总价</th>
				<th class="table_screentitle">申请时间</th>
				<th class="table_screentitle">申请原因</th>
				<th class="table_screentitle">备件描述</th>
				<th class="table_screentitle">状态</th>
				<th class="table_screentitle" width="9%">操作</th>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td>
				<c:forEach items="${ROLEVO }" var="vo">
					<c:set var="bl" value="false"/>
					<c:if test="${vo.ename=='base_tube' && (t.status=='2' || t.status=='3')}">
						<c:set var="bl" value="true"/>
					</c:if>
					<c:if test="${bl }">
						<input type="checkbox" name="ids" value="${t.id }"/>
					</c:if>
					<c:set var="bl1" value="false"/>
					<c:if test="${vo.ename=='manager' && t.status=='0'}">
						<c:set var="bl1" value="true"/>
					</c:if>
					<c:if test="${bl1 }">
						<input type="checkbox" name="ids" value="${t.id }"/>
					</c:if>
				</c:forEach>
				${t.parts}
				</td>
				<td>${t.partName}</td>
				<td>${t.number}</td>
				<td>
					<c:if test="${t.type=='new' }">${t.price }</c:if>
					<c:if test="${t.type=='old' }">
					<fmt:formatNumber type="number" value="${t.wac }" maxFractionDigits="2"/>
					</c:if>
				</td>
				<td><fmt:formatNumber type="number" value="${t.totalPrice }" maxFractionDigits="2"/></td>
				<td>${t.applyDate }</td>
				<td>${t.applyReason }</td>
				<td>${t.approvalRemark }</td>
				<td>${status[t.status]}</td>
				<td>
					<c:forEach items="${ROLEVO }" var="vo">
						<c:set var="bl" value="false"/>
						<c:if test="${vo.ename=='base_tube' && (t.status=='2' || t.status=='3')}">
							<c:set var="bl" value="true"/>
						</c:if>
						<c:if test="${bl }">
							<a href="javascript:void(0)" onclick="inStorage(this)" url="${pageContext.request.contextPath}/part/storeAdjustment/bachProcess?oper=finish&ids=${t.id}" dir="${t.id }">确认</a>
						</c:if>
						<c:set var="bl1" value="false"/>
						<c:if test="${vo.ename=='manager' && t.status=='0'}">
							<c:set var="bl1" value="true"/>
						</c:if>
						<c:if test="${bl1 }">
							<a href="javascript:void(0)" onclick="inStorage(this)" url="${pageContext.request.contextPath}/part/storeAdjustment/bachProcess?oper=agree&ids=${t.id}" dir="${t.id }">通过</a> ||
							<a href="javascript:void(0)" onclick="inStorage(this)" url="${pageContext.request.contextPath}/part/storeAdjustment/bachProcess?oper=cancel&ids=${t.id}" dir="${t.id }">拒绝</a>
						</c:if>
					</c:forEach>
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