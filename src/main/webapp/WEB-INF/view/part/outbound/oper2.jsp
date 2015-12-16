<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript">
var count=0;
$(function(){
	$("#_app_partNo").blur(function(){
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/sys/part/checkExist?no="+$("#_app_partNo").val(),
			beforeSend : function() {
			},
			success : function(msg) {
				if(msg.result!="success"){
				}else{
					$("#_part_des").val(msg.ex);
					$("#_app_partId").val(msg.message);
				}
			}
		});
	});
	$("#_returnFlag").click(function(){
		if($(this).is(":checked")){
			$("#returnFlag").val("1");
		}else{
			$("#returnFlag").val("0");
		}
	});
	$("#diaAddBtn").click(function(){
	    count++;
		$.post("${pageContext.request.contextPath}/service/commonRepairService/addParts",
		function(data, status, xhr) {
			if (status == "success") {
				$(".table tbody #segment_start").after(data);
			}
		});
	});
});

function showParts2(obj){
	$("#_partsDiv").load("${pageContext.request.contextPath}/sys/part/toSelectPartPage",function(){
		$("#_detailModal").modal("show");
		$("#content").load("${pageContext.request.contextPath}/sys/part/getParts?parts=",function(){
			$(".returnHiden").hide();
		});
		$("#select").click(function(){
			var id=$("input[name='selectPartId']:checked").val();
			var no=$("#"+id).attr("no");
			var des=$("#"+id).attr("des");
			var name=$("#"+id).attr("partname");
			$(obj).children(":input[name='partses']").val(no);
			$(obj).children(":input[name='partIds']").val(id);
			$(obj).parent("td").next().next().children(":input[name='remarks']").val(des);
			$(obj).parent("td").next().next().children(":input[name='partsName']").val(name);
			$("#_detailModal").modal("hide");
		});
	});
}

function deleteTr(obj){
    count--;
	$(obj).parent("td").parent("tr").remove();	
};

