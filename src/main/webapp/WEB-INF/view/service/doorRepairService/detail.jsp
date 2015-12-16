<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 弹出页面 -->
<script type="text/javascript">
	$(function(){
		$("#printBtn").click(function(){
			$(".PrintArea").printArea();
		});
		$("#close").click(function(){
			$("#_detailModal").modal("hide");
		});
		if($("input[name='_faultType']:checked").val()=="HARD"){
			$(".parts_tr").show();
		}else{
			$(".parts_tr").hide();
		}
	});
</script>
<div class="modal fade" id="_detailModal">
		<div class="modal-dialog"
		style="width: 800px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h6 class="modal-title">&nbsp;</h6>
			</div>
			<div class="modal-body PrintArea">
				<div class="control-group panel panel-info" style="width: 700px;">
					<div class="panel-heading" style="text-align: center;"><H5>北京利华永文客户服务单</H5></div>
						<table class="table	table-bordered table-condensed" style="width: 100%;">
							<tbody>
								<tr>
									<td class="success" width="20%">维修单号:</td>
									<td align="left" width="30%"><input name="orders" value="${t.orders}" class="input-control" id="_orders" readonly="readonly"></td>
									<td class="success" width="20%">项目:</td>
									<td align="left">
										<select name="projectIdFk" id="_projectIdFk" disabled="disabled">
											<c:forEach items="${projects }" var="p">
												<option value="${p.id }" <c:if test='${t.projectIdFk==p.id }'>selected="selected"</c:if>>${p.cname }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td width="20%">CallNo:</td>
									<td align="left"><input name="callno" value="${t.callno}" class="input-control" id="_callno" readonly="readonly"></td>
									<td width="30%">产品服务机构:</td>
									<td align="left">利华永文笔记本服务中心</td>
								</tr>
								<tr>
									<td class="success" width="30%">联系电话:</td>
									<td align="left">01081725838</td>
									<td class="success" width="30%">服务地址:</td>
									<td align="left">北京回龙观同城街41-09</td>
								
								</tr>
								<tr>
									<td width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>客户姓名:</td>
									<td align="left"><input name="cusName" value="${t.cusName}" class="input-control" id="_cusName" readonly="readonly"></td>
									<td width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>联系电话:</td>
									<td align="left"><input name="cusTel" value="${t.cusTel}" class="input-control" id="_cusTel" readonly="readonly"></td>
								</tr>
								<tr>
									<td class="success" width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>机器序列号:</td>
									<td align="left"><input name="hostNumber" value="${t.hostNumber}" class="input-control" id="_hostNumber" readonly="readonly"></td>
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
									<td align="left"><input name="board" value="${t.board}" class="input-control" id="_board" readonly="readonly"></td>
									<td width="30%" class="success">内存:</td>
									<td align="left"><input name="memory" value="${t.memory}" class="input-control" id="_memory" readonly="readonly"></td>
								</tr>
								<tr>
									<td width="30%">键盘:</td>
									<td align="left"><input name="keyboard" value="${t.keyboard}" class="input-control" id="_keyboard" readonly="readonly"></td>
									<td width="30%">AC电源:</td>
									<td align="left"><input name="ac" value="${t.ac}" class="input-control" id="_ac" readonly="readonly"></td>
								</tr>
								<tr>
									<td width="30%" class="success">硬盘:</td>
									<td align="left"><input name="hardDisk" value="${t.hardDisk}" class="input-control" id="_hardDisk" readonly="readonly"></td>
									<td width="30%" class="success">外观:</td>
									<td align="left"><input name="appearance" value="${t.appearance}" class="input-control" id="_appearance" readonly="readonly"></td>
								</tr>
								<tr>
									<td width="30%">电池:</td>
									<td align="left"><input name="battery" value="${t.battery}" class="input-control" id="_battery" readonly="readonly"></td>
									<td width="30%">其他:</td>
									<td align="left"><input name="other" value="${t.other}" class="input-control" id="_other" readonly="readonly"></td>
								</tr>
								<tr>
									<td>报修故障:</td>
									<td colspan="3" align="left"><textarea rows="3" cols="80" name="repairFault" id="_repairFault" readonly="readonly">${t.repairFault }</textarea></td>
								</tr>
								<tr>
									<td width="100%" colspan="4">
									<div style="float: left;padding-left: 20px;">保留硬盘数据:
										<input type="checkbox" name="keepDiskDate" value="1" <c:if test='${t.keepDiskDate=="1"}'>checked="checked"</c:if> disabled="disabled"> 是
										<input type="checkbox" name="keepDiskDate" value="0" <c:if test='${t.keepDiskDate=="0"}'>checked="checked"</c:if> disabled="disabled"> 否
									</div>
									<div style="padding-right: 50px;text-align: right;">接收人:<input style="border-color: #878787; border-style: solid; border-top-width: 0px;border-right-width: 0px; border-bottom-width: 1px;border-left-width: 0px" >&nbsp;&nbsp;用户送修签字:<input style="border-color: #878787; border-style: solid; border-top-width: 0px;border-right-width: 0px; border-bottom-width: 1px;border-left-width: 0px" ></div>
									</td>
								</tr>
								<tr>
									<td width="30%" class="success">初检价格:</td>
									<td align="left"><input class="input-control" id="_referencePrice" name="referencePrice" value="${t.referencePrice }" readonly="readonly"></td>
									<td width="30%" class="success">日期:</td>
									<td align="left"><input class="input-control" name="acceptDate" value="${t.acceptDate }" readonly="readonly"><span class="glyphicon glyphicon-calendar"></span></td>
								</tr>
								<tr>
									<td colspan="4" align="left">故障处理: <input type="checkbox" name="_faultHandling" disabled="disabled" value="1" <c:if test='${t.faultHandling==1}'> checked="checked"</c:if>>已修复 <input type="checkbox" name="_faultHandling" disabled="disabled" value="2" <c:if test='${t.faultHandling==2}'> checked="checked"</c:if>> 未修复 <input type="checkbox" name="_faultHandling" disabled="disabled" value="3" <c:if test='${t.faultHandling==3}'> checked="checked"</c:if>> 客户放弃维修<input type="hidden" name="faultHandling" value="${t.faultHandling }" id="faultHandling"></td>
								</tr>
								<!-- 
								<tr>
									<td class="success">检验费:</td>
									<td colspan="3" align="left"><input readonly="readonly" class="input-control" name="inspectionFee" id="_inspectionFee" value="${t.inspectionFee }"></td>
								</tr> -->
								<tr><!-- id="i4" -->
									<td colspan="4" class="warning" style="text-align: left;">
										服务声明:<br>
										(1).请您做好数据或程序备份，因在维修过程中可能导致硬盘数据丢失。对此，利华用文电脑客户服务中心不承担相应责任。<br>
										(2).维修更换下来的备件（客户全额付款购买的备件除外），其所有权归利华用文电脑公司所有。<br>
										(3).若用户把机器送到利华永文电脑客户服务中心维修，用户在取机是凭利华永文服务维修单取机联取机。<br>
										(4).在通知到用户机器已修复可以取机算起，用户应及时到利华永文电脑客户服务中心取机。若超过一个月未取，则按每天5元收取机器保管费。若超过一年未取，将视为放弃该机所有权，该机由利华永文电脑公司处理。<br>
										(5).本公司检测费为80元，如客户放弃维修需要支付检测费，正常维修的予以免除。
									</td>
								</tr>
								<tr>
									<td align="left">备    注:</td>
									<td colspan="3" align="left"><textarea rows="3" cols="80" name="faultHandlingRemark" id="_faultHandlingRemark" readonly="readonly">${t.faultHandlingRemark }</textarea></td>
								</tr>
								<tr id="i1">
									<td colspan="4" class="success" align="left">故障类型: <input type="checkbox" disabled="disabled" name="_faultType" value="SOFT" <c:if test='${t.faultType=="SOFT"}'> checked="checked"</c:if>>软件服务 <input disabled="disabled" type="checkbox" name="_faultType" value="HARD" <c:if test='${t.faultType=="HARD"}'> checked="checked"</c:if>> 硬件服务<input type="hidden" name="faultType" value="${t.faultType }" id="faultType"><input type="checkbox" name="_faultType" value="SENCEND_REPER" <c:if test='${t.faultType=="SENCEND_REPER"}'> checked="checked"</c:if>>二级维修 </td>
								</tr>
								<!-- 硬件开始 -->
								<tr class="parts_tr">
									<td width="5%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>服务站:</td>
									<td align="left" width="10%">
										<select name="stationId" id="_stationId" disabled="disabled">
											<option value=""></option>
											<c:forEach items="${stations }" var="s">
												<option value="${s.id }" <c:if test="${s.id==tt.stationId}">selected="selected"</c:if>>${s.name }</option>
											</c:forEach>
										</select>
									</td>
									<td ><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>申请时间:</td>
									<td align="left"><input name="applyDate" disabled="disabled" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"  value="${tt.applyDate}" class="input-control" id="_appr_Date" ><span class="glyphicon glyphicon-calendar"></span></td>
								</tr>
								<tr class="parts_tr">
									<td  class="success"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>机器型号:</td>
									<td align="left"><input name="machineModel" disabled="disabled" value="${tt.machineModel}" class="input-control" id="_machineModel" onblur="this.value=this.value.toUpperCase()"></td>
									<td   class="success"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>机器序列号:</td>
									<td align="left"><input name="serialNumber" disabled="disabled" value="${tt.serialNumber}" class="input-control" id="_serial" >
										<input name="returnFlag" value="0" class="input-control" id="_serial" type="hidden">
									</td>
								</tr>
								<tr class="parts_tr">
									<td ><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>申请备件号:</td>
									<td align="left">
										<input id="_app_partNo" disabled="disabled" class="input-control" onblur="this.value=this.value.toUpperCase()" value="${tt.applyParts }">
										<input name="app_partId" id="_app_partId" type="hidden" disabled="disabled" value="${tt.applyPartsId }">
									</td>
									<td >备件名称:</td>
									<td align="left">
									<input disabled="disabled" class="input-control" id="_partName" readonly="readonly" value="${PARTS[tt.applyPartsId].name}">
									</td>
								</tr>
								<!-- 硬件结束 
								<tr id="i0">
									<td colspan="4" align="left">检验费:<input class="input-control" name="inspectionFee" id="_inspectionFee" value="${t.inspectionFee }"></td>
								</tr>-->
								<tr id="i2">
									<td align="left">处理描述: </td>
									<td colspan="3" align="left"><textarea rows="3" readonly="readonly" cols="80" name="processDes" id="_processDes">${t.processDes }</textarea></td>
								</tr>
								<tr id="i3">
									<td align="left" class="success" >费用: </td>
									<td colspan="3" style="text-align:left;"><input size="80" readonly="readonly" name="processCost" id="_processCost" value="${t.processCost }"><b style="font-size: 20;">RMB</b></td>
								</tr>
								<tr id="i5">
									<td width="80%" colspan="4">
										<div style="float: left;padding-left: 20px;">维修工程师:<input style="border-color: #878787; border-style: solid; border-top-width: 0px;border-right-width: 0px; border-bottom-width: 1px;border-left-width: 0px" ></div>
										<div style="padding-right: 50px;text-align: right;">用户取机签字:<input style="border-color: #878787; border-style: solid; border-top-width: 0px;border-right-width: 0px; border-bottom-width: 1px;border-left-width: 0px" ></div>
									</td>
								</tr>
								<tr id="i6">
									<td width="80%" colspan="4">
										<div style="text-align: left;padding-left: 20px;">日期:<input name="repairDate" class="input-control"  value="${t.repairDate }" readonly="readonly"><span class="glyphicon glyphicon-calendar"></span></div>
									</td>
								</tr>
								<tr>
									<td width="30%">用户反馈信息:</td>
									<td align="left">
										<div>
											维修后的机器工作是否属于正常<br>
												<input type="checkbox" value="1" disabled="disabled" <c:if test='${"1"==t.feedback }'>checked="checked"</c:if>>是	<input type="checkbox" value="0" disabled="disabled" <c:if test='${"0"==t.feedback }'>checked="checked"</c:if>>否<br>
											取机时请注意以下事项:
											<br>
											1.所维修的机器已经检验,功能正常<br>
											2.请您确认机器的附件是否已交付
										</div>
									</td>
									<td width="30%" colspan="2">
										<div style="text-align: left;">
											欢迎您留下对我们服务的宝贵意见:<br>
											<input type="checkbox" value="1" disabled="disabled" <c:if test='${"1"==t.advice }'>checked="checked"</c:if>>非常满意<input type="checkbox" value="2" disabled="disabled" <c:if test='${"2"==t.advice }'>checked="checked"</c:if>>满意<input type="checkbox" value="3" disabled="disabled" <c:if test='${"3"==t.advice }'>checked="checked"</c:if>>一般<input type="checkbox" value="4" disabled="disabled" <c:if test='${"4"==t.advice }'>checked="checked"</c:if>>不满意<input type="checkbox" value="5" disabled="disabled" <c:if test='${"5"==t.advice }'>checked="checked"</c:if>>很不满意
											<br>
											不满意原因及其他建议:<textarea rows="3" cols="50" disabled="disabled" name="opinion" id="_opinion">${t.opinion }</textarea>
											<br>
											反馈信息和评价是用户签字时必填项,如果寄修服务可不填.
											<br>
											用户签字:________	日期___年___月___日
										</div>
									</td>
								</tr>
							</tbody>
						</table>
				</div>							
			</div>

			<div class="modal-footer">				
				<button type="button" class="btn btn-primary" id="printBtn">打 印</button>
				
			</div>
		</div>
	</div>
</div>