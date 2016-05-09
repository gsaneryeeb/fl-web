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
			var _search_EQ_status=$("#_search_EQ_status").val();
			var _search_DESC_ordersDate=$("#_search_DESC_ordersDate").val();
			$("#searchForm :input").val("");
			$("#_search_EQ_status").val(_search_EQ_status);
			$("#_search_DESC_ordersDate").val(_search_DESC_ordersDate);
			$("#searchForm").submit();
		});
		$("#bachFinish").click(function(){
			if($("input[name='ids']:checked").length>0){
				var id="?";
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
							$("#_curdDiv").load("${pageContext.request.contextPath}/part/purchase/prints"+id,function(){
								$("#_detailModal").modal("show");	
							});
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
					$("#_curdDiv").load("${pageContext.request.contextPath}/part/purchase/print?id="+$(obj).attr("dir"),function(){
						$("#_detailModal").modal("show");
						$("#printBtn").click(function(){
							$(".PrintArea").printArea();
							location.reload();
						});
						$(".close").click(function(){
							location.reload();
						});
					});
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
	
	function update(obj) {
		$("#_curdDiv").load($(obj).attr("url"),function(){
			$("#_updateModal").modal("show");	
			$("#saveEditBtn").click(function(){
				$.ajax({
					type : "POST",
					url : $("#operEditForm").attr("action"),
					data : $("#operEditForm").serialize(),
					dataType : "json",
					beforeSend : function() {
						$("#loading").show();
						$("#_updateModal").modal("hide");
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
			});
		});
	}
	
	function returnBack(obj) {
		var url=$(obj).attr("url");
		if($(obj).attr("back")=="1"){
			var returnNum=$("#"+$(obj).attr("dir")+"_rn").val();
			var dqNum=$(obj).attr("dq");
			if(returnNum==""){
				alert("没有返件数量,不能继续返件!");
				return;
			}
			if(parseInt(dqNum)<parseInt(returnNum)){
				alert("没有足够的返件数量,不能继续返件!");
				return;
			}
			url=url+"&returnNum="+returnNum;
		}
		$.ajax({
			type : "POST",
			url : url,
			dataType : "json",
			beforeSend : function() {
				$("#loading").show();
				$("#_updateModal").modal("hide");
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
	
	function print(obj) {
		$("#_curdDiv").load($(obj).attr("url"),function(){
			$("#_detailModal").modal("show");	
		});
	}

</script>
<!-- 库管界面 -->
<div class="panel panel-default div_screen">
			<form id="searchForm"
				action="${pageContext.request.contextPath}/part/purchase/hisPage"
				method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input type="hidden" name="pageSize" id="_pageSize" value="10">
				<input type="hidden" name="search_EQ_status" id="_search_EQ_status" value="${search_EQ_status }">
				<input type="hidden" name="search_DESC_ordersDate" value="0" id="_search_DESC_ordersDate">
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
							<td style="width: 25%;">备件号: <input name="search_LIKE_part"
								id="s_part" value="${search_LIKE_part }" class="input-control"></td>
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
			<td width="93%" style="padding-left: 10px">采购单列表
			</td>
			<td></td>
				<td>
					<button id="_newBtn" class="btn btn-primary btn-sm" url="${pageContext.request.contextPath}/part/purchase/new" modal="modal">
						<span class="glyphicon glyphicon-plus"></span>新增
					</button>
				</td>
		</tr>
	</table>
	<div style="overflow-x:auto;overflow-y:auto;">
	<table class="table  table-striped table-bordered table-hover table-condensed active" style="overflow-x:auto;width:1500px;overflow-y:hidden;">
		<thead>
			<tr>			
				<td class="table_screentitle">操作</td> 	
				<td class="_hi">返件数量</td>		
				<td class="_hi">故障数量</td>									
				<td class="table_screentitle">备件号</td>
				
				<!-- <td class="table_screentitle">备件描述</td> -->
				<td class="table_screentitle">订购数量</td>
				<td class="table_screentitle">单价</td>
				<td class="table_screentitle">订购日期</td>
				<td class="table_screentitle">总价</td>
				<td class="table_screentitle">订购来源</td>
				<td class="table_screentitle">订单号</td>
				<!-- <td class="table_screentitle">快递费</td> -->
				<td class="table_screentitle">供应商</td>
				<td class="table_screentitle">订购状态</td>
				<td class="table_screentitle">到货日期</td>
				<td class="table_screentitle">分配检测</td>
				<td class="table_screentitle">测试状态</td>
				<td class="table_screentitle">完好数量</td>
				<td class="table_screentitle">故障原因</td>
				<td class="table_screentitle">故障状态</td>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td>
				<c:if test="${t.status=='8' || t.status=='9'}">
				<a href="javascript:void(0)" onclick="update(this)" url="${pageContext.request.contextPath}/part/purchase/edit?id=${t.id}" dir="${t.id }">编辑</a>
				</c:if>
				<c:if test="${t.status=='6'}">
					<a href="javascript:void(0)" back="1" dq="${t.damageQuantity }" onclick="returnBack(this)" url="${pageContext.request.contextPath}/part/purchase/returnBack?type=1&id=${t.id}" dir="${t.id }">返件</a>
					<a href="javascript:void(0)" back="0" onclick="returnBack(this)" url="${pageContext.request.contextPath}/part/purchase/returnBack?type=0&id=${t.id}" dir="${t.id }">不返件</a>
				</c:if>
				</td>
				<td class="${t.id }_hi"><c:if test="${t.status!='6'}">${t.returnNum }</c:if>
					<c:if test="${t.status=='6'}"><input name="returnNum" id="${t.id }_rn" size="3" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></c:if>
				</td>
				<td class="${t.id }_hi">${t.damageQuantity }</td>
				<td>${t.part}</td>
				<!-- <td>${t.partRemark}</td> -->
				<td>${t.number}</td>
				<td>${t.price }</td>
				<td>${t.ordersDate }</td>
				<td>${t.total}</td>
				<td>${sources[t.source]}</td>
				<td>${t.inOrder }</td>
				<!-- <td>${t.expressFree }</td> -->
				<td>${t.supplierName }</td>
				<td>${speakForStatusMap[t.speakForStatus]}</td>
				<td>${t.arrivalDate }</td>
				<td>${engineersMap[t.allotEngineer]}</td>
				<td>${statusEngineer[t.engineerStatus]}</td>
				<td>${t.intactQuantity }</td>
				<td>${t.fault }</td>
				<td>${faultStatusMap[t.faultStatus]}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
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