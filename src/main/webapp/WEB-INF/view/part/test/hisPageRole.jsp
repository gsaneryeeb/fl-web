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
			var _search_DESC_assignedDate=$("#_search_DESC_assignedDate").val();	
			var _filterItct=$("#_filterItct").val();
			$("#searchForm :input").val("");
			$("#_search_EQ_status").val(_search_EQ_status);
			$("#_search_DESC_assignedDate").val(_search_DESC_assignedDate);
			$("#_filterItct").val(_filterItct);
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
				if($(this).attr("status")!=2){
					bl=true;
					mes="工程师已经处理了此单,不能继续操作!"
					return ;
				}
				if($("#"+$(this).val()+"_es").val()==""){
					bl=true;
					mes="操作订单的维修状态不能为空,请继续操作!"
					return ;
				}
				if(parseInt($(this).attr("num")) !=(parseInt($("#"+$(this).val()+"_iq").val())+parseInt($("#"+$(this).val()+"_dq").val()))){
					mes="完好数量或故障数量不够!";
					bl=true;
					return ;
				}
				
				if($("#"+$(this).val()+"_ed").val()==""){
					bl=true;
					mes="操作订单的维修时间不能为空,请继续操作!"
					return ;
				}
			});
			if(bl){
				alert(mes);
			}else{
				var engineerStatuss="";
				var intactQuantitys="";
				var damageQuantitys="";
				var faults="";
				var expressDates="";
				
				var ids="?";
				$("input[name='ids']:checked").each(function(){
					ids=ids+"ids="+$(this).val()+"&";
					engineerStatuss=engineerStatuss+"engineerStatuss="+$("#"+$(this).val()+"_es").val()+"&";
					intactQuantitys=intactQuantitys+"intactQuantitys="+$("#"+$(this).val()+"_iq").val()+"&";
					damageQuantitys=damageQuantitys+"damageQuantitys="+$("#"+$(this).val()+"_dq").val()+"&";
					faults=faults+"faults="+$("#"+$(this).val()+"_ft").val()+"&";
					expressDates=expressDates+"expressDates="+$("#"+$(this).val()+"_ed").val()+"&";
				});
				var url="${pageContext.request.contextPath}/part/test/bachSave"+ids+engineerStatuss+intactQuantitys+damageQuantitys+faults+expressDates;
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
				action="${pageContext.request.contextPath}/part/test/hisPageRole"
				method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input type="hidden" name="pageSize" id="_pageSize" value="10">
				<input type="hidden" name="search_EQ_status" id="_search_EQ_status" value="2"> 
				<input type="hidden" name="search_DESC_assignedDate" id="_search_DESC_assignedDate" value="0">
				<input type="hidden" name="filterItct" id="_filterItct" value="OR_allotEngineer">
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
			<td width="93%" style="padding-left: 10px">采购单列表
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
				<th class="table_screentitle">分配日期</th>
				<th class="table_screentitle">数量</th>
				<th class="table_screentitle">供应商</th>
				<th class="table_screentitle">状态</th>
				<th class="table_screentitle">完好数量</th>
				<th class="table_screentitle">故障数量</th>
				<th class="table_screentitle">故障原因</th>
				<th class="table_screentitle">检测时间</th>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td>
					<input type="checkbox" name="ids" status="${t.status }" value="${t.id }" num="${t.number }" url="${pageContext.request.contextPath}/part/test/bachSave">
				</td>
				<td>${t.part}</td>
				<td>${PARTS[t.partId].name}</td>
				<td>${t.assignedDate}</td>
				<td>${t.number}</td>
				<td>${t.supplierName}</td>
				<td>
					<select name="engineerStatuss" id="${t.id }_es">
						<option value=""></option>
						<c:forEach items="${statusEngineer }" var="es">
							<option value="${es.key }">${es.value }</option>
						</c:forEach>
					</select>
				</td>
				<td>
					<input id="${t.id }_iq" name="intactQuantitys" size="3" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
				</td>
				<td>
					<input id="${t.id }_dq" value="0"  name="damageQuantitys" size="3" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
				</td>
				<td>
					<input size="10" name="faults" id="${t.id }_ft">
				</td>
				<td>
					<input id="${t.id }_ed"  name="expressDates" size="18" id="${t.id }_expressDate" readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onfocus="next(this);"><span class="glyphicon glyphicon-calendar"></span>
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