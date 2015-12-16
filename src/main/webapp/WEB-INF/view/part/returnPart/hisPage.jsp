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
			$("#searchForm :input").val("");
			$("#searchForm").submit();
		});
	});

	function checkSave(method) {
		var duty=$("#_duty").val();
		var des=$("#_partDes").text();
		var checkPartName=$("#_checkPartName").text();
		var bl=true;
		if($("#_relParts").val()==""){
			alert("实返备件不能为空!");
			return ;
		}
		if($("#_returnStatus").val()=="4" && $("#_supiroId").val()==""){
			alert("供应商不能为空,请选择后操作!");
			return ;
		}
		if($("#_returnStatus").val()!="4"){
			if($("#_returnStatus").val()=="-1"){
				alert("返回状态不能为空!");
				return;
			}
			if($("#_distribution").val()=="-1"){
				alert("分配不能为空!");
				return ;
			}
			if($("#_returnDate").val()==""){
				alert("返回时间不能为空");
				return ;
			}
			if(checkPartName!="" && duty!=""){
				if(duty.indexOf(checkPartName)<0){
					if(!confirm("返件与工程师职责不对应!")){
						return ;					
					}
				}
			}
		}
		$.ajax({
			type : "GET",
			async:false,
			url : "${pageContext.request.contextPath}/sys/part/checkExist?no="+$("#_relParts").val(),
			beforeSend : function() {
				$("#loading").show();
			},
			success : function(msg) {
				$("#loading").hide();
				if(msg.result!="success"){
					alert("备件号"+$("#_relParts").val()+"不存在");
					bl=false;
				}
			}
		});
		if(!bl){
			return ;
		}
		$.ajax({
			type : "GET",
			async:false,
			url : "${pageContext.request.contextPath}/sys/part/checkFru?no="+$("#_relParts").val()+"&part="+$("#_parts").val(),
			beforeSend : function() {
				$("#loading").show();
			},
			success : function(msg) {
				$("#loading").hide();
				if(msg.result!="success"){
					alert("备件号"+$("#_relParts").val()+"不是FRU");
					bl=false;
				}
			}
		});
		if(!bl){
			return ;
		}
		$.ajax({
			type : method,
			url : $("#_operForm").attr("action"),
			data : $("#_operForm").serialize(),
			dataType : "json",
			beforeSend : function() {
				$("#loading").show();
				//$("#_operModal").modal("hide");
			},
			success : function(msg) {
				$("#loading").hide();
				if (msg.result == "success") {
					//$("#globalSuccessDiv > strong").html("操作成功");
					//$("#globalSuccessDiv").slideDown();
					$("#_returnDateTd").text($("#_returnDate").val());
					$("#_relPartsTd").text($("#_relParts").val());
					$("#_distributionDateTd").text($("#_distributionDate").val());
					$("input[name='scrap']").attr("disabled","disabled");
					$("#_distribution").attr("disabled","disabled");
					$("#_returnStatus").attr("disabled","disabled");
					$("#printId").text(msg.ex);
					$("#printBtn").removeAttr("disabled");
					$("#saveBtn").attr("disabled","disabled");
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
			$("#_operModal").on('hidden.bs.modal', function (e) {
				$("#_curdDiv").text("");		
			});
		});
	}
	
</script>
<form id="searchForm" action="${pageContext.request.contextPath}/part/returnPart/init" method="get">
	<table style="width: 100%;" id="searchTable">
		<tr>
			<td style="width: 25%;">CallNo: <input name="search_LIKE_callNo" id="s_callNo" value="${search_LIKE_callNo }" class="input-control"></td>
			<td style="width: 25%;">服务站: <input name="search_LIKE_station" id="s_station" value="${search_LIKE_station}" class="input-control"></td>
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
<div id="initStaffsHis" class="panel panel-default div_screen" style="height:385px; overflow:scroll;">
	<!-- Default panel contents -->
	<table class="table  table-striped table-bordered table-hover table-condensed active" >
		<thead>
			<tr>
				<th class="table_screentitle">CallNo</th>
				<th class="table_screentitle">服务站名称</th>
				<th class="table_screentitle">申请备件号</th>
				<th class="table_screentitle">实出备件号</th>
				<th class="table_screentitle">返回备件号</th>
				<th class="table_screentitle">返回时间</th>
				<th class="table_screentitle">状态</th>
				<th class="table_screentitle" width="140">操作</th>
			</tr>
		</thead>
		<c:forEach items="${t}" var="t">
			<tr align="center">
				<td>${t.callNo}</td>
				<td>${t.station}</td>
				<td>${t.applyParts}</td>
				<td>${t.actualUsePart}</td>
				<td>${t.returnParts}</td>
				<td>${t.returnDate}</td>
				<td>${status[t.status]}</td>
				<td><a href="javascript:void(0)" onclick="update('${pageContext.request.contextPath}/part/returnPart/editInit?rqId=${t.rqId}')">处理</a></td>
			</tr>
		</c:forEach>
			<tr>
				<td colspan="8" align="right">
					<font size="2"><b>合计:${t.size()}</b></font>
				</td>
			</tr>
	</table>
</div>

<div id="_curdDiv"></div>
<div id="_partsDiv"></div>
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
