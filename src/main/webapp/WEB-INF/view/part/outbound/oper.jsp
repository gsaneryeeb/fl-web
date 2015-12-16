<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript">
	$(function(){
		if($("#faultHandling").val()=="" || $("#faultHandling").val()=="2"){
			$("#i1").hide();
			$("#i2").hide();
			$("#i3").hide();
			$("#i4").hide();
			$("#i5").hide();
			$("#i6").hide();
		}
		$("#printBtn").click(function(){
			$(".PrintArea").printArea();
		});
		$("input[name='_faultType']").click(function(){
			var is=false;
			if($(this).is(":checked")){
				is=true;
				$("#faultType").val($(this).val());
			}else{
				$("#faultType").val("");
			}
			$("input[name='_faultType']").attr('checked',false);
			if(is==true){
				$(this).prop('checked',true);
			}else{
				$(this).prop('checked',false);
			}
		});
		$("input[name='keepDiskDate']").click(function(){
			var is=false;
			if($(this).is(":checked")){
				is=true;
			}
			$("input[name='keepDiskDate']").attr('checked',false);
			if(is==true){
				$(this).prop('checked',true);
			}else{
				$(this).prop('checked',false);
			}
		});
		$("input[name='_faultHandling']").click(function(){
			var is=false;
			if($(this).is(":checked")){
				is=true;
				$("#faultHandling").val($(this).val());
				if($(this).val()=="2"){
					$("#i1").hide();
					$("#i2").hide();
					$("#i3").hide();
					$("#i4").hide();
					$("#i5").hide();
					$("#i6").hide();
				}else{
					$("#i1").show();
					$("#i2").show();
					$("#i3").show();
					$("#i4").show();
					$("#i5").show();
					$("#i6").show();
				}
			}else{
				$("#faultHandling").val("");
				$("#i1").hide();
				$("#i2").hide();
				$("#i3").hide();
				$("#i4").hide();
				$("#i5").hide();
				$("#i6").hide();
			}
			$("input[name='_faultHandling']").attr('checked',false);
			if(is==true){
				$(this).prop('checked',true);
			}else{
				$(this).prop('checked',false);
			}
		});
		
	});
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
					<div class="panel-heading" style="text-align: center;"><H5>维修单</H5></div>
					<form id="_operForm" action="${pageContext.request.contextPath}/service/doorRepairService/addSave" method="${_method }">
						<input type="hidden" value="${t.id}" name="id">
						<input type="hidden" value="${t.needPart}" name="needPart">
						<table class="table	table-bordered table-condensed" style="width: 100%;">
							<tbody>
								<tr>
									<td class="success" width="20%">维修单号:</td>
									<td align="left" width="30%"><input name="orders" value="${t.orders}" class="input-control" id="_orders" readonly="readonly"></td>
									<td width="20%">项目:</td>
									<td align="left">
										<select name="projectIdFk" id="_projectIdFk">
											<c:forEach items="${projects }" var="p">
												<option value="${p.id }" <c:if test='${t.projectIdFk==p.id }'>selected="selected"</c:if>>${p.cname }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td class="success" width="20%">CallNo:</td>
									<td align="left"><input name="callno" value="${t.callno}" class="input-control" id="_callno" readonly="readonly"></td>
									<td width="30%">产品服务机构:</td>
									<td align="left">利华永文笔记本服务中心<input name="serviceAgencies" value="利华永文笔记本服务中心" id="_serviceAgencies" type="hidden"></td>
								</tr>
								<tr>
									<td width="30%">联系电话:</td>
									<td align="left">01081725838<input name="tel" value="01081725838" id="_tel" type="hidden"></td>
									<td class="success" width="30%">服务地址:</td>
									<td align="left">北京回龙观同城街41-09<input name="serviceAddress" value="北京回龙观同城街41-09" id="_serviceAddress" type="hidden"></td>
								
								</tr>
								<tr>
									<td width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>姓名:</td>
									<td align="left"><input name="cusName" value="${t.cusName}" class="input-control" id="_cusName" ></td>
									<td width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>联系电话:</td>
									<td align="left"><input name="cusTel" value="${t.cusTel}" class="input-control" id="_cusTel" ></td>
								</tr>
								<tr>
									<td class="success" width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>主机编号:</td>
									<td align="left"><input name="hostNumber" value="${t.hostNumber}" class="input-control" id="_hostNumber" ></td>
									<td class="success" width="30%"></td>
									<td align="left"></td>
								</tr>
								<tr>
									<td width="30%">产品标准配置(选填)</td>
									<td align="left"></td>
									<td width="30%"></td>
									<td align="left"></td>
								</tr>
								<tr>
									<td width="30%" class="success">主板:</td>
									<td align="left"><input name="board" value="${t.board}" class="input-control" id="_board" ></td>
									<td width="30%" class="success">内存:</td>
									<td align="left"><input name="memory" value="${t.memory}" class="input-control" id="_memory" ></td>
								</tr>
								<tr>
									<td width="30%">键盘:</td>
									<td align="left"><input name="keyboard" value="${t.keyboard}" class="input-control" id="_keyboard" ></td>
									<td width="30%">AC电源:</td>
									<td align="left"><input name="ac" value="${t.ac}" class="input-control" id="_ac" ></td>
								</tr>
								<tr>
									<td width="30%" class="success">硬盘:</td>
									<td align="left"><input name="hardDisk" value="${t.hardDisk}" class="input-control" id="_hardDisk" ></td>
									<td width="30%" class="success">外观:</td>
									<td align="left"><input name="appearance" value="${t.appearance}" class="input-control" id="_appearance" ></td>
								</tr>
								<tr>
									<td width="30%">电池:</td>
									<td align="left"><input name="battery" value="${t.battery}" class="input-control" id="_battery" ></td>
									<td width="30%">其他:</td>
									<td align="left"><input name="other" value="${t.other}" class="input-control" id="_other" ></td>
								</tr>
								<tr>
									<td>保修故障:</td>
									<td colspan="3" align="left"><textarea rows="3" cols="80" name="repairFault" id="_repairFault">${t.repairFault }</textarea></td>
								</tr>
								<tr>
									<td width="100%" colspan="4">
									<div style="float: left;padding-left: 20px;">保留硬盘数据:
										<input type="checkbox" name="keepDiskDate" value="1" <c:if test='${t.keepDiskDate=="1"}'>checked="checked"</c:if>> 是
										<input type="checkbox" name="keepDiskDate" value="0" <c:if test='${t.keepDiskDate=="0"}'>checked="checked"</c:if>> 否
									</div>
									<div style="padding-right: 50px;text-align: right;">接收人:${t.acceptPersonName }&nbsp;&nbsp;用户送修签字:<input class="input-control" name="repairCus" ${t.repairCus }></div>
									</td>
								</tr>
								<tr>
									<td colspan="4" align="right" style="padding-right: 55px;">日期:<input class="input-control" name="acceptDate" value="${t.acceptDate }" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" ><span class="glyphicon glyphicon-calendar"></span></td>
								</tr>
								<tr>
									<td colspan="4" class="success" align="left">故障处理: <input type="checkbox" name="_faultHandling" value="1" <c:if test='${t.faultHandling==1}'> checked="checked"</c:if>>已修复 <input type="checkbox" name="_faultHandling" value="2" <c:if test='${t.faultHandling==0}'> checked="checked"</c:if>> 未修复<input type="hidden" name="faultHandling" value="${t.faultHandling }" id="faultHandling"></td>
								</tr>
								<tr ><!-- id="i4" -->
									<td colspan="4" class="warning" style="text-align: left;">
										注意事项:<br>
										&nbsp;&nbsp;&nbsp;&nbsp;对于计算机类产品，用户在维修前应做好数据的备份，用户应对其数据的安全性自行负责，产品服务机构不承担数据、程序或可移动存储介质的损坏或丢失的责任。用户应在收到取机通知三个月内到本服务中心取机，逾期不取的我方不对维修产品的毁损灭失风险承担任何责任。请确认您已经了解在维修过程中您的机器内的现有数据和程序可能会损坏或丢失，已经认真阅读和完全了解并同意以上声明条款内容。
									</td>
								</tr>
								<tr>
									<td align="left">备    注:</td>
									<td colspan="3" align="left"><textarea rows="3" cols="80" name="faultHandlingRemark" id="_faultHandlingRemark">${t.faultHandlingRemark }</textarea></td>
								</tr>
								<tr id="i1">
									<td colspan="4" class="success" align="left">故障类型: <input type="checkbox" name="_faultType" value="SOFT" <c:if test='${t.faultType=="SOFT"}'> checked="checked"</c:if>>软件服务 <input type="checkbox" name="_faultType" value="HARD" <c:if test='${t.faultType=="HARD"}'> checked="checked"</c:if>> 硬件服务<input type="hidden" name="faultType" value="${t.faultType }" id="faultType"></td>
								</tr>
								<tr id="i2">
									<td align="left">处理描述: </td>
									<td colspan="3" align="left"><textarea rows="3" cols="80" name="processDes" id="_processDes">${t.processDes }</textarea></td>
								</tr>
								<tr id="i3">
									<td align="left" class="success" >费用: </td>
									<td colspan="3" style="text-align:left;"><input size="80" name="processCost" id="_processCost" value="${t.processCost }"><b style="font-size: 20;">RMB</b></td>
								</tr>
								
								<tr id="i5">
									<td width="80%" colspan="4">
										<div style="float: left;padding-left: 20px;">维修工程师:${t.repairRersonName }</div>
										<div style="padding-right: 50px;text-align: right;">用户取机签字:<input class="input-control" name="fetchCus"></div>
									</td>
								</tr>
								<tr id="i6">
									<td width="80%" colspan="4">
										<div style="text-align: left;padding-left: 20px;">日期:<input name="repairDate" class="input-control"  value="${t.repairDate }" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"><span class="glyphicon glyphicon-calendar"></span></div>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="modal-footer" style="padding-right: 50px;">
				<button type="button" class="btn btn-default" id="_saveBtn" checkFuc="checkSave">保存</button>
				
				<!-- 
				<button type="button" class="btn btn-default" id="_finishBtn" checkFuc="finishCheck">完成</button>
				 -->
				<button type="button" class="btn btn-default" id="printBtn">打 印</button>
			</div>
		</div>
	</div>
</div>
