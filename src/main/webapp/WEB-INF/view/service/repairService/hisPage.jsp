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
			var _search_DESC_sendDate=$("#_search_DESC_sendDate").val();
			$("#searchForm :input").val("");
			$("#s_status").val(s_status);
			$("#_search_DESC_sendDate").val(_search_DESC_sendDate);
			$("#s_acceptPersonId").val(s_acceptPersonId);
			$("#searchForm").submit();
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
		if($("#_projectIdFk").val()==null || $("#_projectIdFk").val()==""){
			alert("项目为必选项,请到系统管理当中用户管理部分进行项目维护!");
			bl=false;
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

	function detailPrint(url){
		$("#_curdDiv").load(url,function(){
			printBtn.click();			
		});
	}
</script>
<div class="panel panel-default div_screen">
			<form id="searchForm"
				action="${pageContext.request.contextPath}/service/repairService/hisPage" method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input type="hidden" name="pageSize" id="_pageSize" value="10">
				<input type="hidden" name="search_DESC_sendDate" id="_search_DESC_sendDate" value="0">
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
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
			<td width="92%" style="padding-left: 10px">送修服务列表
			</td>
		</tr>
	</table>
	<table
		class="table  table-striped table-bordered table-hover table-condensed active">
		<thead>
			<tr>
				<th class="table_screentitle">维修单号</th>
				<th class="table_screentitle">PPID</th>
				<th class="table_screentitle">CASENO</th>
				<th class="table_screentitle" width="100">服务站</th>
				<th class="table_screentitle" width="80">派单日期</th>
				<th class="table_screentitle" width="100">服务站发件时间</th>
				<th class="table_screentitle">是否重维</th>
				<th class="table_screentitle" width="90">是否开单维修</th>
				<th class="table_screentitle">处理结果</th>
				<th class="table_screentitle" width="80">到达日期</th>
				<th class="table_screentitle">状态</th>
				<th class="table_screentitle">操作</th>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td><a name='_showBtn' href="javascript:void(0)" url="${pageContext.request.contextPath}/service/repairService/${t.id}">${t.orders}</a>
				<td>${t.ppid}</td>
				<td>${t.caseno}</td>
				<td width="150">${t.station}</td>
				<td>${t.sendDate}</td>
				<td>${t.stataionSendDate}</td>
				<td>
					<c:if test="${t.repeats==1}">是</c:if>
				</td>
				<td><c:forEach items="${types }" var="type">
						<c:if test='${t.repeatsType==type.key }'>${type.value }</c:if>
					</c:forEach></td>
				<td>${RESULT[t.result]}</td>
				<td>${t.expressArrivalTime}</td>
				<td>${status[t.status]}</td>
				<td><button onclick="detailPrint('${pageContext.request.contextPath}/service/repairService/${t.id}')" class="btn btn-primary btn-sm">打印</button></td>
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