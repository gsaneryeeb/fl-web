<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table style="width: 100%;" frame="below" bordercolorlight="#f5f5f5" class="panel-heading">
		<tr bgcolor="#f5f5f5" height="35px">
			<td style="padding-left: 10px">查询结果</td>
			<td align="right">
				<button class="btn btn-primary btn-sm" onclick="bachOut()">
					出库
				</button>
				<button class="btn btn-primary btn-sm" onclick="bachOper()">
					订购
				</button>
				<button class="btn btn-primary btn-sm" onclick="bachCancel()">
					取消
				</button>
			</td>
		</tr>
</table>
<table id="diagnosisTable" class="table table-condensed table-nutrition">
	<tr>
		<td>
			<div>
				<div class="table-responsive nutrition-div content_scroll" >
					<form id="diagnosisForm">
						<table class="table table-condensed table-nutrition">
							<thead>
								<tr>
									<td width="40">选择</td>
									<td width="60">服务站</td>
									<td width="60">CallNo</td>
									<td width="50">项目ID</td>
									<td width="80">客户姓名</td>
									<td width="100">申请时间</td>
									<td width="60">机器型号</td>
									<td width="80">机器序列号</td>
									<td width="80">申请备件号</td>
									<td width="80">备件名称</td>
									<td width="60">申请数</td>
									<td width="100">实出备件号</td>
									<td width="60">库存</td>
									<td width="110">维修类型</td>
									<!-- <td width="100">备注</td> -->
									<td width="100">架位号</td>
									<td width="60">状态</td>
									<td width="100">操作</td>
								</tr>
							</thead>
							<tbody>
								<tr id="station_start" class="hidden"></tr>
								<tr id="station_end" class="hidden"></tr>
								<c:if test="${commonRepairServices!=null && commonRepairServices.size()>0}">
									<c:forEach items="${commonRepairServices}" var="t">
										<tr>
											<td><input type="checkbox" name="ids" id="_ids" value="${t.id }" dir="${t.stationId }"></td>
											<td>${t.station }</td>
											<td>${t.callno }</td>
											<td>${t.project.no }</td>
											<td>${t.cusName }</td>
											<td>${t.applyDate }</td>
											<td>${t.machineModel }</td>
											<td>${t.serialNumber }</td>
											<td>${t.applyParts }</td>
											<td>${PARTS[t.applyPartsId].name }</td>
											<td>${t.applyNumber }</td>
											<td><input name="actualUseParts" id="${t.id }_aup" size="6" value="${t.actualUsePart}">
												<input name="actualUsePartIds" id="${t.id }_aupi" type="hidden" value="${t.actualUsePartId}">
												<input id="${t.id }_apN" type="hidden" value="${t.applyNumber}">
												<input name="shelveses" id="${t.id }_sls" type="hidden" value="${t.shelves}">
												<input name="newOrOld" id="${t.id }_nOo" size="3" value="${t.newOrOld}" readonly="readonly" type="hidden">
												<a href="#" onclick="javascript:showParts(this);return false;"><span class="glyphicon glyphicon-new-window "></span></a></td>
											<td><input name="inventoryNumbers" id="${t.id }_ins" size="3" readonly="readonly">
											</td>
											<td>${status[t.repairType]}</td>
											<!-- <td>${t.remark }</td>	 -->
											<td><input name="isRepeats" id="${t.id }_ird" type="hidden" value="<c:if test="${t.isRepeat!=null && !''.equals(t.isRepeat)}">${t.isRepeat}</c:if><c:if test="${t.isRepeat==null || ''.equals(t.isRepeat)}">0</c:if>">${t.shelves }</td>
											<td>${statusService[t.status]}</td>
											<td>
												<a href="javascript:void(0)" onclick="outBound(this)" url="${pageContext.request.contextPath}/service/commonRepairService/outBound?ids=${t.id}" dir="${t.stationId }" serviceId="${t.id }">出库</a><br>
												<a href="javascript:void(0)" onclick="del(this)" url="${pageContext.request.contextPath}/service/commonRepairService/changeFlag?ids=${t.id}&oper=order" dir="${t.stationId }">订购</a><br>
												<a href="javascript:void(0)" onclick="del(this)" url="${pageContext.request.contextPath}/service/commonRepairService/changeFlag?ids=${t.id}&oper=cancel" dir="${t.stationId }">取消</a>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</td>
	</tr>
</table>