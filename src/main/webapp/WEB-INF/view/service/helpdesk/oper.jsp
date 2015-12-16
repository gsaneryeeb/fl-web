<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript">
	$(function(){
		if($("#_type2").val()=="SYS"){	//系统运维
			$(".two").hide();
			$(".thress").hide();
			$(".one").show();
		}else if($("#_type2").val()=="LINE"){		//网络与机房服务
			$(".one").hide();
			$(".SYS").hide();
			$(".thress").hide();
			$(".two").show();	
		}else if($("#_type2").val()=="SERVER"){		//服务器运维
			$(".one").hide();
			$(".SYS").hide();
			$(".two").hide();
			$(".thress").show();	
		}
		$("#printBtn").click(function(){
			$(".PrintArea").printArea();
		});
		$("input[name='contentChecks']").change(function(){
			var _contentCheck="";
			$("input[name='contentChecks']").each(function(){
				if($(this).is(":checked")){
					_contentCheck+=$(this).val()+",";
				}
			});
			$("#_contentCheck").val(_contentCheck.substring(0, _contentCheck.length-1));
		});
		$("#_type2").change(function(){
			if($(this).val()=="SYS"){	//系统运维
				$(".two").hide();
				$(".thress").hide();
				$(".one").show();
				$(".SYS").show();
			}else if($(this).val()=="LINE"){		//网络与机房服务
				$(".one").hide();
				$(".thress").hide();
				$(".two").show();	
				$(".SYS").hide();
			}else if($(this).val()=="SERVER"){		//服务器运维
				$(".one").hide();
				$(".two").hide();
				$(".SYS").hide();
				$(".thress").show();	
			}
		});
		$("input[name='_fstatus']").click(function(){
			var is=false;
			if($(this).is(":checked")){
				is=true;
				$("#status").val($(this).val());
			}else{
				$("#status").val(0);
			}
			$("input[name='_fstatus']").attr('checked',false);
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
					<div class="panel-heading" style="text-align: center;"><H5>HELP DESK</H5></div>
					<form id="_operForm" action="${pageContext.request.contextPath}/service/helpdesk/addSave" method="${_method }">
						<input type="hidden" value="${t.id}" name="id">
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<td colspan="4" align="left">
										<input type="hidden" name="orders" value="${t.orders}" class="input-control" id="_orders" readonly="readonly">
										<input type="hidden" name="contentCheck" id="_contentCheck" value="${t.contentCheck }">
										<select name="type" id="_type2">
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
									<td class="success" width="20%"><span class="SYS glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>部门:</td>
									<td align="left" width="30%"><input name="department" value="${t.department}" class="input-control" id="_department" ></td>
									<td class="success" width="20%"><span class="SYS glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>联系电话:</td>
									<td align="left"><input name="tel" value="${t.tel}" class="input-control" id="_tel" ></td>
								</tr>
								<tr class="one two">
									<td class="two" width="20%"><span class="SYS glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>办公地点:</td>
									<td class="two" align="left" width="30%"><input name="officeSpace" value="${t.officeSpace}" class="input-control" id="_officeSpace" ></td>
									<td class="one" width="20%"><span class="SYS glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>员工编号:</td>
									<td class="one" align="left" width="30%"><input name="staffNo" value="${t.staffNo}" class="input-control" id="_staffNo" ></td>
									<td width="20%"><span class="SYS glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>姓名:</td>
									<td align="left"><input name="name" value="${t.name}" class="input-control" id="_name" ></td>
								</tr>
								<tr class="one">
									<td class="success" width="30%"><span class="SYS glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>机器型号:</td>
									<td align="left"><input name="machineModel" value="${t.machineModel}" class="input-control" id="_machineModel" ></td>
									<td class="success" width="30%"><span class="SYS glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>机器序列号:</td>
									<td align="left"><input name="serialNumber" value="${t.serialNumber}" class="input-control" id="_serialNumber" ></td>
								</tr>
								<tr class="one">
									<td width="30%" colspan="1">服务内容:</td>
									<td align="left" colspan="3">
										<input type="checkbox" value="A" name="contentChecks"  <c:if test='${"".equals(t.contentCheck)?false:t.contentCheck.indexOf("A")>=0}'>checked="checked"</c:if>>系统安装
										<input type="checkbox" value="B" name="contentChecks" <c:if test='${"".equals(t.contentCheck)?false:t.contentCheck.indexOf("B")>=0}'>checked="checked"</c:if>>故障
										<input type="checkbox" value="C" name="contentChecks" <c:if test='${"".equals(t.contentCheck)?false:t.contentCheck.indexOf("C")>=0}'>checked="checked"</c:if>>个人信息
										<input type="checkbox" value="D" name="contentChecks" <c:if test='${"".equals(t.contentCheck)?false:t.contentCheck.indexOf("D")>=0}'>checked="checked"</c:if>>其他
									</td>
								</tr>
								<tr class="two">
									<td class="success" width="30%">桌号:</td>
									<td align="left"><input name="tableNumber" value="${t.tableNumber}" class="input-control" id="_tableNumber" ></td>
									<td class="success" width="30%">端口号:</td>
									<td align="left"><input name="portNumber" value="${t.portNumber}" class="input-control" id="_portNumber" ></td>
								</tr>
								<tr class="two">
									<td width="30%" colspan="1">服务内容:</td>
									<td align="left" colspan="3">
										<input type="checkbox" value="E" name="contentChecks" <c:if test='${"".equals(t.contentCheck)?false:t.contentCheck.indexOf("E")>=0}'>checked="checked"</c:if>>网络硬件故障
										<input type="checkbox" value="F" name="contentChecks" <c:if test='${"".equals(t.contentCheck)?false:t.contentCheck.indexOf("F")>=0}'>checked="checked"</c:if>>网络软件故障
										<input type="checkbox" value="G" name="contentChecks" <c:if test='${"".equals(t.contentCheck)?false:t.contentCheck.indexOf("G")>=0}'>checked="checked"</c:if>>机房巡检
										<input type="checkbox" value="H" name="contentChecks" <c:if test='${"".equals(t.contentCheck)?false:t.contentCheck.indexOf("H")>=0}'>checked="checked"</c:if>>机房违规问题
										<input type="checkbox" value="I" name="contentChecks" <c:if test='${"".equals(t.contentCheck)?false:t.contentCheck.indexOf("I")>=0}'>checked="checked"</c:if>>其他
									</td>
								</tr>
								<tr class="thress">
									<td class="success" width="30%">项目单位:</td>
									<td align="left"><input name="projectName" value="${t.projectName}" class="input-control" id="_projectName" ></td>
									<td class="success" width="30%">负责人:</td>
									<td align="left"><input name="head" value="${t.head}" class="input-control" id="_head" ></td>
								</tr>
								<tr class="thress">
									<td width="30%" colspan="1">服务内容:</td>
									<td align="left" colspan="3">
										<input type="checkbox" value="J" name="contentChecks" <c:if test='${"".equals(t.contentCheck)?false:t.contentCheck.indexOf("J")>=0}'>checked="checked"</c:if>>服务器安装
										<input type="checkbox" value="K" name="contentChecks" <c:if test='${"".equals(t.contentCheck)?false:t.contentCheck.indexOf("K")>=0}'>checked="checked"</c:if>>OS安装
										<input type="checkbox" value="L" name="contentChecks" <c:if test='${"".equals(t.contentCheck)?false:t.contentCheck.indexOf("L")>=0}'>checked="checked"</c:if>>OS与软件运维
									</td>
								</tr>
								
								<tr>
									<td class="success" width="30%">报修时间:</td>
									<td align="left">
									<label><input value="${t.warrantyPeriod}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" id="_warrantyPeriod" name="warrantyPeriod" readonly="readonly" ><span class="glyphicon glyphicon-calendar"></span></label>
									</td>
									<td class="success" width="30%">服务完成时间:</td>
									<td align="left">
									<label><input value="${t.finishDate}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" id="_finishDate" name="finishDate" readonly="readonly" ><span class="glyphicon glyphicon-calendar"></span></label>
									</td>
								</tr>
								<tr>
									<td width="30%">故障处理:<input type="hidden" id="status" name="status" value="<c:if test='${t.status==null}'>0</c:if><c:if test='${t.status!=null}'>${t.status}</c:if>"></td>
									<td align="left"><input type="checkbox" name="_fstatus" value="1"> 已完成 <input type="checkbox" name="_fstatus" value="2"> 未修复</td>
									<td width="30%"></td>
							<td align="left"><input type="hidden" name="totalTime" value="${t.totalTime}" class="input-control" id="_totalTime"></td>
								</tr>
								<tr>
									<td>服务内容:</td>
									<td colspan="3"></td>
								</tr>
								<tr>
									<td colspan="4" align="left"><textarea rows="3" cols="102" name="serviceContent" id="_serviceContent">${t.serviceContent }</textarea></td>
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
											<div style="width: 25%;float: left;"><input type="radio" name="serviceEvaluation1" value="1" <c:if test='${"".equals(t.serviceEvaluation1)?false:t.serviceEvaluation1==1}'>checked="checked"</c:if>> 满意</div>
											<div style="width: 25%;float: left;"><input type="radio" name="serviceEvaluation1" value="0" <c:if test='${"".equals(t.serviceEvaluation1)?false:t.serviceEvaluation1==0}'>checked="checked"</c:if>> 一般</div>
											<div style="width: 25%;float: left;"><input type="radio" name="serviceEvaluation1" value="-1" <c:if test='${"".equals(t.serviceEvaluation1)?false:t.serviceEvaluation1==-1}'>checked="checked"</c:if>> 不满意</div>
										</div>
										<div style="width: 100%">
											<div style="width: 25%;float: left;text-align:center;">2.专业水平</div>
											<div style="width: 25%;float: left;"><input type="radio" name="serviceEvaluation2" value="1" <c:if test='${"".equals(t.serviceEvaluation2)?false:t.serviceEvaluation2==1}'>checked="checked"</c:if>> 满意</div>
											<div style="width: 25%;float: left;"><input type="radio" name="serviceEvaluation2" value="0" <c:if test='${"".equals(t.serviceEvaluation2)?false:t.serviceEvaluation2==0}'>checked="checked"</c:if>> 一般</div>
											<div style="width: 25%;float: left;"><input type="radio" name="serviceEvaluation2" value="-1" <c:if test='${"".equals(t.serviceEvaluation2)?false:t.serviceEvaluation2==-1}'>checked="checked"</c:if>> 不满意</div>
										</div>
										<div style="width: 100%">
											<div style="width: 25%;float: left;text-align:center;">3.服务态度</div>
											<div style="width: 25%;float: left;"><input type="radio" name="serviceEvaluation3" value="1" <c:if test='${"".equals(t.serviceEvaluation3)?false:t.serviceEvaluation3==1}'>checked="checked"</c:if>> 满意</div>
											<div style="width: 25%;float: left;"><input type="radio" name="serviceEvaluation3" value="0" <c:if test='${"".equals(t.serviceEvaluation3)?false:t.serviceEvaluation3==0}'>checked="checked"</c:if>> 一般</div>
											<div style="width: 25%;float: left;"><input type="radio" name="serviceEvaluation3" value="-1" <c:if test='${"".equals(t.serviceEvaluation3)?false:t.serviceEvaluation3==-1}'>checked="checked"</c:if>> 不满意</div>
										</div>
										<!-- 
										<div style="width: 100%">
											<div style="width: 25%;float: left;text-align:center;">4.XXXXX</div>
											<div style="width: 25%;float: left;"><input type="radio" name="serviceEvaluation4" value="1" <c:if test='${t.serviceEvaluation4==1}'>checked="checked"</c:if>> 满意</div>
											<div style="width: 25%;float: left;"><input type="radio" name="serviceEvaluation4" value="0" <c:if test='${t.serviceEvaluation4==0}'>checked="checked"</c:if>> 一般</div>
											<div style="width: 25%;float: left;"><input type="radio" name="serviceEvaluation4" value="-1" <c:if test='${t.serviceEvaluation4==-1}'>checked="checked"</c:if>> 不满意</div>
										</div>
										<div style="width: 100%">
											<div style="width: 25%;float: left;text-align:center;">5.XXXXX</div>
											<div style="width: 25%;float: left;"><input type="radio" name="serviceEvaluation5" value="1" <c:if test='${t.serviceEvaluation5==1}'>checked="checked"</c:if>> 满意</div>
											<div style="width: 25%;float: left;"><input type="radio" name="serviceEvaluation5" value="0" <c:if test='${t.serviceEvaluation5==0}'>checked="checked"</c:if>> 一般</div>
											<div style="width: 25%;float: left;"><input type="radio" name="serviceEvaluation5" value="-1" <c:if test='${t.serviceEvaluation5==-1}'>checked="checked"</c:if>> 不满意</div>
										</div> -->
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="modal-footer" style="padding-right: 50px;">
				<button type="button" class="btn btn-default" id="_saveBtn" checkFuc="checkSave">保存</button>
				
				<button type="button" class="btn btn-default" id="printBtn">打 印</button>
			</div>
		</div>
	</div>
</div>
