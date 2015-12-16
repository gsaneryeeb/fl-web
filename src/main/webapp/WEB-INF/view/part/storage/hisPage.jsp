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
			var _search_EQ_status=$("#_search_EQ_status").val();
			$("#searchForm :input").val("");
			$("#_search_EQ_status").val(_search_EQ_status);
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
							$("#_curdDiv").load("${pageContext.request.contextPath}/part/storage/prints"+id,function(){
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
					$("#_curdDiv").load("${pageContext.request.contextPath}/part/storage/print?id="+$(obj).attr("dir"),function(){
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
	
	function print(obj) {
		$("#_curdDiv").load($(obj).attr("url"),function(){
			$("#_detailModal").modal("show");	
		});
	}

</script>
<div class="panel panel-default div_screen">
			<form id="searchForm"
				action="${pageContext.request.contextPath}/part/storage/hisPage"
				method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input type="hidden" name="pageSize" id="_pageSize" value="10">
				<input type="hidden" name="search_EQ_status" id="_search_EQ_status" value="${search_EQ_status }">
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
			<td width="85%" style="padding-left: 10px">入库单列表
			</td>
			<c:if test="${not empty search_EQ_status}">
				<td>
					<button id="bachFinish" class="btn btn-primary btn-sm" url="${pageContext.request.contextPath}/part/storage/finish" >
						<span class="glyphicon glyphicon-plus"></span>收货
					</button>
					<button id="_newBtn" class="btn btn-primary btn-sm" url="${pageContext.request.contextPath}/part/storage/new" modal="modal">
						<span class="glyphicon glyphicon-plus"></span>新增
					</button>
				</td>
			</c:if>
		</tr>
	</table>
	<table class="table  table-striped table-bordered table-hover table-condensed active">
		<thead>
			<tr>
				<th class="table_screentitle">备件号</th>
				<th class="table_screentitle">入库单编号</th>
				<th class="table_screentitle">供应商</th>
				<th class="table_screentitle">工程师</th>
				<th class="table_screentitle">数量</th>
				<th class="table_screentitle">单价</th>
				<th class="table_screentitle">WAC</th>
				<th class="table_screentitle">货架号</th>
				<th class="table_screentitle">总价</th>
				<th class="table_screentitle" width="9%">操作</th> 
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td><c:if test="${not empty search_EQ_status}"><input type="checkbox" name="ids" value="${t.id }"></c:if>${t.part}</td>
				<td>${t.inOrder}</td>
				<td>${t.supplierName}</td>
				<td>${engineer[t.allotEngineer]}</td>
				<td>${t.intactQuantity }</td>
				<td>${t.price }</td>
				<td><fmt:formatNumber type="number" value="${t.wac }" maxFractionDigits="2"/></td>
				<td>${t.shelfNo }</td>
				<td><fmt:formatNumber type="number" value="${t.total }" maxFractionDigits="2"/></td>
				<td>
				<c:if test="${not empty search_EQ_status}">
				<a href="javascript:void(0)" onclick="inStorage(this)" url="${pageContext.request.contextPath}/part/storage/finish?ids=${t.id}" dir="${t.id }">收货</a>
				</c:if>
				<c:if test="${empty search_EQ_status}">
					<a href="javascript:void(0)" onclick="print(this)" url="${pageContext.request.contextPath}/part/storage/print?id=${t.id}" dir="${t.id }">打印</a>
				</c:if>
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