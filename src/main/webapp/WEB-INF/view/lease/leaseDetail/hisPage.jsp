<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/screen_index.css" />
<script>
	function search(id) {
		$("#searchForm").submit();
	}
	Date.prototype.format = function(format) {  
	    var o = {  
	        "M+" : this.getMonth() + 1, // month  
	        "d+" : this.getDate(), // day  
	        "h+" : this.getHours(), // hour  
	        "m+" : this.getMinutes(), // minute  
	        "s+" : this.getSeconds(), // second  
	        "q+" : Math.floor((this.getMonth() + 3) / 3), // quarter  
	        "S" : this.getMilliseconds()  
	    };  
	    if (/(y+)/.test(format)) {  
	        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));  
	    }  
	    for (var k in o) {  
	        if (new RegExp("(" + k + ")").test(format)) {  
	            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]  : ("00" + o[k]).substr(("" + o[k]).length));  
	        }  
	    }  
	    return format;  
	};
	$(function(){
		$("#_upBtn").click(function(){
			var _id="";
			var _mainId="";
			if($("input[name='_ids']:checked").length>0){
				var id="";
				var bl=true;
				$("input[name='_ids']:checked").each(function(){
					_id+="id="+$(this).val()+"&";
					_mainId="mainId="+$(this).attr("mainId");
					if(id==""){
						id=$(this).attr("mainId");
					}else{
						if(id!=$(this).attr("mainId")){
							bl=false;
						}
					}
				});
				if(bl){
					$("#_curdDiv").load("${pageContext.request.contextPath}/lease/lease/edit?"+_id+_mainId, function() {
						$("#_operModal").modal("show");
					});
				}else{
					alert("请选择同样的订单!");
				}
			}else{
				alert("请选择要操作的记录!");
			}
		});
		
		
		$("#refreshBtn").click(function(){
			$("#searchForm :input").val("");
			$("#_search_DESC_hireTime").val("=0");
			$("#searchForm").submit();
		});
		
		$("input[name='s_where']").click(function(){
			var is=false;
			if($(this).is(":checked")){
				is=true;
			}
			$("input[name='s_where']").attr('checked',false);
			if(is==true){
				$(this).prop('checked',true);
			}else{
				$(this).prop('checked',false);
			}
			if($("input[name='s_where']:checked").val()=="1"){
				var d = new Date();
				d=(d.getTime() + 5*24*60*60*1000);
				$("#s_rentTime").val(new Date(d).format("yyyy-MM-dd")+" 00:00:00");
				$("#s_charge").val("AFTER");
				$("#s_null_returnTime").val("");
				$("#s_lte_rentTime").val("");
				$("#s_extendedCharge").val("");
				$("#s_gte_rentTime").val("");
				$("#searchForm").submit();
			}
			if($("input[name='s_where']:checked").val()=="2"){
				$("#s_charge").val("");
				var d = new Date();
				d=(d.getTime() + 5*24*60*60*1000);
				$("#s_rentTime").val(new Date(d).format("yyyy-MM-dd")+" 00:00:00");
				$("#s_null_returnTime").val("");
				$("#s_lte_rentTime").val("");
				$("#s_extendedCharge").val("");
				$("#s_gte_rentTime").val("");
				$("#searchForm").submit();
			}
			if($("input[name='s_where']:checked").val()=="3"){
				$("#s_charge").val("AFTER");
				var d = new Date();
				$("#s_lte_rentTime").val(new Date(d).format("yyyy-MM-dd")+" 00:00:00");
				$("#s_extendedCharge").val("NO");
				$("#s_rentTime").val("");
				$("#s_null_returnTime").val("");
				$("#s_gte_rentTime").val("");
				$("#searchForm").submit();
			}
			if($("input[name='s_where']:checked").val()=="4"){
				$("#s_charge").val("");
				$("#s_rentTime").val("");
				$("#search_EQ_extendedCharge").val("");
				$("#s_null_returnTime").val("1");
				$("#s_gte_rentTime").val("");
				var d = new Date();
				$("#s_lte_rentTime").val(new Date(d).format("yyyy-MM-dd")+" 00:00:00");
				$("#searchForm").submit();
			}
			if($("input[name='s_where']:checked").val()=="5"){
				$("#s_charge").val("");
				$("#s_rentTime").val("");
				$("#search_EQ_extendedCharge").val("");
				$("#s_null_returnTime").val("");
				var d = new Date();
				var dd = new Date();
				d.setDate(d.getDate()+7);
				$("#s_lte_rentTime").val(new Date(d).format("yyyy-MM-dd")+" 00:00:00");
				$("#s_gte_rentTime").val(new Date(dd).format("yyyy-MM-dd")+" 00:00:00");
				$("#s_extendedCharge").val("NO");
				$("#searchForm").submit();
			}
			if(typeof($("input[name='s_where']:checked").val())=="undefined"){
				$("#s_charge").val("");
				$("#searchForm :input").val("");
				$("#searchForm").submit();
			}
		});
	});

	function checkSave() {
		$("#globalErrorDiv").text($("#_operForm").serialize());
		var bl=true;
		if($("#_cusName").val()==""){
			alert("客户姓名为必填");
			bl=false;
			$("#_cusName").focus();
			return bl;
		}
		if($("#_chargePrice").val()!=null && $("#_chargePrice").val()!=""){
			if(isNaN($("#_chargePrice").val())){
			   alert("金额格式不正确,请输入正确的金额格式!");
			   bl=false;
			   return bl;
			}
		}
		if(typeof($("input[name='machineModels']").val())=="undefined"){
			alert("备件必填,请添加一个以上备件!");
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

	function update(url,id) {
		$("#_curdDiv").load(url, function() {
			$("#_operModal").modal("show");
		});
	}
	
	function upload(url,id) {
		$("#_curdDiv").load(url, function() {
			$("#_operModal").modal("show");
			//保存
			 $("#uploadBtn").click(function(){
				 /*$.ajax({
					type : "POST",
					url : $("#_operForm").attr("action"),
					data : $("#_operForm").serialize(),
					beforeSend : function() {
						$("#loading").show();
						$("#_operModal").modal("hide");
					},
					success : function(msg) {
						if(msg.result=="success"){
							$("#globalSuccessDiv > strong").html("操作成功");
							$("#globalSuccessDiv").slideDown();
							setTimeout(function () {
								$("#globalSuccessDiv").hide();
							},2000);
						}else{
							$("#globalErrorDiv > strong").html("错误="+msg.ex);
							$("#globalErrorDiv").slideDown();
							setTimeout(function () {
								$("#globalErrorDiv").hide();
							},5000);
						}
					}
				});*/
				if($("#file").val()!=""){
					$("#_operForm").submit();
					$("#_operModal").modal("hide");
					$("#globalSuccessDiv > strong").html("操作成功");
					$("#globalSuccessDiv").slideDown();
					setTimeout(function () {
						location.reload();
					},2000);
				}else{
					alert("请选择文件后提交!");
				}
			}); 
			
		});
	}
	
	function print(url){
		$("#_curdDiv").load(url, function() {
			//$("#_detailModal").modal("show");
			$(".PrintArea").printArea();
		});
	}
</script>
<div class="panel panel-default div_screen">
			<form id="searchForm"
				action="${pageContext.request.contextPath}/lease/leaseDetail/hisPage"
				method="get">
				<input type="hidden" name="page" id="_page" value="0"> 
				<input type="hidden" name="pageSize" id="_pageSize" value="10">
				<input type="hidden" name="search_DESC_hireTime" id="_search_DESC_hireTime" value="=0">
				
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
							<td style="width: 25%;">机器序列号: <input name="search_LIKE_lease.machineSerial"
								id="s_machineSerial" value="${search_LIKE_lease_machineSerial}" class="input-control"></td>
							<td style="width: 25%;">客户姓名:<input name="search_LIKE_lease.cusName"
								id="s_cusName" value="${search_LIKE_lease_cusName}" class="input-control"></td>
							<td style="width: 25%;">合同号:<input name="search_LIKE_lease.contractNo"
								id="s_contractNo" value="${search_LIKE_lease_contractNo}" class="input-control"></td>
							<td align="right" colspan="3">
								<button class="btn btn-primary btn-sm"
									onclick="search('#searchTable')">
									<span class="glyphicon glyphicon-search"></span>查询
								</button>
								<button id="refreshBtn" type="button"
									class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-repeat"></span>刷新
								</button>
								<input name="search_LIKE_lease.charge" id="s_charge" value="${search_LIKE_lease_charge}" type="hidden">
								<input name="search_EQ_rentTime" id="s_rentTime" value="${search_EQ_rentTime}" class="input-control" type="hidden">
								
								<input name="search_ISNULL_returnTime" id="s_null_returnTime" value="${search_ISNULL_returnTime}" class="input-control" type="hidden">
								<input name="search_LTE_rentTime" id="s_lte_rentTime" value="${search_LTE_rentTime}" class="input-control" type="hidden">
								<input name="search_EQ_extendedCharge" id="s_extendedCharge" value="${search_EQ_extendedCharge}" class="input-control" type="hidden">
								<input name="search_GTE_rentTime" id="s_gte_rentTime" value="${search_GTE_rentTime}" class="input-control" type="hidden">
							</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="s_where" value="1" <c:if test="${s_where==1}">checked="checked"</c:if>>预到期收费</td>
							<td><input type="checkbox" name="s_where" value="2" <c:if test="${s_where==2}">checked="checked"</c:if>>预到期机器</td>
							<td><input type="checkbox" name="s_where" value="3" <c:if test="${s_where==3}">checked="checked"</c:if>>到期未收费</td>
							<td><input type="checkbox" name="s_where" value="4" <c:if test="${s_where==4}">checked="checked"</c:if>>到期未返回机器</td>
							<td><input type="checkbox" name="s_where" value="5" <c:if test="${s_where==5}">checked="checked"</c:if>>SLA提醒</td>
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
			<td width="82%" style="padding-left: 10px">租赁信息列表
			</td>
			<td>
				<button id="_newBtn" class="btn btn-primary btn-sm" url="${pageContext.request.contextPath}/lease/lease/new" modal="modal">
					<span class="glyphicon glyphicon-plus"></span>新增
				</button>
				<button id="_upBtn" class="btn btn-primary btn-sm" modal="modal">
					<span class="glyphicon glyphicon-plus"></span>修改
				</button>
			</td>
		</tr>
	</table>
	<table
		class="table  table-striped table-bordered table-hover table-condensed active">
		<thead>
			<tr>
				<th class="table_screentitle">编号</th>
				<th class="table_screentitle">地址</th>
				<th class="table_screentitle">客户姓名</th>
				<th class="table_screentitle">租赁性质</th>
				<th class="table_screentitle">起租时间</th>
				<th class="table_screentitle">到期时间</th>
				<th class="table_screentitle">收费周期</th>
				<th class="table_screentitle">租赁金额</th>
				<th class="table_screentitle">押金金额</th>
				<th class="table_screentitle">附件</th>
				<th class="table_screentitle">操作</th>
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td>
				<input type="checkbox" name="_ids" value="${t.id }" mainId="${t.lease.id}">
				<a name='_showBtn' href="javascript:void(0)" url="${pageContext.request.contextPath}/lease/lease/${t.leaseId}">${t.lease.no}</a></td>
				<td>${t.lease.adress}</td>
				<td>${t.lease.cusName}</td>
				<td>
				<c:if test="${t.lease.leasePro=='PERSON'}">
					个人
				</c:if>
				<c:if test="${t.lease.leasePro=='COMPLETE'}">
					企业
				</c:if>
				</td>
				<td><c:if test="${t.hireTime!=null}">${t.hireTime.substring(0,10) }</c:if></td>
				<td><c:if test="${t.rentTime!=null}">${t.rentTime.substring(0,10)}</c:if></td>
				<td>
					<c:if test="${''==t.chargePeriod || t.chargePeriod==null}">无</c:if>
					<c:if test="${t.chargePeriod=='DAY'}">日</c:if>
					<c:if test="${t.chargePeriod=='MONTH'}">月</c:if>
					<c:if test="${t.chargePeriod=='T_MONTH'}">3月</c:if>
					<c:if test="${t.chargePeriod=='S_MONTH'}">6月</c:if>
					<c:if test="${t.chargePeriod=='YEAR'}">年</c:if>
				</td>
				<td>${t.price}</td>
				<td>
				<c:if test="${t.leasingAmount==null || ''==t.leasingAmount}">无</c:if>
				<c:if test="${t.leasingAmount!=null || ''!=t.leasingAmount}">${t.leasingAmount}</c:if>
				</td>
				<td>
					<c:if test="${t.lease.filePath==null || ''.equals(t.lease.filePath)}">
						<a href="javascript:void(0)" onclick="upload('${pageContext.request.contextPath}/lease/lease/toUpload?id=${t.leaseId}')">上传</a>
					</c:if>
					<c:if test="${t.lease.filePath!=null && !''.equals(t.lease.filePath)}">
						<a href="${pageContext.request.contextPath}/lease/lease/download?fileName=${t.lease.filePath}">下载</a><br />
					</c:if>
				</td>
				<td>
					<c:if test="${t.returnTime==null || ''.equals(t.returnTime)}">
						<a href="javascript:void(0)" onclick="update('${pageContext.request.contextPath}/lease/lease/edit?id=${t.id}&mainId=${t.lease.id}')">修改</a>
					</c:if>
					<a href="javascript:void(0)" onclick="print('${pageContext.request.contextPath}/lease/lease/print?id=${t.leaseId}')">打印</a>
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