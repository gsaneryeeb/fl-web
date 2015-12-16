<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 弹出页面 -->
<script type="text/javascript">
	$(function(){
		if($("#_type2").val()=="SYS"){	//系统运维
			$(".two").hide();
			$(".thress").hide();
			$(".one").show();
		}else if($("#_type2").val()=="LINE"){		//网络与机房服务
			$(".one").hide();
			$(".thress").hide();
			$(".two").show();	
		}else if($("#_type2").val()=="SERVER"){		//服务器运维
			$(".one").hide();
			$(".two").hide();
			$(".thress").show();	
		}
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
									<td colspan="4" align="left">
										<select name="type" id="_type2" disabled="disabled">
											<c:forEach items="${SERVICE_TYPE }" var="p">
												<option value="${p.key }" <c:if test='${t.type==p.key }'>selected="selected"</c:if>>${p.value }</option>		
											</c:forEach>
										</select>
										<select name="projectIdFk" id="_projectIdFk" style="display: none;">
											<c:forEach items="${projects }" var="p">
												<option value="${p.id }" <c:if test='${t.projectIdFk==p.id }'>selected="selected"</c:if>>${p.cname }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr class="one two">
									<td class="success" width="20%">部门:</td>
									<td align="left" width="30%">${t.department}</td>
									<td class="success" width="20%">联系电话:</td>
									<td align="left">${t.tel}</td>
								</tr>
								<tr class="one two">
									<td class="two" width="20%">办公地点:</td>
									<td class="two" align="left" width="30%">${t.officeSpace}</td>
									<td class="one" width="20%">员工编号:</td>
									<td class="one" align="left" width="30%">${t.staffNo}</td>
									<td width="20%">姓名:</td>
									<td align="left">${t.name}</td>
								</tr>
								<tr class="one">
									<td class="success" width="30%">机器型号:</td>
									<td align="left">${t.machineModel}</td>
									<td class="success" width="30%">机器序列号:</td>
									<td align="left">${t.serialNumber}</td>
								</tr>
								<tr class="one">
									<td width="30%" colspan="1">服务内容:</td>
									<td align="left" colspan="3">
										<input type="checkbox" value="A" disabled="disabled" name="contentChecks"  <c:if test='${t.contentCheck.contains("A")}'>checked="checked"</c:if>>系统安装
										<input type="checkbox" value="B" disabled="disabled" name="contentChecks" <c:if test='${t.contentCheck.contains("B")}'>checked="checked"</c:if>>故障
										<input type="checkbox" value="C" disabled="disabled" name="contentChecks" <c:if test='${t.contentCheck.contains("C")}'>checked="checked"</c:if>>个人信息
										<input type="checkbox" value="D" disabled="disabled" name="contentChecks" <c:if test='${t.contentCheck.contains("D")}'>checked="checked"</c:if>>其他
									</td>
								</tr>
								<tr class="two">
									<td class="success" width="30%">桌号:</td>
									<td align="left">${t.tableNumber}</td>
									<td class="success" width="30%">端口号:</td>
									<td align="left">${t.portNumber}</td>
								</tr>
								<tr class="two">
									<td width="30%" colspan="1">服务内容:</td>
									<td align="left" colspan="3">
										<input type="checkbox" value="E" disabled="disabled" name="contentChecks" <c:if test='${t.contentCheck.contains("E")}'>checked="checked"</c:if>>网络硬件故障
										<input type="checkbox" value="F" disabled="disabled" name="contentChecks" <c:if test='${t.contentCheck.contains("F")}'>checked="checked"</c:if>>网络软件故障
										<input type="checkbox" value="G" disabled="disabled" readonly="readonly" name="contentChecks" <c:if test='${t.contentCheck.contains("G")}'>checked="checked"</c:if>>机房巡检
										<input type="checkbox" value="H" disabled="disabled" name="contentChecks" <c:if test='${t.contentCheck.contains("H")}'>checked="checked"</c:if>>机房违规问题
										<input type="checkbox" value="I" disabled="disabled" name="contentChecks" <c:if test='${t.contentCheck.contains("I")}'>checked="checked"</c:if>>其他
									</td>
								</tr>
								<tr class="thress">
									<td class="success" width="30%">项目单位:</td>
									<td align="left">${t.projectName}</td>
									<td class="success" width="30%">负责人:</td>
									<td align="left">${t.head}</td>
								</tr>
								<tr class="thress">
									<td width="30%" colspan="1">服务内容:</td>
									<td align="left" colspan="3">
										<input type="checkbox" value="J" disabled="disabled" name="contentChecks" <c:if test='${t.contentCheck.contains("J")}'>checked="checked"</c:if>>服务器安装
										<input type="checkbox" value="K" disabled="disabled" name="contentChecks" <c:if test='${t.contentCheck.contains("K")}'>checked="checked"</c:if>>OS安装
										<input type="checkbox" value="L" disabled="disabled" name="contentChecks" <c:if test='${t.contentCheck.contains("L")}'>checked="checked"</c:if>>OS与软件运维
									</td>
								</tr>
								<tr>
									<td class="success" width="30%">报修时间:</td>
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
										<!-- 
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
										</div> -->
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