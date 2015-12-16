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
			var _search_EQ_status=$("#_search_EQ_transportStatus").val();
			$("#searchForm :input").val("");
			$("#_search_EQ_transportStatus").val(_search_EQ_status);
			$("#searchForm").submit();
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
	
	
	function testSubmit(){
		if($("input[name='ids']:checked").length>0){
			var bl=false;
			var mes="";
			$("input[name='ids']:checked").each(function(){
				if($(this).attr("status")!=0){
					bl=true;
					mes="已经处理了此单,不能继续操作!"
					return ;
				}
				if($("#"+$(this).val()+"_sp").val()==""){
					bl=true;
					mes="请选择供应商,继续操作!"
					return ;
				}
				if($("#"+$(this).val()+"_es").val()==""){
					bl=true;
					mes="请输入快递公司,继续操作!"
					return ;
				}
				if($("#"+$(this).val()+"_ens").val()==""){
					bl=true;
					mes="请输入快递单号,继续操作!"
					return ;
				}
				if($("#"+$(this).val()+"_st").val()==""){
					bl=true;
					mes="请选择开始时间,继续操作!"
					return ;
				}
				if($("#"+$(this).val()+"_at").val()==""){
					bl=true;
					mes="请选择结束时间,继续操作!"
					return ;
				}
			});
			if(bl){
				alert(mes);
			}else{
				var supplierIds="";
				var expresss="";
				var expressNos="";
				var sendTimes="";
				var arriveTimes="";
				
				var ids="?";
				$("input[name='ids']:checked").each(function(){
					ids=ids+"ids="+$(this).val()+"&";
					supplierIds=supplierIds+"supplierIds="+$("#"+$(this).val()+"_sp").val()+"&";
					expresss=expresss+"expresss="+$("#"+$(this).val()+"_es").val()+"&";
					expressNos=expressNos+"expressNos="+$("#"+$(this).val()+"_ens").val()+"&";
					sendTimes=sendTimes+"sendTimes="+$("#"+$(this).val()+"_st").val()+"&";
					arriveTimes=arriveTimes+"arriveTimes="+$("#"+$(this).val()+"_at").val()+"&";
				});
				var url="${pageContext.request.contextPath}/part/purchaseBack/bachSave"+ids+supplierIds+expresss+expressNos+sendTimes+arriveTimes;
				$.ajax({
					type : "POST",
					url : url,
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
		}else{
			alert("请选择要操作的记录!");
		}
	}

</script>
<div class="panel panel-default div_screen">
			<form id="searchForm"
				action="${pageContext.request.contextPath}/part/purchaseBack/hisPage"
				method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input type="hidden" name="pageSize" id="_pageSize" value="10">
				<input type="hidden" name="search_EQ_transportStatus" id="_search_EQ_transportStatus" value="${search_EQ_transportStatus }">
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
							<td style="width: 25%;">备件号: <input name="search_LIKE_part"
								id="s_part" value="${search_LIKE_part }" class="input-control">
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
			<td width="93%" style="padding-left: 10px">采购退回列表
			</td>
			<td align="right">
				<button class="btn btn-primary btn-sm" onclick="testSubmit()">
					提交
				</button>
			</td>
		</tr>
	</table>
	<table class="table  table-striped table-bordered table-hover table-condensed active">
		<thead>
			<tr>					
				<th class="table_screentitle">序号</th> 												
				<th class="table_screentitle">备件号</th>
				<th class="table_screentitle">备件名称</th>
				<th class="table_screentitle">供应商</th>
				<th class="table_screentitle">数量</th>
				<th class="table_screentitle">快递公司</th>
				<th class="table_screentitle">快递单号</th>
				<th class="table_screentitle">发出时间</th>
				<th class="table_screentitle">到达时间</th>
				<th class="table_screentitle">状态</th>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td>
					<input type="checkbox" name="ids" status="${t.transportStatus }" value="${t.id }" num="${t.number }" url="${pageContext.request.contextPath}/part/purchaseBack/bachSave">
				</td>
				<td>${t.part}</td>
				<td>${t.partName}</td>
				<td>
					<select name="supplierIds" id="${t.id }_sp">
						<option value=""></option>
						<c:forEach items="${supiros }" var="s">
							<option value="${s.id }">${s.name }</option>
						</c:forEach>
					</select>
				</td>
				<td>${t.damageQuantity}</td>
				<td><input size="10" name="expresss" id="${t.id }_es"></td>
				<td><input size="10" name="expressNos" id="${t.id }_ens"></td>
				<td>
					<input name="sendTimes" size="18" id="${t.id }_st" readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onfocus="next(this);"><span class="glyphicon glyphicon-calendar"></span>
				</td>
				<td>
					<input name="arriveTimes" size="18" id="${t.id }_at" readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onfocus="next(this);"><span class="glyphicon glyphicon-calendar"></span>
				</td>
				<td>
					${transportMap[t.transportStatus]}
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