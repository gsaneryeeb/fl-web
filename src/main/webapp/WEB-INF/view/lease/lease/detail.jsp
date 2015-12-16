<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<script type="text/javascript">
$(function(){
	$("#printBtn").click(function(){
		$(".PrintArea").printArea();
	});
});
</script>
<div class="modal fade" id="_detailModal">
	<div class="modal-dialog"
		style="width: 1300px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body PrintArea">
				<div class="control-group panel panel-info">
				<div class="panel-heading" style="text-align: center;">北京利华永文商贸有限责任公司<br>租赁机器信息</div>
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<td class="success" >地址:</td>
									<td align="left">北京市昌平区回龙观镇同城街41-11</td>
									<td class="success" >联系电话:</td>
									<td align="left">010-81725838 18910560811</td>
									<td class="success" >编号:</td>
									<td align="left">${t.no}</td>
								</tr>
								<tr>
									<td>租赁性质:</td>
									<td align="left">
										<input disabled="disabled" type="radio" name="leasePro" value="PERSON" <c:if test="${t.leasePro=='PERSON'}">checked="checked" </c:if><c:if test="${t.leasePro==null}">checked="checked" </c:if>> 个人 <input disabled="disabled" type="radio" name="leasePro" value="COMPLETE"  <c:if test="${t.leasePro=='COMPLETE'}">checked="checked" </c:if>> 企业
									</td>
									<td>合同号:</td>
									<td align="left"><input type="text" name="contractNo" disabled="disabled" value="${t.contractNo}" class="input-control"></td>
									<td >收费方式:</td>
									<td align="left">
										<select name="charge" disabled="disabled">
											<option value=""></option>
											<option value="PRE" <c:if test="${t.charge=='PRE'}">selected="selected"</c:if>>预付费</option>
											<option value="AFTER" <c:if test="${t.charge=='AFTER'}">selected="selected"</c:if>>后付费</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="success" >客户名称:</td>
									<td align="left">${t.cusName}</td>
									<td class="success" >
										<c:if test="${t.leasePro=='PERSON'}">
											<span class="peason">身份证:</span>
										</c:if>
										<c:if test="${t.leasePro=='COMPLETE'}">
											<span class="complete">营业执照注册号:</span>
										</c:if>
									</td>
									<td align="left">
									<c:if test="${t.leasePro=='PERSON'}">
										<span class="peason">${t.cusId}</span>
									</c:if>
									<c:if test="${t.leasePro=='COMPLETE'}">
										<span class="complete">${t.licenseNum}</span>
									</c:if>
									</td>
									<td class="success" >收费金额</td>
									<td align="left">
										${t.chargePrice}
									</td>
								</tr>
								<tr>
									<td >客户地址:</td>
									<td align="left">${t.cusAdress}</td>
									<td >联系电话:</td>
									<td align="left">${t.cusTel}</td>
									<td ></td>
									<td align="left">
										
									</td>
								</tr>
								<tr class="complete">
									<td class="success" >组织机构代码:</td>
									<td align="left">${t.organizationCode}</td>
									<td class="success" >税务登记证:</td>
									<td align="left">${t.taxReg}</td>
									<td class="success" ></td>
									<td align="left"></td>
								</tr>
								<tr>
									<td colspan="6" align="left">机器基本信息:</td>
								</tr>
								<tr>
									<td colspan="6" align="left">
										<div style="overflow-x:auto;overflow-y:auto;width:1240px;">
											<table id="add_table" class="table table-condensed table-nutrition" style="overflow-x:auto;width:3200px;overflow-y:hidden;">
												<tr>
													<td width="70">机器型号</td>
													<td width="70">机器序列号</td>
													<td width="70">主板编号</td>
													<td width="70">硬盘编号</td>
													<td width="70">电池编号</td>
													
													<!-- <td width="70">内存编号</td> -->
													
													<td width="70">内存编号1</td>
													<td width="70">内存编号2</td>
													<td width="70">内存编号3</td>
													<td width="70">内存编号4</td>
													
													<td width="70">电源编号</td>
													<td width="70">光驱编号</td>
													<td width="70">键盘编号</td>
													
													<td width="117">CPU信息</td>
													<td width="117">内存信息</td>
													<td width="117">硬盘信息</td>
													<td width="117">外观</td>
													<td width="117">租赁价格</td>
													<td width="117">收费周期</td>
													<td width="140">返回状态</td>
													<td width="140">是否收费</td>
													
													<td width="100">起租时间</td>
													<td width="100">到租时间</td>
													<td width="100">是否有押金</td>
													<td width="100">机器返回时间</td>
													<td width="100">超期是否收费</td>
													<td width="70">备注</td>
												</tr>
												<c:forEach items="${t.leaseDetails }" var="details">
													<tr class="new">
														<td>${details.machineModel }</td>
														<td>${details.machineSerial }</td>
														<td>${details.boardNo }</td>
														<td>${details.hardDisk }</td>
														<td>${details.batteryNum }</td>
														<!-- <td>${details.memoryNum }</td> -->
														<td>${details.memoryNum1 }</td>
														<td>${details.memoryNum2 }</td>
														<td>${details.memoryNum3 }</td>
														<td>${details.memoryNum4 }</td>
														<td>${details.powerNum }</td>
														<td>${details.cdNum }</td>
														<td>${details.keyboardNum }</td>
														
														<td>${details.cpu}</td>
														<td>${details.memoryInf}</td>
														<td>${details.hardDiskInf}</td>
														<td>${details.appearance}</td>
														<td>${details.price}</td>
														<td>
															<select name="chargePeriods" disabled="disabled">
																<option value=""></option>
																<option value="DAY" <c:if test="${details.chargePeriod=='DAY' }"> selected="selected"  </c:if>>日</option>
																<option value="MONTH" <c:if test="${details.chargePeriod=='MONTH' }"> selected="selected"  </c:if>>月</option>
																<option value="T_MONTH" <c:if test="${details.chargePeriod=='T_MONTH' }"> selected="selected"  </c:if>>3月</option>
																<option value="S_MONTH" <c:if test="${details.chargePeriod=='S_MONTH' }"> selected="selected"  </c:if>>6月</option>
																<option value="YEAR" <c:if test="${details.chargePeriod=='YEAR' }"> selected="selected"  </c:if>>年</option>
															</select>
														</td>
														<td>
															<select name="returnStatuss" disabled="disabled">
																<option value="" ></option>
																<option value="GOOD" <c:if test="${details.returnStatus=='GOOD' }"> selected="selected"  </c:if>>良好</option>
																<option value="FAIL" <c:if test="${details.returnStatus=='FAIL' }"> selected="selected"  </c:if>>故障</option>
															</select>
														</td>
														<td>
															<input type="checkbox" disabled="disabled" <c:if test="${details.ifCharge=='YES' }"> checked="checked"</c:if> name="ifCharges" value="YES" class="ifCharge${COUNT }" >是<input disabled="disabled"  class="ifCharge${COUNT }" type="checkbox" name="ifCharges" value="NO" <c:if test="${details.ifCharge=='NO' }"> checked="checked"</c:if>>否<br><font class="title_mount" id="title_mountC${COUNT }">金额:</font>${details.chargePrice}
														</td>
														
														
														<td><c:if test="${details.hireTime!=null}">${details.hireTime.substring(0,10) }</c:if></td>
														<td><c:if test="${details.rentTime!=null}">${details.rentTime.substring(0,10)}</c:if></td>
														<td>
														<input type="checkbox" disabled="disabled" <c:if test="${details.isDeposit=='YES' }">checked="checked"</c:if>>是<input type="checkbox" disabled="disabled" <c:if test="${details.isDeposit=='NO' }">checked="checked"</c:if>>否
														<c:if test="${details.isDeposit=='YES'  }">
															<br><font class="title_mount">金额:</font> ${details.leasingAmount }
														</c:if>
														</td>
														<td>${details.returnTime }</td>
														<td>
														<input type="checkbox" disabled="disabled" <c:if test="${details.extendedCharge=='YES' }">checked="checked"</c:if>>是<input type="checkbox" disabled="disabled" <c:if test="${details.extendedCharge=='NO' }">checked="checked"</c:if>>否
														<c:if test="${details.extendedCharge=='YES' }">
															<br><font class="title_mount">金额:</font>${details.amountFees}
														</c:if>
														</td>
														<td>${details.remark }</td>
													</tr>
												</c:forEach>
											</table>
											</div>
									</td>
								</tr>
								<tr>
									<td>合计:</td>
									<td colspan="5" id="counts" align="left" style="font-size: 10;font-weight: bold;">
										${t.leaseDetails==null?0:t.leaseDetails.size()}
									</td>
								</tr>
								<!-- 
								<tr>
									<td colspan="6" align="left">备件配置信息及运行状态:</td>
								</tr>
												
								<tr>
									<td class="success" >CPU信息:</td>
									<td align="left">${t.cpu}</td>
									<td class="success" >内存信息:</td>
									<td align="left">${t.memoryInf}</td>
									<td class="success" >硬盘信息:</td>
									<td align="left">${t.hardDiskInf}</td>
								</tr>
								<tr>
									<td >运行状况:</td>
									<td align="left">${t.operationStatus}</td>
									<td >外观:</td>
									<td align="left">${t.appearance}</td>
									<td >备注:</td>
									<td align="left">${t.operationNote}</td>
								</tr>
								<tr>
									<td colspan="6" align="left" >确认签字:${t.confirm}</td>
								</tr>
								<tr>
									<td >验机人:</td>
									<td colspan="2" align="left">${t.acceptance}</td>
									<td >日期:</td>
									<td colspan="2" align="left">${t.acceptanceTime}</td>
								</tr>
								<tr>
									<td >客户签名:</td>
									<td colspan="2" align="left">${t.signature}</td>
									<td >日期:</td>
									<td colspan="2" align="left">${t.signatureTime}</td>
								</tr>
								<tr>
									<td >经办人签字:</td>
									<td colspan="2" align="left">${t.attnSignature}</td>
									<td >日期:</td>
									<td colspan="2" align="left">${t.attnSignatureTime}</td>
								</tr>
								<tr>
									<td colspan="6" align="left">
										备注：请认真核对主机码及机器插拔的电池，光驱，AC的条形码是否与验机报告中的条形码一致，请勿擅自拆钉谢谢合作。
									</td>
								</tr>
								 -->
							</tbody>
						</table>
				</div>
			</div>
		</div>
	</div>
</div>
