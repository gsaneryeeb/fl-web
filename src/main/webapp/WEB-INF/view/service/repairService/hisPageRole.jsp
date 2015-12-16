<%@page import="cn.mk.ndms.util.DateTool"%>
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
			var s_acceptPersonId=$("#s_EQ_acceptUserId").val();
			var _search_DESC_sendDate=$("#_search_DESC_sendDate").val();
			$("#searchForm :input").val("");
			$("#s_EQ_acceptUserId").val(s_acceptPersonId);
			$("#_search_DESC_sendDate").val(_search_DESC_sendDate);
			$("#searchForm").submit();
		});
		$("#SLA").click(function(){
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/service/repairService/getPadding",
				beforeSend : function() {
					$("#loading").show();
				},
				success : function(msg) {
					if(msg.result=="success"){
						
					}else{
						$("#alertDiv > strong").html("SLA提醒="+msg.ex+"的维修单号超过SLA,请尽快处理!");
						$("#alertDiv").slideDown();
						setTimeout(function () {
							$("#alertDiv").hide();
						},13000);
					}
				}
			});
		});
	});

	function add(url) {
		$("#_curdDiv").load(url, function() {
			$("#_operModal").modal("show");
			$("#saveBtn").click(function(){
				_checkSave('POST',"0");
			});
			$("#finishBtn").click(function(){
				_checkSave('POST',"1");
			});
			$("#_operModal").on('hidden.bs.modal', function (e) {
				$("#_curdDiv").text("");		
			});
		});
	}
	
	function update(url) {
		$("#_curdDiv").load(url, function() {
			$("#_operModal").modal("show");
			$("#saveBtn").click(function(){
				_checkSave('PUT',"0");
			});
			$("#finishBtn").click(function(){
				_checkSave('PUT',"1");
			});
			$("#_operModal").on('hidden.bs.modal', function (e) {
				$("#_curdDiv").text("");		
			});
		});
	}
	
	function _checkSave(method,finish) {	
		var bl=true;
		if($("#_ppid").val()==""){
			alert("PPID为必填");
			bl=false;
			$("#_ppid").focus();
			return bl;
		}
		if($("#_caseno").val()==""){
			alert("CASENO为必填");
			bl=false;
			$("#_caseno").focus();
			return bl;
		}
		if($("#_stataionSendDate").val()==""){
			alert("服务站发件时间为必填");
			bl=false;
			$("#_stataionSendDate").focus();
			return bl;
		}
		if($("#_sendDate").val()==""){
			alert("派单时间为必填");
			bl=false;
			$("#_sendDate").focus();
			return bl;
		}
		if(finish=="1"){
			$("#_finishFlag").val("1");
		}else{
			$("#_finishFlag").val("0");
		}
		$("#_station").val($("#_stationId option:selected").attr("dir"));
		$("#_engineer").val($("#_engineerId option:selected").attr("dir"));
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/service/repairService/checkPPID?ppid="+$("#_ppid").val()+"&start="+$("#_sendDate").val(),
			success : function(msg) {
				$("#repeats_date").next().remove();
				if(msg.result=="error"){
					$("#_repeats").prop("checked",true);
					var obj=eval('('+msg.ex+')');
					$("#_operForm").attr("action",$("#addSaveOne").val());//$("#addSaveTwo").val());
					$("#repeats_date").after("<tr class='danger'><td><input type='hidden' name='repeatsId' value='"+obj.id+"'>"+obj.orders+"</td>"+"<td>"+obj.ppid+"</td>"+"<td>"+obj.expressArrivalTime+"</td></tr>");
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
				}else{
					$("#_operForm").attr("action",$("#addSaveOne").val());
					$("#_repeats").prop("checked",false);
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
				action="${pageContext.request.contextPath}/service/repairService/hisPageRole" method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input type="hidden" name="pageSize" id="_pageSize" value="10">
				<input name="filterItct" id="s_EQ_acceptUserId" value="EQ_acceptUserId" class="input-control" type="hidden">
				<input type="hidden" name="search_DESC_sendDate" value="0" id="_search_DESC_sendDate">
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr id="searchTr">
							<td style="width: 15%;">项目号: 
								<select name="search_LIKE_projectIdFk">
									<c:forEach items="${projects }" var="projects">
										<option value="${projects.id }">${projects.cname }</option>
									</c:forEach>
								</select>
							</td>
							<td style="width: 23%;">维修类型: 
								<select name="search_LIKE_repeatsType">
									<option value="" dir=""></option>
									<option value="0" dir="首次维修">首次维修</option>
									<option value="1" dir="重维">重维</option>
									<option value="2" dir="未修复">未修复</option>
									<option value="3" dir="未开单重维">未开单重维</option>
									<option value="4" dir="不开单维修">不开单维修</option>
								</select>
							</td>
							<td style="width: 23%;">维修单号: <input name="search_LIKE_orders"
								id="s_orders" value="${search_LIKE_orders }" class="input-control"></td>
							<td style="width: 23%;">CASENO: <input name="search_LIKE_caseno"
								id="s_caseno" value="${search_LIKE_caseno }" class="input-control"></td>
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
						<tr>
							<td colspan="5" align="left">
								服务站: <input name="search_LIKE_station"
								id="s_station" value="${search_LIKE_station }" class="input-control">
								派单时间: <label><input name="search_GTE_sendDate"
								id="s_sendDate" value="${search_GTE_sendDate }" class="input-control" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})">
								<span class="glyphicon glyphicon-calendar"></span></label>
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
			<td width="75%" style="padding-left: 10px">送修服务列表
			</td>
			<td align="right">
				<!-- 
				<button id="SLA" type="button" class="btn btn-primary btn-sm">
					SLA提醒
				</button> -->
				<c:set var="bl" value="false"/>
				<c:forEach items="${ROLEVO }" var="vo">
					<c:if test="${vo.ename=='scheduling'}">
						<c:set var="bl" value="true"/>
					</c:if>
				</c:forEach>
				<c:if test="${bl }">
					<button class="btn btn-primary btn-sm"
						onclick="add('${pageContext.request.contextPath}/service/repairService/newInit')">
						<span class="glyphicon glyphicon-plus"></span>增加服务
					</button>
				</c:if>
			</td>
		</tr>
	</table>
	<table
		class="table  table-bordered table-condensed active">
		<thead>
			<tr>
				<th class="table_screentitle">维修单号</th>
				<th class="table_screentitle">PPID</th>
				<th class="table_screentitle">CASENO</th>
				<th class="table_screentitle" >服务站</th>
				<th class="table_screentitle">派单日期</th>
				<th class="table_screentitle">服务站发件时间</th>
				<th class="table_screentitle">是否重维</th>
				<th class="table_screentitle">是否开单维修</th>
				<th class="table_screentitle">处理结果</th>
				<th class="table_screentitle">到达日期</th>
				<th class="table_screentitle">状态</th>
				<th class="table_screentitle">操作</th>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<c:set value="${t.station}" var="station"/>
			<c:set value="${t.sendDate}" var="endTime"/>
			<c:set value="${t.status}" var="stas"/>
			<tr align="center" style="<%=cn.mk.ndms.util.DateTool.sla(pageContext.getAttribute("stas")==null?"":pageContext.getAttribute("stas").toString(),pageContext.getAttribute("station").toString(),pageContext.getAttribute("endTime").toString()) %>">
				<td>${t.orders}</td>
				<td>${t.ppid}</td>
				<td>${t.caseno}</td>
				<td width="150">${t.station}</td>
				<td>${t.sendDate}</td>
				<td>${t.stataionSendDate}</td>
				<td>
					<c:if test="${'1'==t.repeats}">
						重维
					</c:if>
				</td>
				<td>
					<c:forEach items="${types }" var="type">
						<c:if test='${t.repeatsType==type.key }'>${type.value }</c:if>
					</c:forEach>
				</td>
				<td>${RESULT[t.result]}</td>
				<td>${t.expressArrivalTime}</td>
				<td>${status[t.status]}</td>
				<td>
				<c:forEach items="${ROLEVO }" var="vo">
					<c:set var="bl" value="false"/>
					<c:set var="bl1" value="false"/>
					<c:set var="bl2" value="false"/>
					<c:set var="bl3" value="false"/>
					<c:if test="${vo.ename=='scheduling' && t.status eq null}">
						<c:set var="bl" value="true"/>
					</c:if>
					<c:if test="${vo.ename=='transportation_manager' && (t.status eq 0 || t.status eq 5)}">
						<c:set var="bl1" value="true"/>
					</c:if>
					<c:if test="${vo.ename=='engineer' && t.status eq 2}">
						<c:set var="bl2" value="true"/>
					</c:if>
					<c:if test="${vo.ename=='transportation_manager' && t.status eq 4}">
						<c:set var="bl3" value="true"/>
					</c:if>
					<c:if test="${bl }">
						<a href="javascript:void(0)" onclick="update('${pageContext.request.contextPath}/service/repairService/editOne/${t.id}')">修改</a>
					</c:if>
					<c:if test="${bl1 }">
						<a href="javascript:void(0)" onclick="update('${pageContext.request.contextPath}/service/repairService/editTwo/${t.id}')">修改</a>
					</c:if>
					<c:if test="${bl2 }">
						<a href="javascript:void(0)" onclick="update('${pageContext.request.contextPath}/service/repairService/editThress/${t.id}')">修改</a>
					</c:if>
					<c:if test="${bl3 }">
						<a href="javascript:void(0)" onclick="update('${pageContext.request.contextPath}/service/repairService/editFore/${t.id}')">修改</a>
					</c:if>
				</c:forEach>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
<div id="alertDiv" class="alert alert-danger alert-dismissable success-btn" style="display: none;text-align:center;margin-left: auto;margin-right: auto;width: 300px;max-width: 300px;">
	<button type="button" class="close">X</button>
	<strong style="word-wrap: break-word;"></strong>
</div>
<div id="_curdDiv"></div>

<jsp:include page="../../common/pageHisRole.jsp" />
<jsp:include page="../../common/bottom.jsp" />
<script>
	function goPageHis(size, page, accessPath, totalPage , filterItct) {
		var reg = new RegExp("^[0-9]*$");
		if (!reg.test(page)) {
			alert("请输入正确的数字");
			return;
		}
		if (page - totalPage > 0) {
			page = totalPage;
		}
		$("#searchTr").text("");
		$("#_page").val(page - 1);
		$("#_pageSize").val(size);
		$("#searchForm").submit();
	}
</script>