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
		style="width: 950px; text-align: center; margin-left: auto; margin-right: auto;">
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
								</tr>
								<tr>
									<td>租赁性质:</td>
									<td align="left">
										<input disabled="disabled" type="radio" name="leasePro" value="PERSON" <c:if test="${t.leasePro=='PERSON'}">checked="checked" </c:if><c:if test="${t.leasePro==null}">checked="checked" </c:if>> 个人 <input disabled="disabled" type="radio" name="leasePro" value="COMPLETE"  <c:if test="${t.leasePro=='COMPLETE'}">checked="checked" </c:if>> 企业
									</td>
									<td>合同号:</td>
									<td align="left"><input type="text" name="contractNo" disabled="disabled" value="${t.contractNo}" class="input-control"></td>
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
								</tr>
								<tr>
									<td >客户地址:</td>
									<td align="left">${t.cusAdress}</td>
									<td >联系电话:</td>
									<td align="left">${t.cusTel}</td>
								</tr>
								<tr class="complete">
									<td class="success" >合同编号:</td>
									<td align="left">${t.contractNo}</td>
									<td class="success" ></td>
									<td align="left"></td>
								</tr>
								<tr>
									<td colspan="6" align="left">机器基本信息:</td>
								</tr>
								<tr>
									<td colspan="6" align="left">
											<table id="add_table" class="table table-condensed table-nutrition">
												<tr>
													<td width="70">内存编号</td>
													<td width="70">电源编号</td>
													<td width="70">光驱编号</td>
													<td width="70">键盘编号</td>
													
													
													<td width="100">起租时间</td>
													<td width="100">到租时间</td>
													<td width="100">是否有押金</td>
												</tr>
												<c:forEach items="${t.leaseDetails }" var="details">
													<tr class="new">
														<td>${details.memoryNum }</td>
														<td>${details.powerNum }</td>
														<td>${details.cdNum }</td>
														<td>${details.keyboardNum }</td>
														
														<td><c:if test="${details.hireTime!=null}">${details.hireTime.substring(0,10) }</c:if></td>
														<td><c:if test="${details.rentTime!=null}">${details.rentTime.substring(0,10)}</c:if></td>
														<td>
														<input type="checkbox" disabled="disabled" <c:if test="${details.isDeposit=='YES' }">checked="checked"</c:if>>是<input type="checkbox" disabled="disabled" <c:if test="${details.isDeposit=='NO' }">checked="checked"</c:if>>否
														<c:if test="${details.isDeposit=='YES'  }">
															<br><font class="title_mount">金额:</font> ${details.leasingAmount }
														</c:if>
														</td>
													</tr>
												</c:forEach>
											</table>
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
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="printBtn">打 印</button>
			</div>
		</div>
	</div>
</div>
