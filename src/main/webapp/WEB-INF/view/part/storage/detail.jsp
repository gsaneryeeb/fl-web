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
	});
</script>
<div class="modal fade" id="_detailModal">
	<div class="modal-dialog" style="width: 900px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h6 class="modal-title">&nbsp;</h6>
			</div>
			<div class="modal-body PrintArea">
				<div class="control-group panel panel-info">
					<div class="panel-heading" style="text-align: left;">Help Desk基本信息</div>
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<td class="success" width="20%">维修单号:</td>
									<td align="left" width="30%">${t.orders}</td>
									<td width="20%" class="success" >项目:</td>
									<td align="left">${t.projectIdFk }</td>
								</tr>
								<tr>
									<td width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>部门:</td>
									<td align="left">${t.department}</td>
									<td width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>联系电话:</td>
									<td align="left">${t.tel}</td>
								</tr>
								<tr>
									<td class="success" width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>员工编号:</td>
									<td align="left">${t.staffNo}</td>
									<td class="success" width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>姓名:</td>
									<td align="left">${t.name}</td>
								
								</tr>
								<tr>
									<td width="30%">机器型号:</td>
									<td align="left">${t.machineModel}</td>
									<td width="30%">机器序列号:</td>
									<td align="left">${t.serialNumber}</td>
								</tr>
								<tr>
									<td class="success" width="30%">保修时间:</td>
									<td align="left">
									<label><input value="${t.warrantyPeriod}" id="_warrantyPeriod" name="warrantyPeriod" readonly="readonly" ></label>
									</td>
									<td class="success" width="30%">服务完成时间:</td>
									<td align="left">
									<label><input value="${t.finishDate}" id="_finishDate" name="finishDate" readonly="readonly" ></label>
									</td>
								</tr>
								<tr>
									<td width="20%">状态:</td>
									<td align="left">
									<select name="status" disabled="disabled">
										<c:forEach items="${status}" var="status">
											<option value="${status.key }">${status.value}</option>
										</c:forEach>
									</select>
									</td>
									<td width="30%">共计时间:</td>
									<td align="left">${t.totalTime}</td>
								</tr>
								<tr>
									<td>服务内容:</td>
									<td colspan="3"></td>
								</tr>
								<tr>
									<td colspan="4" align="left"><textarea rows="3" cols="102" name="serviceContent" id="_serviceContent" readonly="readonly">${t.serviceContent }</textarea></td>
								</tr>
								<tr>
									<td colspan="4" align="right" style="padding-right: 40px;">接收人:${USER.uName }</td>
								</tr>
								<tr>
									<td class="success">服务评价:</td>
									<td colspan="3"></td>
								</tr>
								<tr>
									<td colspan="4" align="left">
										<div style="width: 100%">
											<div style="width: 25%;float: left;text-align:center;">1.服务评价</div>
											<div style="width: 25%;float: left;"><input type="radio" disabled="disabled" name="serviceEvaluation1" value="1" <c:if test='${t.serviceEvaluation1==1}'>checked="checked"</c:if>> 满意</div>
											<div style="width: 25%;float: left;"><input type="radio" disabled="disabled" name="serviceEvaluation1" value="0" <c:if test='${t.serviceEvaluation1==0}'>checked="checked"</c:if>> 一般</div>
											<div style="width: 25%;float: left;"><input type="radio" disabled="disabled" name="serviceEvaluation1" value="-1" <c:if test='${t.serviceEvaluation1==-1}'>checked="checked"</c:if>> 不满意</div>
										</div>
										<div style="width: 100%">
											<div style="width: 25%;float: left;text-align:center;">2.专业水平</div>
											<div style="width: 25%;float: left;"><input type="radio" disabled="disabled" name="serviceEvaluation2" value="1" <c:if test='${t.serviceEvaluation2==1}'>checked="checked"</c:if>> 满意</div>
											<div style="width: 25%;float: left;"><input type="radio" disabled="disabled" name="serviceEvaluation2" value="0" <c:if test='${t.serviceEvaluation2==0}'>checked="checked"</c:if>> 一般</div>
											<div style="width: 25%;float: left;"><input type="radio" disabled="disabled" name="serviceEvaluation2" value="-1" <c:if test='${t.serviceEvaluation2==-1}'>checked="checked"</c:if>> 不满意</div>
										</div>
										<div style="width: 100%">
											<div style="width: 25%;float: left;text-align:center;">3.服务态度</div>
											<div style="width: 25%;float: left;"><input type="radio" disabled="disabled" name="serviceEvaluation3" value="1" <c:if test='${t.serviceEvaluation3==1}'>checked="checked"</c:if>> 满意</div>
											<div style="width: 25%;float: left;"><input type="radio" disabled="disabled" name="serviceEvaluation3" value="0" <c:if test='${t.serviceEvaluation3==0}'>checked="checked"</c:if>> 一般</div>
											<div style="width: 25%;float: left;"><input type="radio" disabled="disabled" name="serviceEvaluation3" value="-1" <c:if test='${t.serviceEvaluation3==-1}'>checked="checked"</c:if>> 不满意</div>
										</div>
										<div style="width: 100%">
											<div style="width: 25%;float: left;text-align:center;">4.XXXXX</div>
											<div style="width: 25%;float: left;"><input type="radio" disabled="disabled" name="serviceEvaluation4" value="1" <c:if test='${t.serviceEvaluation4==1}'>checked="checked"</c:if>> 满意</div>
											<div style="width: 25%;float: left;"><input type="radio" disabled="disabled" name="serviceEvaluation4" value="0" <c:if test='${t.serviceEvaluation4==0}'>checked="checked"</c:if>> 一般</div>
											<div style="width: 25%;float: left;"><input type="radio" disabled="disabled" name="serviceEvaluation4" value="-1" <c:if test='${t.serviceEvaluation4==-1}'>checked="checked"</c:if>> 不满意</div>
										</div>
										<div style="width: 100%">
											<div style="width: 25%;float: left;text-align:center;">5.XXXXX</div>
											<div style="width: 25%;float: left;"><input type="radio" disabled="disabled" name="serviceEvaluation5" value="1" <c:if test='${t.serviceEvaluation5==1}'>checked="checked"</c:if>> 满意</div>
											<div style="width: 25%;float: left;"><input type="radio" disabled="disabled" name="serviceEvaluation5" value="0" <c:if test='${t.serviceEvaluation5==0}'>checked="checked"</c:if>> 一般</div>
											<div style="width: 25%;float: left;"><input type="radio" disabled="disabled" name="serviceEvaluation5" value="-1" <c:if test='${t.serviceEvaluation5==-1}'>checked="checked"</c:if>> 不满意</div>
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