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
			$("#searchForm :input").val("");
			$("#s_status").val(s_status);
			$("#s_acceptPersonId").val(s_acceptPersonId);
			$("#searchForm").submit();
		});
	});

	function checkSave() {
		var bl=true;
		if($("#_type2").val()=="SYS"){	//系统运维
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
			if($("#_name").val()==""){
				alert("姓名为必填");
				bl=false;
				$("#_name").focus();
				return bl;
			}
			if($("#_staffNo").val()==""){
				alert("员工编号为必填");
				bl=false;
				$("#_staffNo").focus();
				return bl;
			}
			if($("#_machineModel").val()==""){
				alert("机器型号为必填");
				bl=false;
				$("#_machineModel").focus();
				return bl;
			}
			if($("#_serialNumber").val()==""){
				alert("机器序列号为必填");
				bl=false;
				$("#_serialNumber").focus();
				return bl;
			}
			
			
			$("#_officeSpace").val("");
			$("#_tableNumber").val("");
			$("#_portNumber").val("");
			$("#_projectName").val("");
			$("#_head").val("");
			var c=$("#_contentCheck").val();
			c=c.replace("E","");
			c=c.replace("F","");
			c=c.replace("G","");
			c=c.replace("H","");
			c=c.replace("I","");
			c=c.replace("J","");
			c=c.replace("K","");
			c=c.replace("L","");
			c=replace_all(c);				
			if(c.indexOf(",")==0){
				c=c.substring(1);
			}
			c=replace_last(c);
			$("#_contentCheck").val(c);
		}else if($("#_type2").val()=="LINE"){		//网络与机房服务
			$("#_staffNo").val("");
			$("#_machineModel").val("");
			$("#_serialNumber").val("");
			$("#_projectName").val("");
			$("#_head").val("");
			var c=$("#_contentCheck").val();
			c=c.replace("A","");
			c=c.replace("B","");
			c=c.replace("C","");
			c=c.replace("D","");
			c=c.replace("J","");
			c=c.replace("K","");
			c=c.replace("L","");
			c=replace_all(c);
			if(c.indexOf(",")==0){
				c=c.substring(1);
			}
			c=replace_last(c);
			$("#_contentCheck").val(c);
		}else if($("#_type2").val()=="SERVER"){		//服务器运维
			$("#_department").val("");
			$("#_tel").val("");
			$("#_officeSpace").val("");
			$("#_staffNo").val("");
			$("#_name").val("");
			$("#_machineModel").val("");
			$("#_serialNumber").val("");
			$("#_tableNumber").val("");
			$("#_portNumber").val("");
			var c=$("#_contentCheck").val();
			c=c.replace("A","");
			c=c.replace("B","");
			c=c.replace("C","");
			c=c.replace("D","");
			c=c.replace("E","");
			c=c.replace("F","");
			c=c.replace("G","");
			c=c.replace("H","");
			c=c.replace("I","");
			c=replace_all(c);
			if(c.indexOf(",")==0){
				c=c.substring(1);
			}
			c=replace_last(c);
			$("#_contentCheck").val(c);
		}
		return bl;
	}
	
	function replace_all(a){
		if(a.indexOf(",,")>=0){
			a=a.replace(",,",",");
			replace_all(a);
		}
		return a;
	}
	
	function replace_last(a){
		if(a.lastIndexOf(",")>=0){
			a=a.substring(0,a.length-1);
			replace_last(a);
		}
		return a;
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
				action="${pageContext.request.contextPath}/service/helpdesk/hisPageRole" method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input type="hidden" name="pageSize" id="_pageSize" value="10">
				<input name="search_EQ_status" id="s_status" value="${search_EQ_status }" class="input-control" type="hidden">
				<input name="filterItct" id="s_acceptPersonId" value="EQ_acceptPersonId" class="input-control" type="hidden">
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
							<td style="width: 20%;">服务类型: 
								<select name="search_LIKE_type" id="_search_LIKE_type">
									<c:forEach items="${SERVICE_TYPE }" var="p">
										<option value="${p.key }" <c:if test='${search_LIKE_type==p.key }'>selected="selected"</c:if>>${p.value }</option>		
									</c:forEach>
								</select>
							</td>
							<td style="width: 20%;">工程师: <input name="search_LIKE_acceptPersonName"
								id="s_staffNo" value="${search_LIKE_acceptPersonName }" class="input-control"></td>
							<td style="width: 40%;">服务时间: <input name="search_GTE_acceptDate"
								id="s_acceptDate" value="${search_GTE_acceptDate }" class="input-control" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" readonly="readonly"> - <input name="search_LTE_finishDate"
								id="s_finishDate" value="${search_LTE_finishDate }" class="input-control" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" readonly="readonly">	
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
			<td width="92%" style="padding-left: 10px">Help Desk服务列表
			</td>
			<td>
				<button id="_newBtn" class="btn btn-primary btn-sm" url="${pageContext.request.contextPath}/service/helpdesk/new" modal="modal">
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
				<th class="table_screentitle">服务类型</th>
				<th class="table_screentitle">服务开始时间</th>
				<th class="table_screentitle">服务结束时间</th>
				<th class="table_screentitle" width="9%">操作</th>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td>${t.orders}</td>
				<td>${SERVICE_TYPE[t.type]}</td>
				<td>${t.acceptDate}</td>
				<td>${t.finishDate}</td>
				<td>
				<a name="_upBtn" href="javascript:void(0)" url="${pageContext.request.contextPath}/service/helpdesk/edit/${t.id}">修改</a>
				|| <a href="javascript:void(0)" onclick="del('${pageContext.request.contextPath}/service/helpdesk/changeFlag?id=${t.id}&status=${t.status}')">取消</a>
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