function change(station){
	if($("#_stationId :checked").attr("no")=="BJ09"){
		$("#_cusDep").css("background-color","");
		$("#_cusAddress").css("background-color","");
		$("#_cusTel").css("background-color","");
		//$("#_cusContactTime").css("background-color","");
		$("#_cusContactTime").css("background-color","#C7C7C7");
		$("#_faultRemark").css("background-color","#C7C7C7");
		$("#_solutionTime").css("background-color","#C7C7C7");
		$("#diaAddBtn").attr('disabled',"true");
		
		$("#_staffNo").css("background-color","");
		$("#_allocateEngineer").css("background-color","");
		$("#_serviceNo").css("background-color","");
		//$("#_solutionTime").css("background-color","");
		$(".OTHER").show();
	}else{
		$("#_cusDep").css("background-color","#C7C7C7");
		$("#_cusAddress").css("background-color","#C7C7C7");
		$("#_cusTel").css("background-color","#C7C7C7");
		$("#_cusContactTime").css("background-color","#C7C7C7");
		$("#_staffNo").css("background-color","#C7C7C7");
		$("#_allocateEngineer").css("background-color","#C7C7C7");
		$("#_serviceNo").css("background-color","#C7C7C7");
		$("#_solutionTime").css("background-color","#C7C7C7");
		$("#_faultRemark").css("background-color","");
		$("#_solutionTime").css("background-color","");
		$('#diaAddBtn').removeAttr("disabled"); 
		$(".OTHER").hide();
	}
}
</script>
<div class="modal fade" id="_operModal">
	<div class="modal-dialog"
		style="width: 800px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h6 class="modal-title">&nbsp;</h6>
			</div>
			<div class="modal-body PrintArea">
				<div class="control-group panel panel-info" style="width: 700px;">
					<!-- <div class="panel-heading" style="text-align: center;"><H5>IBM服务申请</H5> </div>-->
					<form id="_operForm" action="${pageContext.request.contextPath}/service/commonRepairService/updateSave" method="POST">
						<input type="hidden" value="${t.id }" name="id">
						<table class="table	table-bordered table-condensed" style="width: 100%;">
							<tbody>
								<tr>
									<td width="20%" class="success">服务站:</td>
									<td align="left" width="10%">
										${t.station }
									</td>
									<td width="20%" class="success">CallNo:</td>
									<td align="left" width="30%">${t.callno}</td>
								</tr>
								<tr>
									<td >客户部门:</td>
									<td align="left">${t.cusDep}</td>
									<td >维修类型:</td>
									<td align="left">
										<select id="_p_type" disabled="disabled">
											<option value="MEDICAL" <c:if test="${t.type=='MEDICAL'}"> selected="selected" </c:if>>保外服务</option>
											<option value="NON_LOSS" <c:if test="${t.type=='NON_LOSS'}"> selected="selected" </c:if>>保内非损</option>
											<option value="MEDICAL_LOSS" <c:if test="${t.type=='MEDICAL_LOSS'}"> selected="selected" </c:if>>保外非损</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="success">客户姓名:</td>
									<td align="left">${t.cusName}</td>
									<td class="success">客户地点:</td>
									<td align="left">${t.cusAddress}</td>
								</tr>
								<tr>
									<td >联系电话:</td>
									<td align="left">${t.cusTel}</td>
									<td ><c:if test="${staitonMap[t.stationIdFk].no =='BJ09'}"><span class="BJ glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span></c:if>电话联系客户时间:</td>
									<td align="left">
										<c:if test="${staitonMap[t.stationIdFk].no =='BJ09'}">
											<label><input name="cusContactTime" value="" class="input-control" id="_cusContactTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"><span class="glyphicon glyphicon-calendar"></span></label>
										</c:if>
										<c:if test="${staitonMap[t.stationIdFk].no !='BJ09'}">${t.cusContactTime}</c:if>
									</td>
								</tr>
								<tr>
									<td class="success">员工编号:</td>
									<td align="left">${t.staffNo}</td>
									<td class="success">分配工程师:</td>
									<td align="left">
										${t.allocateEngineer }
									</td>
								</tr>
								<tr>
									<td >申请时间:</td>
									<td align="left">${t.applyDate}</td>
									<td >服务单号:</td>
									<td align="left">${t.serviceNo}</td>
									
								</tr>
								<tr>
									<td  class="success">机器型号:</td>
									<td align="left">${t.machineModel}</td>
									<td  class="success">机器序列号:</td>
									<td align="left">${t.serialNumber}</td>
								</tr>
								<tr>
									<td >故障描述:</td>
									<td> ${t.fault }</td>
									<td ><span class="BJ glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>解决问题方案:</td>
									<td align="left"><input name="result" value="${t.result}" class="input-control" id="_result"></td>
								</tr>
								<tr>
									<td align="left" colspan="4">
										
										<button style="text-align: right;" id="diaAddBtn" type="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus"></span>添加备件</button>
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<table class="table table-condensed table-nutrition">
											<tr>
												<td width="30%">备件号</td>
												<td>申请数</td>
												<td>备件名称</td>
												<td>操作</td>
											</tr>
											<tr id="segment_start" class="hidden"></tr>
    										<tr id="segment_end" class="hidden"></tr>
										</table>
									</td>
								</tr>
								<tr>
									<td  class="success">备注:</td>
									<td align="left"><input name="faultRemark" value="${t.faultRemark}" class="input-control" id="_faultRemark"></td>
									<td  class="success"><span class="BJ glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>服务解决时间:</td>
									<td align="left"><input id="_solutionTime" name="solutionTime" value="${t.solutionTime}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"   class="input-control" id="_solutionTime" ><span class="glyphicon glyphicon-calendar"></span></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="modal-footer" style="padding-right: 50px;">
				<button type="button" class="btn btn-default" id="saveBtn" >保存</button>
				
			</div>
		</div>
	</div>
</div>
<div id="_partsDiv"></div>
