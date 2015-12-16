<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/screen_index.css" />
<script>
	function search(id) {
		$("#searchForm").submit();
	}
	function next(obj){
		if(obj.value!=""){
			$(obj).parent().parent().next().children().children(":input[name='sendTimes']").val(obj.value);
		}
	}
	//function nextArrive(obj){
	//	if(obj.value!=""){
	//		$(obj).parent().parent().next().children().children(":input[name='arrivalTimes']").val(obj.value);
	//	}
	//}
	$(function(){
		$("#refreshBtn").click(function(){
			var _search_OR_status=$("#_search_OR_status").val();
			var _search_DESC_sendTime =$("#_search_DESC_sendTime").val();
			$("#searchForm :input").val("");
			$("#_search_OR_status").val(_search_OR_status);
			$("#_search_DESC_sendTime").val(_search_DESC_sendTime);
			$("#searchForm").submit();
		});
		$("#sendCopy").click(function(){
			
		});
		$("#ariveCopy").click(function(){
			
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
		return bl;
	}

	function del(obj) {
		$.ajax({
			type : "GET",
			url : $(obj).attr("url"),
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
	function outTransport(obj) {
		var url=$(obj).attr("url");
		var no=$.trim($("#"+$(obj).attr("dir")+"_no").val());
		var st=$("#"+$(obj).attr("dir")+"_st").val();
		var fx=$.trim($("#"+$(obj).attr("dir")+"_fedex").val());
		if((no=="" && fx!="") || (no!="" && fx=="")){
			alert("快递公司和快递单号必须统一,全部填写或者全部空,请确认后再提交!");
			return ;
		}
		if(no=="" && fx==""){
			$("#"+$(obj).attr("dir")+"_no").val("无");
			$("#"+$(obj).attr("dir")+"_fedex").val("无");
			fx="无";
			no="无";
		}
		if(st==""){
			alert("发出时间未填,请补全在提交!");
		}else{
			$.ajax({
				type : "POST",
				url : url+"&expressNos="+no+"&sendTimes="+st+"&fedexs="+fx,
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
	}
	
	function sign(obj) {
		var url=$(obj).attr("url");
		var at=$("#"+$(obj).attr("dir")+"_at").val();
		if(at==""){
			alert("签收日期未填,请补全在提交!");
		}else{
			$.ajax({
				type : "POST",
				url : url+"&arrivalTimes="+at,
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
	}
	
	function bachTransport(){
		if($("input[name='ids']:checked").length>0){
			var bl=false;
			var mes="";
			$("input[name='ids']:checked").each(function(){
				if($(this).attr("status")!=3){
					bl=true;
					mes="有单已经运输过了,不能继续操作!"
					return ;
				}
				if(($.trim($("#"+$(this).val()+"_no").val())=="" && $.trim($("#"+$(this).val()+"_fedex").val())!="") || ($.trim($("#"+$(this).val()+"_no").val())!="" && $.trim($("#"+$(this).val()+"_fedex").val())=="")){
					mes="快递公司和快递单号必须统一,全部填写或者全部空,请确认后再提交!";
					bl=true;
					return ;
				}
				if($.trim($("#"+$(this).val()+"_no").val())=="" && $.trim($("#"+$(this).val()+"_fedex").val())==""){
					$("#"+$(this).val()+"_no").val("无");
					$("#"+$(this).val()+"_fedex").val("无");
				}
				if($("#"+$(this).val()+"_st").val()==""){
					mes="发出时间未填,请补全在提交!";
					bl=true;
					return ;
				}
			});
			if(bl){
				alert(mes);
			}else{
				var b=false;
				$("input[name='ids']:checked").each(function(){
					var id=$(this).val();
					var no=$("#"+$(this).val()+"_no").val();
					var station=$(this).parent().next().next().text();
					$("input[name='ids']:checked").each(function(){
						if(id!=$(this).val()){
							if(no==$("#"+$(this).val()+"_no").val()){
								if(station!=$(this).parent().next().next().text()){
									b=true;
									return ;
								}
							}
						}
					});
					if(bl){
						return;
					}
				});
				var expressNos="";
				var sendTimes="";
				var fedex="";
				var ids="?";
				var iis="";
				$("input[name='ids']:checked").each(function(){
					ids=ids+"ids="+$(this).val()+"&";
					expressNos=expressNos+"expressNos="+$("#"+$(this).val()+"_no").val()+"&";
					sendTimes=sendTimes+"sendTimes="+$("#"+$(this).val()+"_st").val()+"&";
					fedex=fedex+"fedexs="+$("#"+$(this).val()+"_fedex").val()+"&";
					iis=iis+"iis="+$("#"+$(this).val()+"_iis").val()+"&";
				});
				var url="${pageContext.request.contextPath}/part/express/transport"+ids+expressNos+sendTimes+fedex+iis;
				if(b){
					alert("有不同服务站用了相同的快递号,不能提交,请确认!");
				}else{
					//添加验证,不同服务站不能同一个快递号.查询历史
					var b1=false;
					$("input[name='ids']:checked").each(function(){
						var id=$(this).val();
						var no=$("#"+$(this).val()+"_no").val();
						var station=$(this).parent().next().next().text();
						if(no!='无'){
							$.ajax({
								type : "POST",
								url : "${pageContext.request.contextPath}/part/express/checkStationAndNo?no="+no+"&station="+station+"&id="+id,
								async:false,
								success : function(msg) {
									if(msg.result=="success"){
									}else{
										b1=true;
									}
								}
							});
							if(b1){
								return;
							}
						}
					});
					if(b1){
						alert("历史服务站已经用过此快递号,不同服务站用了相同的快递号,不能提交,请确认!");
					}else{
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
				}
			}
		}else{
			alert("请选择要操作的记录!");
		}
	}
	
	
	
	function bachSign(){
		if($("input[name='ids']:checked").length>0){
			var bl=false;	
			$("input[name='ids']:checked").each(function(){
				if($("#"+$(this).val()+"_at").val()=="" || typeof($("#"+$(this).val()+"_at").val())=="undefined"){
					bl=true;
					return;
				}
			});
			if(bl){
				alert("有项目没有输入快递单号和发出日期,请填写全后再提交!");
			}else{
				var arrivalTimes="";
				var ids="?";
				$("input[name='ids']:checked").each(function(){
					ids=ids+"ids="+$(this).val()+"&";
					arrivalTimes=arrivalTimes+"arrivalTimes="+$("#"+$(this).val()+"_at").val()+"&";
				});
				var url="${pageContext.request.contextPath}/part/express/sign"+ids+arrivalTimes;
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
	
	function bachCancel(){
		if($("input[name='ids']:checked").length>0){
			var id="?";
			$("input[name='ids']:checked").each(function(){
				id=id+"ids="+$(this).val()+"&";
			});
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/part/express/changeFlag"+id,
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
		}else{
			alert("请选择要操作的记录!");
		}
	}
</script>
<div class="panel panel-default div_screen">
			<form id="searchForm"
				action="${pageContext.request.contextPath}/part/express/hisPage" method="get">
				<input type="hidden" name="page" id="_page" value="0"> <input type="hidden" name="pageSize" id="_pageSize" value="10">
				<input type="hidden" name="search_OR_status" id="_search_OR_status" value="${search_OR_status }">
				<input type="hidden" name="search_DESC_sendTime" id="_search_DESC_sendTime" value="0">
				<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
							<td style="width: 25%;">快递单号: <input name="search_LIKE_expressNo"
								id="s_expressNo" value="${search_LIKE_expressNo }" class="input-control"></td>
							<td style="width: 25%;">出库单号: <input name="search_LIKE_outOrder"
								id="s_outOrder" value="${search_LIKE_outOrder }" class="input-control"></td>
							<td style="width: 25%;">服务站编号: <input name="search_LIKE_stationNo"
								id="s_outOrder" value="${search_LIKE_stationNo }" class="input-control"></td>
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
			<td  style="padding-left: 10px">备件运输服务列表</td>
			<td align="right">
				<button class="btn btn-primary btn-sm" onclick="bachTransport()">
					运输
				</button>
				<button class="btn btn-primary btn-sm" onclick="bachSign()">
					签收
				</button>
				<button class="btn btn-primary btn-sm" onclick="bachCancel()">
					取消
				</button>
			</td>
		</tr>
	</table>
	<table
		class="table  table-striped table-bordered table-hover table-condensed active">
		<thead>
			<tr>
				<th class="table_screentitle" width="10"></th>
				<th class="table_screentitle" width="50">出库单号</th>
				<th class="table_screentitle" width="90">服务站名称</th>
				<th class="table_screentitle" width="85">申请备件号</th>
				<th class="table_screentitle" width="85">实出备件号</th>
				<th class="table_screentitle" width="37">数量</th>
				<th class="table_screentitle" width="46">快递公司</th>
				<th class="table_screentitle">快递单号</th>
				<th class="table_screentitle">发出时间</th>
				<th class="table_screentitle">到达时间</th>
				<th class="table_screentitle">条码</th>
				<th class="table_screentitle">状态</th>
				<!-- <th class="table_screentitle" width="140">操作</th> -->
			</tr>
		</thead>
		<c:forEach items="${pageHis.content}" var="t">
			<tr align="center">
				<td>
					<input type="checkbox" name="ids" status="${t.status }" value="${t.id }" url="${pageContext.request.contextPath}/part/express">
				</td>
				<td>${t.outOrder}</td>
				<td>${t.station}</td>
				<td>${t.applyParts}</td>
				<td>${t.actualUsePart}</td>
				<td>${t.applyNumber}</td>
				<td><c:if test="${t.status==3 }"><input size="10" name="fedexs" id="${t.id }_fedex"></c:if>
					<c:if test="${t.status==4 }">${t.fedex }</c:if>
				<td><c:if test="${t.status==3 }"><input size="15" name="expressNos" id="${t.id }_no"></c:if>
					<c:if test="${t.status==4 }">${t.expressNo }</c:if>
				</td>
				<td><c:if test="${t.status==3 }"><input name="sendTimes" size="10" id="${t.id }_st" readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onfocus="next(this);"><span class="glyphicon glyphicon-calendar"></span></c:if>
					<c:if test="${t.status==4 }">
						<c:if test='${!"".equals(t.sendTime)}'>
							${t.sendTime.substring(0,10) }
						</c:if>
					</c:if>
				</td>
				<td>
				<c:if test="${t.status==4 }">
				<input name="arrivalTimes" value="${t.arrivalTime}" id="${t.id }_at" size="10" readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" ><span class="glyphicon glyphicon-calendar"></span>
				</c:if>
				</td>
				<td ><c:if test="${t.status==3 }"><input size="10" name="iis" id="${t.id }_iis"></c:if>
					<c:if test="${t.status==4 }">${t.iis }</c:if>
				</td>
				<td>${status[t.status]}</td>
				<!-- 
				<td>
					<c:if test="${t.status==3 }">
					<a href="javascript:void(0)" onclick="outTransport(this)" url="${pageContext.request.contextPath}/part/express/transport?ids=${t.id}" dir="${t.id }">运输</a> ||
					</c:if>
					<c:if test="${t.status==4 }">
					<a href="javascript:void(0)" onclick="sign(this)" url="${pageContext.request.contextPath}/part/express/sign?ids=${t.id}" dir="${t.id }">签收</a> ||
					</c:if>
					<a href="javascript:void(0)" onclick="del(this)" url="${pageContext.request.contextPath}/part/express/changeFlag?ids=${t.id}" dir="${t.id }">取消</a>
				</td>
				 -->
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
