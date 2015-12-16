<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript">

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
});

</script>
<div class="modal fade" id="doorRepairModal">
	<div class="modal-dialog"
		style="width: 800px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h6 class="modal-title">&nbsp;</h6>
			</div>
			<div class="modal-body PrintArea">
				<div class="control-group panel panel-info" style="width: 700px;">
					<!-- <div class="panel-heading" style="text-align: center;"><H5>备件申请</H5></div> -->
					<form id="_doorRepairModalForm" action="${pageContext.request.contextPath}/part/outbound/addSave" method="POST">
						<input type="hidden" value="${t.id}" name="doorId">
						<table class="table	table-bordered table-condensed" style="width: 100%;">
							<tbody>
								<tr>
									<td width="5%" class="success"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>服务站:</td>
									<td align="left" width="10%">
										<select name="stationId" id="_stationId">
											<c:forEach items="${stations }" var="s">
												<option value="${s.id }">${s.name }</option>
											</c:forEach>
										</select>
									</td>
									<td width="20%" class="success"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>CallNo:</td>
									<td align="left" width="30%"><input id="_callno" name="callno" value="${t.callno}" class="input-control" readonly="readonly"></td>
								</tr>
								<tr>
									<td >客户姓名:</td>
									<td align="left"><input name="cusName" value="${t.cusName}" class="input-control" readonly="readonly"></td>
									<td ><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>申请时间:</td>
									<td align="left"><input name="appr_Date" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"  value="${appr_date}" class="input-control" id="_appr_Date" ><span class="glyphicon glyphicon-calendar"></span></td>
								</tr>
								<tr>
									<td  class="success"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>机器型号:</td>
									<td align="left"><input name="machineModel" value="${t.board}" class="input-control" id="_machineModel" onblur="this.value=this.value.toUpperCase()"></td>
									<td  class="success"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>机器序列号:</td>
									<td align="left"><input name="serial" value="${t.memory}" class="input-control" id="_serial" ></td>
								</tr>
								<tr>
									<td ><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>申请备件号:</td>
									<td align="left">
										<input id="_app_partNo" class="input-control" onblur="this.value=this.value.toUpperCase()">
										<input name="app_partId" id="_app_partId" type="hidden">
									</td>
									<td >备件描述:</td>
									<td align="left"><input name="part_des" class="input-control" id="_part_des" readonly="readonly"></td>
								</tr>
								<tr>
									<td ><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>申请数量:</td>
									<td align="left"><input name="applyNumber" class="input-control" id="_applyNumber" value="1" readonly="readonly"></td>
									<td ><!-- 是否返回备件 --><input type="hidden" name="returnFlag" id="returnFlag" value="1"></td>
									<td align="left"><!--  <input type="checkbox" id="_returnFlag" value="1">--></td>
								</tr>
								<tr>
									<td class="success" width="20%">维修类型:</td>
									<td align="left" >
										<select name="type" id="_type">
											<option value="04" selected="selected">客户上门维修服务</option>
										</select>
									</td>
									<td width="20%" class="success">项目ID:</td>
									<td align="left">
										<select name="projectId" id="_projectIdFk">
											<c:forEach items="${projects }" var="p">
												<option value="${p.id }">${p.cname }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="modal-footer" style="padding-right: 50px;">
				<button type="button" class="btn btn-default" id="doorRepairModalSaveBtn" >保存</button>
				
			</div>
		</div>
	</div>
</div>
