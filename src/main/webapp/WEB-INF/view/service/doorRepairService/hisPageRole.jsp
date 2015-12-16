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
			var s_acceptPersonId=$("#s_acceptPersonId").val();
			var s_search_DESC_acceptDate=$("#s_search_DESC_acceptDate").val();
			$("#searchForm :input").val("");
			$("#s_status").val(s_status);
			$("#s_search_DESC_acceptDate").val(s_search_DESC_acceptDate);
			$("#s_acceptPersonId").val(s_acceptPersonId);
			$("#searchForm").submit();
		});
	});
	
	function add(url) {
		$("#_curdDiv").load(url, function() {
			$("#_operModal").modal("show");
			$("#saveBtn").click(function(){
				//checkroleSave('POST');
				checkroleSave2('POST');
			});
			$("#_operModal").on('hidden.bs.modal', function (e) {
				$("#_curdDiv").text("");		
			});
		});
	}

	/* function checkroleSave(method) {
		var bl=true;
		if($("#_needPart").val()=="1" && $("#faultType").val()!="HARD"){
			alert("已经申请备件,不能修改服务类型,请尝试取消!");
			bl=false;
			return bl;
		}
		if($("#_cusName").val()==""){
			alert("姓名为必填");
			bl=false;
			$("#_cusName").focus();
			return bl;
		}
		if($("#_cusTel").val()==""){
			alert("联系电话为必填");
			bl=false;
			$("#_cusTel").focus();
			return bl;
		}
		if($("#_hostNumber").val()==""){
			alert("主机编号为必填");
			bl=false;
			$("#_hostNumber").focus();
			return bl;
		}
		if($("#_projectIdFk").val()==null || $("#_projectIdFk").val()==""){
			alert("项目为必选项,请到系统管理当中用户管理部分进行项目维护!");
			bl=false;
			return bl;
		}
		if($("#_referencePrice").val()!=null && $("#_referencePrice").val()!=""){
			if(isNaN($("#_referencePrice").val())){
				   alert("金额格式不正确,请输入正确的金额格式!");
				   bl=false;
				   return bl;
			}
		}
		if($("#_processCost").val()!=null && $("#_processCost").val()!=""){
			if(isNaN($("#_processCost").val())){
			   alert("金额格式不正确,请输入正确的金额格式!");
			   bl=false;
			   return bl;
			}
		}
		if($("#_inspectionFee").val()!=null && $("#_inspectionFee").val()!=""){
			if(isNaN($("#_inspectionFee").val())){
			   alert("检验费格式不正确,请输入正确的金额格式!");
			   bl=false;
			   return bl;
			}
		}
		
		if($("input[name='_faultHandling']:checked").val()!="1"){
			$("input[name='_faultType']").each(function(){     
		          $(this).removeAttr("checked");
			});
			$("input[name='faultType']").val("");
		}
		if($("input[name='_faultHandling']:checked").val()=="1"){
			if($("#_processDes").val()==""){
				 alert("处理描述为必填项!");
				 bl=false;
				 return bl;
			}
			if($("#_processCost").val()==""){
				 alert("费用为必填项!");
				 bl=false;
				 return bl;
			}
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
						$("#globalSuccessDiv").hide();
					}, 5000);
					if($("#faultType").val()=="HARD" && ($("#_needPart").val()==null || $("#_needPart").val()=="")){
						$("#_outboundDiv").load("${pageContext.request.contextPath}/part/outbound/doorRepairOutBound?id="+msg.message, function() {
							$("#doorRepairModal").modal("show");
							$("#doorRepairModalSaveBtn").click(function(){
								if(doorRepairOut()){
									location.reload();
								}
							});
							
							$("#doorRepairModal").on('hidden.bs.modal', function (e) {
								$("#_outboundDiv").text("");
								location.reload();
							});
						});
					}else{
						location.reload();
					}
				} else {
					$("#globalErrorDiv > strong").html("错误=" + msg.ex);
					$("#globalErrorDiv").slideDown();
					setTimeout(function() {
						$("#globalErrorDiv").hide();
					}, 5000);
				}
			}
		});
	} */
	
	//update
	function checkroleSave2(method) {
		var bl=true;
		if($("#_needPart").val()=="1" && $("#faultType").val()!="HARD"){
			alert("已经申请备件,不能修改服务类型,请尝试取消!");
			bl=false;
			return bl;
		}
		if($("#_cusName").val()==""){
			alert("姓名为必填");
			bl=false;
			$("#_cusName").focus();
			return bl;
		}
		if($("#_cusTel").val()==""){
			alert("联系电话为必填");
			bl=false;
			$("#_cusTel").focus();
			return bl;
		}
		if($("#_hostNumber").val()==""){
			alert("主机编号为必填");
			bl=false;
			$("#_hostNumber").focus();
			return bl;
		}
		if($("#_projectIdFk").val()==null || $("#_projectIdFk").val()==""){
			alert("项目为必选项,请到系统管理当中用户管理部分进行项目维护!");
			bl=false;
			return bl;
		}
		if($("#_referencePrice").val()!=null && $("#_referencePrice").val()!=""){
			if(isNaN($("#_referencePrice").val())){
				   alert("金额格式不正确,请输入正确的金额格式!");
				   bl=false;
				   return bl;
			}
		}
		if($("#_processCost").val()!=null && $("#_processCost").val()!=""){
			if(isNaN($("#_processCost").val())){
			   alert("金额格式不正确,请输入正确的金额格式!");
			   bl=false;
			   return bl;
			}
		}
		if($("#_inspectionFee").val()!=null && $("#_inspectionFee").val()!=""){
			if(isNaN($("#_inspectionFee").val())){
			   alert("检验费格式不正确,请输入正确的金额格式!");
			   bl=false;
			   return bl;
			}
		}
		
		/* if($("input[name='_faultHandling']:checked").val()!="1"){
			$("input[name='_faultType']").each(function(){     
		          $(this).removeAttr("checked");
			});
			$("input[name='faultType']").val("");
		} */
		if($("input[name='_faultHandling']:checked").val()=="1"){
			if($("#_processDes").val()==""){
				 alert("处理描述为必填项!");
				 bl=false;
				 return bl;
			}
			if($("#_processCost").val()==""){
				 alert("费用为必填项!");
				 bl=false;
				 return bl;
			}
		}
		if($("input[name='_faultType']").is(":checked")){
			if($("input[name='_faultType']:checked").val()=="HARD"){
					if($("#_appr_Date").val()==null || $("#_appr_Date").val()==""){
						alert("申请时间为必选项!");
						bl=false;
						return bl;
					}
					if($("#_stationId").val()==null || $("#_stationId").val()==""){
						alert("服务站为必选项,请到系统管理当中服务站管理部分进行服务站维护!");
						bl=false;
						return bl;
					}
					if($("#_machineModel").val()==""){
						alert("机器型号为必填");
						bl=false;
						$("#_machineModel").focus();
						return bl;
					}
					if($("#_serial").val()==""){
						alert("机器序列号为必填");
						bl=false;
						$("#_serial").focus();
						return bl;
					}
					if($("#_app_partNo").val()==null || $("#_app_partNo").val()==""){
						alert("备件号为必填");
						bl=false;
						$("#_app_partNo").focus();
						return bl;
					}
					if($("#_app_partNo").val()!=""){
						$.ajax({
							type : "GET",
							async:false,
							url : "${pageContext.request.contextPath}/sys/part/checkExist?no="+$("#_app_partNo").val(),
							beforeSend : function() {
								$("#loading").show();
							},
							success : function(msg) {
								$("#loading").hide();
								if(msg.result!="success"){
									alert("备件号"+$("#_app_partNo").val()+"不存在");
									bl=false;
								}else{
									$("#_part_des").val(msg.ex);
									$("#_app_partId").val(msg.message);
								}
							}
						});
					}
					if(!bl){
						return bl;
					}
			}
		}
		//保存
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
						$("#globalSuccessDiv").hide();
					}, 5000);
					location.reload();
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
	
	function doorRepairOut(){
		var bl=true;
		if($("#_callno").val()==null || $("#_callno").val()==""){
			alert("CallNo为必选项!");
			bl=false;
			return bl;
		}
		if($("#_appr_Date").val()==null || $("#_appr_Date").val()==""){
			alert("申请时间为必选项!");
			bl=false;
			return bl;
		}
		if($("#_stationId").val()==null || $("#_stationId").val()==""){
			alert("服务站为必选项,请到系统管理当中服务站管理部分进行服务站维护!");
			bl=false;
			return bl;
		}
		if($("#_machineModel").val()==""){
			alert("机器型号为必填");
			bl=false;
			$("#_machineModel").focus();
			return bl;
		}
		if($("#_serial").val()==""){
			alert("机器序列号为必填");
			bl=false;
			$("#_serial").focus();
			return bl;
		}
		if($("#_app_partNo").val()==null || $("#_app_partNo").val()==""){
			alert("备件号为必填");
			bl=false;
			$("#_app_partNo").focus();
			return bl;
		}
		if($("#_applyNumber").val()!=null && $("#_applyNumber").val()!=""){
			if(isNaN($("#_applyNumber").val())){
			   alert("备件数量格式不正确,请输入正确的格式!");
			   bl=false;
			   return bl;
			}
		}else{
			 alert("请输入申请备件数量!");
			 bl=false;
			 return bl;
		}
		if($("#_app_partNo").val()!=""){
			$.ajax({
				type : "GET",
				async:false,
				url : "${pageContext.request.contextPath}/sys/part/checkExist?no="+$("#_app_partNo").val(),
				beforeSend : function() {
					$("#loading").show();
				},
				success : function(msg) {
					$("#loading").hide();
					if(msg.result!="success"){
						alert("备件号"+$("#_app_partNo").val()+"不存在");
						bl=false;
					}else{
						$("#_part_des").val(msg.ex);
						$("#_app_partId").val(msg.message);
					}
				}
			});
		}
		if(!bl){
			return bl;
		}
		$.ajax({
			type : "POST",
			async:false,
			url : $("#_doorRepairModalForm").attr("action"),
			data : $("#_doorRepairModalForm").serialize(),
			dataType : "json",
			beforeSend : function() {
				$("#loading").show();
				$("#doorRepairModal").modal("hide");
			},
			success : function(msg) {
				$("#loading").hide();
				if (msg.result == "success") {
					$("#globalSuccessDiv > strong").html("操作成功");
					$("#globalSuccessDiv").slideDown();
					setTimeout(function() {
						$("#globalSuccessDiv").hide();
					}, 5000);
				} else {
					$("#globalErrorDiv > strong").html("错误=" + msg.ex);
					$("#globalErrorDiv").slideDown();
					setTimeout(function() {
						$("#globalErrorDiv").hide();
					}, 5000);
				}
			}
		});
		
		return bl;
	}
	function rq(url) {
		$("#_outboundDiv").load(url, function() {
			$("#doorRepairModal").modal("show");
			$("#doorRepairModalSaveBtn").click(function(){
				if(doorRepairOut()){
					location.reload();
				}
			});
			$("#doorRepairModal").on('hidden.bs.modal', function (e) {
				$("#_outboundDiv").text("");
				location.reload();
			});
		});
	}
	
	function update(url) {
		$("#_curdDiv").load(url, function() {
			$("#_operModal").modal("show");
			$("#saveBtn").click(function(){
				checkroleSave2('PUT');
			});
			$("#_operModal").on('hidden.bs.modal', function (e) {
				$("#_curdDiv").text("");		
			});
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
				action="${pageContext.request.contextPath}/service/doorRepairService/hisPageRole" method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input type="hidden" name="pageSize" id="_pageSize" value="10">
				<input name="search_NOTEQ_finishStatus" id="s_status" value="1" class="input-control" type="hidden">
				<input name="filterItct" id="s_acceptPersonId" value="EQ_acceptPersonId" class="input-control" type="hidden">
				<input name="search_DESC_acceptDate" id="s_search_DESC_acceptDate" value="0" type="hidden">
				
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
							<td style="width: 23%;">维修单号:<input name="search_LIKE_orders" id="s_orders" value="${search_LIKE_orders }" class="input-control"></td>
							<td style="width: 23%;">客户姓名:<input name="search_LIKE_cusName"
								id="s_cusName" value="${search_LIKE_cusName }" class="input-control"></td>
							<td style="width: 23%;">CallNo:<input name="search_LIKE_callno"
								id="s_orders" value="${search_LIKE_callno }" class="input-control"></td>
							<td align="right" style="width: 20%">
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
			<td>
				<button class="btn btn-primary btn-sm"
					onclick="add('${pageContext.request.contextPath}/service/doorRepairService/new')">
					<span class="glyphicon glyphicon-plus"></span>增加服务
				</button>
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
				<th class="table_screentitle" width="23%">解决方案</th>
				<th class="table_screentitle" >状态</th>
				<th class="table_screentitle" width="13%">操作</th>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td>${t.orders}</td>
				<td>${faultTypes[t.faultType]}</td>
				<td>${t.serviceAgencies}</td>
				<td>${t.cusName}</td>
				<td>${t.acceptDate}</td>
				<td>${t.processDes}</td>
				<td>${viewStatus[t.status ]}</td>
				<td>
				<a href="javascript:void(0)"
					onclick="update('${pageContext.request.contextPath}/service/doorRepairService/editRepair?id=${t.id}')">修改
				</a>
				|| <a href="javascript:void(0)" onclick="del('${pageContext.request.contextPath}/service/doorRepairService/changeFlag?id=${t.id}&status=${t.status}')">取消</a>
				<c:if test="${(t.status==4 && ((t.needPart==1 && t.faultType=='HARD') || (t.faultType=='SOFT') || (t.faultType=='SENCEND_REPER' || t.faultType==null))) || t.status==2 || t.status==-2}">
				|| <a href="javascript:void(0)" onclick="del('${pageContext.request.contextPath}/service/doorRepairService/changeFlagFinish?id=${t.id}&status=${t.status}')">完成</a> 
				</c:if>
				<!--  
				<c:if test="${t.status==6}">
				|| <a href="javascript:void(0)" onclick="rq('${pageContext.request.contextPath}/part/outbound/doorRepairOutBound?id=${t.id}')">申请备件</a> 
				</c:if>-->
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

<div id="_curdDiv"></div>
<div id="_outboundDiv"></div>
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