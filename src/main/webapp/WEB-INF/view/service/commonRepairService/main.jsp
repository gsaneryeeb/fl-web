<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/screen_index.css" />
<script>
	$(function(){
		$("#stationPage").load("${pageContext.request.contextPath}/service/commonRepairService/stationsGrop",function(){
			$("input[name='stations']").click(function(){
				$("#servicePage").load("${pageContext.request.contextPath}/service/commonRepairService/commonRepairServices?stationId="+$(this).val());
			});
		});
		$("#servicePage").load("${pageContext.request.contextPath}/service/commonRepairService/commonRepairServices?stationId=");
	});
	
	function searchRq(){
		$("#stationPage").load("${pageContext.request.contextPath}/service/commonRepairService/searchStationsGrop?station="+$("#s_stationName").val()+"&callno="+$("#s_callNo").val(),function(){
			$("input[name='stations']").click(function(){
				$("#servicePage").load("${pageContext.request.contextPath}/service/commonRepairService/commonRepairServices?stationId="+$(this).val());
			});
		});
		$("#servicePage").load("${pageContext.request.contextPath}/service/commonRepairService/commonRepairServices?stationId=");
	}
	
	function add(url) {
		$("#_curdDiv").load(url, function() {
			$("#_operModal").modal("show");
			$("#saveBtn").click(function(){
				checkSave('POST');
			});
			$("#_operModal").on('hidden.bs.modal', function (e) {
				$("#_curdDiv").text("");		
			});
		});
	}
	
	function checkSave(method) {
		if($("#_stationId").val()==""){
			alert("请选择服务站");
			return false;
		}
		if($("#_callno").val()==""){
			alert("CallNo不能为空!");
			return false;
		}
		if($("#_cusName").val()==""){
			alert("姓名不能为空!");
			return false;
		}
		if($("#_applyDate").val()==""){
			alert("申请时间不能为空!");
			return false;
		}
		if($("#_machineModel").val()==""){
			alert("机器型号不能为空!");
			return false;
		}
		if($("#_serialNumber").val()==""){
			alert("机器序列号不能为空!");
			return false;
		}
		if($("#_stationId :checked").attr("no")=="BJ09"){
			if($("#_cusDep").val()==""){
				alert("客户部门不能为空!");
				return false;
			}
			if($("#_cusAddress").val()==""){
				alert("客户地点不能为空!");
				return false;
			}
			if($("#_cusTel").val()==""){
				alert("联系电话不能为空!");
				return false;
			}
			/* if($("#_cusContactTime").val()==""){
				alert("电话联系客户时间不能为空!");
				return false;
			} */
			if($("#_staffNo").val()==""){
				alert("员工编号不能为空!");
				return false;
			}
			if($("#_serviceNo").val()==""){
				alert("服务单号不能为空!");
				return false;
			}
			if($("#_allocateEngineer").val()==""){
				alert("工程师不能为空!");
				return false;
			}
				
		}
		/**
		var bl=true;
		if(typeof($("input[name='partses']").val())=="undefined"){
			alert("请添加备件!备件不能不选择!");
			bl=false;
			return bl;
		}
		$("input[name='partses']").each(function(){
			if($(this).val()==""){
				bl=false;
				alert("备件不能为空!");
				return ;
			}
		});
		if(!bl){
			return bl;
		}
		if($("#_callno").val()==null || $("#_callno").val()==""){
			alert("CallNo为必选项!");
			bl=false;
			return bl;
		} 
		if($("#_applyDate").val()==null || $("#_applyDate").val()==""){
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
		if($("#_serialNumber").val()==""){
			alert("机器序列号为必填");
			bl=false;
			$("#_serial").focus();
			return bl;
		}
		/**
		if($("#_app_partNo").val()==null || $("#_app_partNo").val()==""){
			alert("备件号为必填");
			bl=false;
			$("#_app_partId").focus();
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
		*/
		$.ajax({
			type : method,
			url : $("#_operForm").attr("action"),
			data : $("#_operForm").serialize(),
			dataType : "json",
			beforeSend : function() {
				$("#loading").show();
				$("#_operModal").modal("hide");
			},error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            },
			success : function(msg) {
				$("#loading").hide();
				if (msg.result == "success") {
					$("#globalSuccessDiv > strong").html("操作成功");
					$("#globalSuccessDiv").slideDown();
					setTimeout(function() {
						location.reload();
					}, 2000);
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
						$("#globalSuccessDiv").hide();
						$("#servicePage").load("${pageContext.request.contextPath}/service/commonRepairService/commonRepairServices?stationId="+$(obj).attr("dir"));
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
	
	function outBound(obj){
		var num=$(obj).parent("td").prev().prev().prev().prev().children(":input[name='inventoryNumbers']").val();
		var applyNumber=$(obj).parent("td").prev().prev().prev().prev().prev().prev().html();
		if(num!="" && num-applyNumber>=0){
			var actualUseParts=$(obj).parent("td").prev().prev().prev().prev().prev().children(":input[name='actualUseParts']").val();
			var actualUsePartIds=$(obj).parent("td").prev().prev().prev().prev().prev().children(":input[name='actualUsePartIds']").val();
			var shelveses=$(obj).parent("td").prev().prev().prev().prev().prev().children(":input[name='shelveses']").val();
			var newOrOldes=$(obj).parent("td").prev().prev().prev().prev().prev().children(":input[name='newOrOld']").val();
			var isRepeats=$(obj).parent("td").prev().prev().children(":input[name='isRepeats']").val();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/service/commonRepairService/checkRepeatsAjax?ids="+$(obj).attr("serviceId"),
				beforeSend : function() {
					$("#loading").show();
				},
				success : function(msg) {
					if(msg.result=="success" || msg.result=="error_sys"){
						$.ajax({
							type : "POST",
							url : $(obj).attr("url")+"&actualUseParts="+actualUseParts+"&actualUsePartIds="+actualUsePartIds+"&shelveses="+shelveses+"&inventoryNumbers="+num+"&newOrOld="+newOrOldes+"&isRepeats="+isRepeats,
							beforeSend : function() {
								$("#loading").show();
							},
							success : function(msg) {
								if(msg.result=="success"){
									$("#globalSuccessDiv > strong").html("操作成功");
									$("#globalSuccessDiv").slideDown();
									setTimeout(function () {
										$("#globalSuccessDiv").hide();
										$("#stationPage").load("${pageContext.request.contextPath}/service/commonRepairService/stationsGrop");
										$("#servicePage").load("${pageContext.request.contextPath}/service/commonRepairService/commonRepairServices?stationId="+$(obj).attr("dir"));
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
						if(confirm("重维,是否继续?")){
							$.ajax({
								type : "POST",
								url : $(obj).attr("url")+"&actualUseParts="+actualUseParts+"&actualUsePartIds="+actualUsePartIds+"&shelveses="+shelveses+"&inventoryNumbers="+num+"&newOrOld="+newOrOldes+"&isRepeats=1",
								beforeSend : function() {
									$("#loading").show();
								},
								success : function(msg) {
									if(msg.result=="success"){
										$("#globalSuccessDiv > strong").html("操作成功");
										$("#globalSuccessDiv").slideDown();
										setTimeout(function () {
											$("#globalSuccessDiv").hide();
											$("#stationPage").load("${pageContext.request.contextPath}/service/commonRepairService/stationsGrop");
											$("#servicePage").load("${pageContext.request.contextPath}/service/commonRepairService/commonRepairServices?stationId="+$(obj).attr("dir"));
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
			});
		}else{
			alert("库存不足,不能出库!请重新选择备件或者订购!");
		}
	}
	
	
	function showParts(obj){
		var parts=""
		if($(obj).parent("td").children(":input[name='actualUseParts']").val()==""){
			parts=$(obj).parent("td").prev().prev().prev().text();
		}else{
			parts=$(obj).parent("td").children(":input[name='actualUseParts']").val();
		}
		$("#_curdDiv").load("${pageContext.request.contextPath}/sys/part/toSelectPartPage",function(){
			$("#_detailModal").modal("show");
			$("#content").load("${pageContext.request.contextPath}/sys/part/getParts?parts="+parts);
			$("#select").click(function(){
				var id=$("input[name='selectPartId']:checked").val();
				var des=$("#"+id).attr("des");
				var no=$("#"+id).attr("no");
				var stock=$("#"+id).attr("stock");
				var _new=$("#"+id).attr("newNumber");
				var _old=$("#"+id).attr("oldNumber");
				var _newold=$("input[name='newOld"+id+"']:checked").val();
				var rack=$("#"+id).attr("rack");
				if(stock<=0){
					if(confirm("库存为0,是否继续选择此备件!")){
						$(obj).parent("td").children(":input[name='actualUseParts']").val(no);
						$(obj).parent("td").children(":input[name='actualUsePartIds']").val(id);
						$(obj).parent("td").children(":input[name='shelves']").val(rack);
						$(obj).parent("td").children(":input[name='newOrOld']").val(_newold);
						//if(_newold=="new"){
							$(obj).parent("td").next().children(":input[name='inventoryNumbers']").val(stock);
						//}else{
							//$(obj).parent("td").next().children(":input[name='inventoryNumbers']").val(_old);
						//}
					}
				}else{
					$(obj).parent("td").children(":input[name='actualUseParts']").val(no);
					$(obj).parent("td").children(":input[name='actualUsePartIds']").val(id);
					$(obj).parent("td").children(":input[name='shelves']").val(rack);
					$(obj).parent("td").children(":input[name='newOrOld']").val(_newold);
					//if(_newold=="new"){
						$(obj).parent("td").next().children(":input[name='inventoryNumbers']").val(stock);
					//}else{
					//	$(obj).parent("td").next().children(":input[name='inventoryNumbers']").val(_old);
					//}
				}
				$("#_detailModal").modal("hide");
			});
		});
	}
	
	function search(){
		if($("#s_parts").val()==""){
			alert("备件搜索条件不能为空!!");
			return;
		}
		$("#content").load("${pageContext.request.contextPath}/sys/part/getParts?parts="+$("#s_parts").val());
	}
	
	function bachCancel(){
		if($("input[name='ids']:checked").length>0){
			var id="?";
			var stationId="";
			$("input[name='ids']:checked").each(function(){
				id=id+"ids="+$(this).val()+"&";
				stationId=$(this).attr("dir");
			});
			id=id+"oper=cancel";
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/service/commonRepairService/changeFlag"+id,
				beforeSend : function() {
					$("#loading").show();
				},
				success : function(msg) {
					if(msg.result=="success"){
						$("#globalSuccessDiv > strong").html("操作成功");
						$("#globalSuccessDiv").slideDown();
						setTimeout(function () {
							$("#globalSuccessDiv").hide();
							$("#stationPage").load("${pageContext.request.contextPath}/service/commonRepairService/stationsGrop");
							$("#servicePage").load("${pageContext.request.contextPath}/service/commonRepairService/commonRepairServices?stationId="+stationId);
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
	
	function bachOper(){
		if($("input[name='ids']:checked").length>0){
			$("input[name='ids']:checked").each(function(){
				var id="?";
				var stationId="";
				$("input[name='ids']:checked").each(function(){
					id=id+"ids="+$(this).val()+"&";
					stationId=$(this).attr("dir");
				});
				id=id+"oper=order";
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/service/commonRepairService/changeFlag"+id,
					beforeSend : function() {
						$("#loading").show();
					},
					success : function(msg) {
						if(msg.result=="success"){
							$("#globalSuccessDiv > strong").html("操作成功");
							$("#globalSuccessDiv").slideDown();
							setTimeout(function () {
								$("#globalSuccessDiv").hide();
								$("#stationPage").load("${pageContext.request.contextPath}/service/commonRepairService/stationsGrop");
								$("#servicePage").load("${pageContext.request.contextPath}/service/commonRepairService/commonRepairServices?stationId="+stationId);
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
		}else{
			alert("请选择要操作的记录!");
		}
	}
	
	function bachOut(){
		if($("input[name='ids']:checked").length>0){
			var bl=false;
			$("input[name='ids']:checked").each(function(){
				if($("#"+$(this).val()+"_ins").val()=="" || $("#"+$(this).val()+"_ins").val()=="0" ||  ($("#"+$(this).val()+"_ins").val()-$("#"+$(this).val()+"_apN").val()<0)){
					bl=true;
					return;
				}
			});
			if(bl){
				alert("有项目没有选择备件或备件库存不足,不能出库!");
			}else{
				var actualUseParts="";
				var actualUsePartIds="";
				var shelveses="";
				var ids="?";
				var inventoryNumbers="";
				var stationId="";
				var _newOrOld="";
				var isRepeats="";
				$("input[name='ids']:checked").each(function(){
					stationId=$(this).attr("dir");
					ids=ids+"ids="+$(this).val()+"&";
					actualUseParts=actualUseParts+"actualUseParts="+$("#"+$(this).val()+"_aup").val()+"&";
					actualUsePartIds=actualUsePartIds+"actualUsePartIds="+$("#"+$(this).val()+"_aupi").val()+"&";
					shelveses=shelveses+"shelveses="+$("#"+$(this).val()+"_sls").val()+"&";
					inventoryNumbers=inventoryNumbers+"inventoryNumbers="+$("#"+$(this).val()+"_ins").val()+"&";
					_newOrOld=_newOrOld+"newOrOld="+$("#"+$(this).val()+"_nOo").val()+"&";
					isRepeats=isRepeats+"isRepeats="+$("#"+$(this).val()+"_ird").val()+"&";
				});
				// upadted by jason
				var url="${pageContext.request.contextPath}/service/commonRepairService/outBound"+ids+actualUseParts+actualUsePartIds+shelveses+inventoryNumbers+_newOrOld;
				///////验证重维
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/service/commonRepairService/checkRepeatsAjax"+ids,
					beforeSend : function() {
						$("#loading").show();
					},
					success : function(msg) {
						if(msg.result=="success" || msg.result=="error_sys"){
							var replaceStr = "0";
							$.ajax({
								type : "POST",
								// upadted by jason
								url : url+isRepeats.replace(new RegExp(replaceStr,"gm"),"0"),
								beforeSend : function() {
									$("#loading").show();
								},
								success : function(msg) {
									if(msg.result=="success"){
										$("#globalSuccessDiv > strong").html("操作成功");
										$("#globalSuccessDiv").slideDown();
										setTimeout(function () {
											$("#globalSuccessDiv").hide();
											$("#stationPage").load("${pageContext.request.contextPath}/service/commonRepairService/stationsGrop");
											$("#servicePage").load("${pageContext.request.contextPath}/service/commonRepairService/commonRepairServices?stationId="+stationId);
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
							//alert("有重维记录,请单独处理完后,再批量操作!");
							var replaceStr = "0";
							if(confirm("重维,是否继续?")){
								$.ajax({
									type : "POST",
									// upadted by jason
									url : url+isRepeats.replace(new RegExp(replaceStr,"gm"),"1"),
									beforeSend : function() {
										$("#loading").show();
									},
									success : function(msg) {
										if(msg.result=="success"){
											$("#globalSuccessDiv > strong").html("操作成功");
											$("#globalSuccessDiv").slideDown();
											setTimeout(function () {
												$("#globalSuccessDiv").hide();
												$("#stationPage").load("${pageContext.request.contextPath}/service/commonRepairService/stationsGrop");
												$("#servicePage").load("${pageContext.request.contextPath}/service/commonRepairService/commonRepairServices?stationId="+stationId);
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
				});
				//////验证重维结束
			}
		}else{
			alert("请选择要操作的记录!");
		}
	}
</script>
<div class="panel panel-default div_screen">
	<div>
		<div style="float: left;">
			CallNo:<input name="callNo" id="s_callNo" class="input-control">
			服务站:<input name="stationName" id="s_stationName" class="input-control">
		</div>
		<div style="text-align: right;">
			<button class="btn btn-primary btn-sm" onclick="searchRq()">
				<span class="glyphicon glyphicon-search"></span>查询
			</button>
			<button class="btn btn-primary btn-sm" onclick="add('${pageContext.request.contextPath}/service/commonRepairService/addService')">
				<span class="glyphicon glyphicon-plus"></span>增加服务
			</button>
		</div>
	</div>
	<div id="stationPage">
	</div>
	<p>
	<div id="servicePage">
	</div>
</div>

<div id="_curdDiv"></div>
<jsp:include page="../../common/pageHis.jsp" />
<jsp:include page="../../common/bottom.jsp" />
