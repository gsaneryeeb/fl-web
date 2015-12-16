<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript">
	$(function(){
		$("#printBtn").click(function(){
			$(".PrintArea").printArea();
		});
		$("#_repeats").click(function(){
			if($(this).prop("checked")){
				$(this).prop("checked",false);
			}else{
				$(this).prop("checked",true);
			}
		});
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
					<div class="panel-heading" style="text-align: center;"><H5>送修维修单</H5></div>
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<td class="success" width="20%">维修单号:</td>
									<td align="left" width="30%"><input name="orders" value="${t.orders}" class="input-control" id="_orders" readonly="readonly"></td>
									<td width="20%" class="success">项目:</td>
									<td align="left">
										<select name="projectIdFk" id="_projectIdFk" onfocus="this.defaultIndex=this.selectedIndex;" onchange="this.selectedIndex=this.defaultIndex;">
											<c:forEach items="${projects }" var="p">
												<option value="${p.id }" <c:if test='${t.projectIdFk==p.id }'>selected="selected"</c:if>>${p.cname }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>PPID:</td>
									<td align="left"><input name="ppid" value="${t.ppid}" class="input-control" id="_ppid" readonly="readonly">	
									<select name="repeatsType" disabled="disabled">
										<c:forEach items="${types }" var="type" >
											<option value="${type.key }" <c:if test='${t.repeatsType==type.key }'>selected="selected"</c:if> dir="${type.value }">${type.value }</option>
										</c:forEach>
									</select>
									<div class="hidden"><input type="checkbox" id="_repeats" name="repeats"  value="1" <c:if test='${t.repeats==1}'> checked="checked"</c:if>> 重复</div></td>
									<td width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>CASENO:</td>
									<td align="left"><input name="caseno" value="${t.caseno}" class="input-control" id="_caseno" readonly="readonly"></td>
								</tr>
								<tr>
									<td class="success" width="30%">服务站:</td>
									<td align="left">
										<select style="width: 250px;" name="stationId" id="_stationId"  onfocus="this.defaultIndex=this.selectedIndex;" onchange="this.selectedIndex=this.defaultIndex;">
											<c:forEach items="${stations }" var="s">
												<option value="${s.id }" <c:if test='${s.id==t.stationId }'>selected="selected"</c:if> dir="${s.name }">${s.name }</option>
											</c:forEach>
										</select>
									</td>
									<td class="success" width="30%">联系电话:</td>
									<td align="left"><input name="tel" value="${t.tel}" class="input-control" id="_tel" readonly="readonly"></td>
								
								</tr>
								<tr>
									<td width="30%">机器型号:</td>
									<td align="left"><input name="machineModel" value="${t.machineModel}" class="input-control" id="_machineModel" readonly="readonly"></td>
									<td width="30%">主板型号:</td>
									<td align="left"><input name="board" value="${t.board}" class="input-control" id="_board" readonly="readonly"></td>
								</tr>
								<tr>
									<td class="success" width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>服务站发件时间:</td>
									<td align="left">
									<label><input value="${t.stataionSendDate}" readonly="readonly" id="_stataionSendDate" name="stataionSendDate"  ><span class="glyphicon glyphicon-calendar"></span></label>
									</td>
									<td class="success" width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>派单时间时间:</td>
									<td align="left">
									<label><input value="${t.sendDate}" readonly="readonly" id="_sendDate" name="sendDate"  ><span class="glyphicon glyphicon-calendar"></span></label>
									</td>
								</tr>
								<tr>
									<td>故障描述:</td>
									<td ></td>
									<td width="30%">费用:</td>
									<td align="left"><input name="cost" value="${t.cost}" readonly="readonly"  class="input-control" ></td>
								</tr>
								<tr>
									<td colspan="4" align="left"><textarea rows="3" cols="102" name="faultDes" readonly="readonly" id="_faultDes">${t.faultDes }</textarea></td>
								</tr>
								<tr>
									<td colspan="3" align="right">备注:</td>
									<td align="left">
									<label><input value="${t.faultRemark}" readonly="readonly" id="_faultRemark" name="faultRemark" ></label>
									</td>
								</tr>
								<tr>
									<td class="success" width="30%">到达时间:</td>
									<td align="left">
									<label><input value="${t.arrivalTime}" readonly="readonly" id="_arrivalTime" name="arrivalTime"  ><span class="glyphicon glyphicon-calendar"></span></label>
									</td>
									<td class="success" width="30%">工程师:</td>
									<td align="left">
										<select name="engineerId" id="_engineerId" onfocus="this.defaultIndex=this.selectedIndex;" onchange="this.selectedIndex=this.defaultIndex;">
											<c:forEach items="${engineers }" var="e">
												<option value="${e.id }" <c:if test='${e.id==t.engineerId }'> selected="selected"</c:if> dir="${e.uName }">${e.userNo }_${e.uName }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>故障处理:</td>
									<td></td>
									<td class="success" width="30%">处理结果:</td>
									<td align="left">
									<label>
										<select id="_result" name="result"  onfocus="this.defaultIndex=this.selectedIndex;" onchange="this.selectedIndex=this.defaultIndex;">
											<option></option>
											<c:forEach items="${RESULT }" var="e">
												<option value="${e.key }" <c:if test='${e.key==t.result }'> selected="selected"</c:if> dir="${e.value }">${e.value }</option>
											</c:forEach>
										</select>	
									</label>
									</td>
								</tr>
								<tr>
									<td class="success" width="30%">更换材料:</td>
									<td align="left">
									<label><input value="${t.replacementMaterial}" readonly="readonly" id="_replacementMaterial" name="replacementMaterial" class="input-control" ></label>
									</td>
									<td class="success" width="30%">故障原因:</td>
									<td align="left">
									<label><input value="${t.faultReason}" readonly="readonly" id="_faultReason" name="faultReason" class="input-control" ></label>
									</td>
								</tr>
								<tr>
									<td width="30%">检测人:</td>
									<td align="left">
									<label><input value="${t.surveyor}" class="input-control"  readonly="readonly"></label>
									</td>
									<td width="30%">检测日期:</td>
									<td align="left">
									<label><input value="${t.surveyorDate}" readonly="readonly" id="_surveyorDate"  name="surveyorDate"  ><span class="glyphicon glyphicon-calendar"></span></label>
									</td>
								</tr>
								<tr>
									<td class="success" width="30%">备注:</td>
									<td align="left">
									<label><input value="${t.remark}" readonly="readonly" id="_remark" class="input-control"  name="remark"></label>
									</td>
									<td class="success" width="30%"><!-- 取件快递: -->快递发出时间</td>
									<td align="left">
									<!-- <label><input value="${t.transportMinistry}" readonly="readonly" id="_transportMinistry" class="input-control"  name="transportMinistry" ></label> -->
									<label><input value="${t.expressSendTime}" readonly="readonly"><span class="glyphicon glyphicon-calendar"></span></label>
									</td>
								</tr>
								<tr>
									<td width="30%">快递单号:</td>
									<td align="left">
									<label><input value="${t.expressNo}" readonly="readonly" class="input-control"  id="_expressNo" name="expressNo" ></label>
									</td>
									<td width="30%">快递到达时间:</td>
									<td align="left">
									<label><input value="${t.expressArrivalTime}" readonly=readonly><span class="glyphicon glyphicon-calendar"></span></label>
									</td>
								</tr>
								<tr>
									<td colspan="4" align="left" style="padding-right: 40px;" >
										&nbsp;&nbsp;同事你好,服务过程中备件若有任何问题,欢迎拨打北京技术部电话:010-81725838-603 及时沟通,谢谢!
									</td>
								</tr>
								
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="modal-footer" style="padding-right: 50px;">
				
				<button type="button" class="btn btn-default" id="printBtn">打 印</button>
			</div>
		</div>
	</div>
</div>
