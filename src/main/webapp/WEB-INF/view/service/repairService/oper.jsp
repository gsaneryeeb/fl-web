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
		$("#_ppid").blur(function(){
			if($(this).val()!=""){
				if($("#_sendDate").val()!=""){
					checkPPID();
				}
			}
		});
	    $("#_sendDate").blur(function(){
	        if($(this).val()!=""){
	        	if($("#_ppid").val()!=""){
	        		checkPPID();
	        	}
	        }
	     });
	});
	function checkPPID(){
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/service/repairService/checkPPID?ppid="+$("#_ppid").val()+"&start="+$("#_sendDate").val(),
			success : function(msg) {
				$("#repeats_date").next().remove();
				if(msg.result=="error"){
					$("#_repeats").prop("checked",true);
					var obj=eval('('+msg.ex+')');
					$("#_operForm").attr("action",$("#addSaveTwo").val());
					$("#repeats_date").after("<tr class='danger'><td><input type='hidden' name='repeatsId' value='"+obj.id+"'>"+obj.orders+"</td>"+"<td>"+obj.ppid+"</td>"+"<td>"+obj.expressArrivalTime+"</td></tr>");
					$("#_warranty").val(msg.date);
					alert("重维");
				}else{
					$("#_operForm").attr("action",$("#addSaveOne").val());
					$("#_repeats").prop("checked",false);
					$("#_warranty").val("");
				}
			}
		});
	}
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
					<div class="panel-heading" style="text-align: center;"><H5>送修维修单</H5></div>
					<form id="_operForm" action="${pageContext.request.contextPath}/service/repairService/addSave" method="${_method }">
						<input type="hidden" value="${pageContext.request.contextPath}/service/repairService/addSave" id="addSaveOne">
						<input type="hidden" value="${pageContext.request.contextPath}/service/repairService/addSaveRepeat" id="addSaveTwo">
						<input type="hidden" value="${t.id}" name="id">
						<input type="hidden" name="finishFlag" id="_finishFlag" value="0"/>
						<input type="hidden" value="${t.status}" name="status">
						<input type="hidden" value="${t.acceptUserId}" name="acceptUserId">
						<input type="hidden" value="${t.acceptDate}" name="acceptDate">
						<input type="hidden" value="${t.acceptUser}" name="acceptUser">
						
						<input type="hidden" value="${t.surveyorId}" name="surveyorId">
						
						<input type="hidden" value="${t.expressStaff}" name="expressStaff">
						<input type="hidden" value="${t.expressStaffId}" name="expressStaffId">
						<input type="hidden" value="${t.expressFinishDate}" name="expressFinishDate">
						
						<input type="hidden" value="${t.libraryFinishDate}" name="libraryFinishDate">
						<input type="hidden" value="${t.libraryStaff}" name="libraryStaff">
						<input type="hidden" value="${t.libraryStaffId}" name="libraryStaffId">
						<input type="hidden" id="_warranty" name="warranty" value="${t.warranty}">
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<td class="success" width="20%">维修单号:</td>
									<td align="left" width="30%"><input name="orders" value="${t.orders}" class="input-control" id="_orders" readonly="readonly"></td>
									<td width="20%" class="success">项目:</td>
									<td align="left">
										<select name="projectIdFk" id="_projectIdFk" <c:if test='${READ_ONLY_ONE eq "readonly=readonly" }'> onfocus="this.defaultIndex=this.selectedIndex;" onchange="this.selectedIndex=this.defaultIndex;" style="background-color: #C7C7C7"</c:if> >
											<c:forEach items="${projects }" var="p">
												<option value="${p.id }" <c:if test='${t.projectIdFk==p.id }'>selected="selected"</c:if>>${p.cname }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>PPID:</td>
									<td align="left"><input name="ppid" value="${t.ppid}" class="input-control" id="_ppid" ${READ_ONLY_ONE } <c:if test='${READ_ONLY_ONE eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if>>	
										<select name="repeatsType" <c:if test='${READ_ONLY_ONE eq "readonly=readonly" }'>onfocus="this.defaultIndex=this.selectedIndex;" onchange="this.selectedIndex=this.defaultIndex;" style="background-color: #C7C7C7" </c:if>>
											<c:forEach items="${types }" var="type">
													<option value="${type.key }" <c:if test='${t.repeatsType==type.key }'>selected="selected"</c:if> dir="${type.value }">${type.value }</option>
											</c:forEach>
										</select>
									<div class="hidden"><input type="checkbox" id="_repeats" name="repeats"  value="1" <c:if test='${t.repeats==1}'> checked="checked"</c:if>> 重复</div></td>
									<td width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>CASENO:</td>
									<td align="left"><input name="caseno" value="${t.caseno}" class="input-control" id="_caseno" ${READ_ONLY_ONE } <c:if test='${READ_ONLY_ONE eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if>></td>
								</tr>
								<tr>
									<td class="success" width="30%">服务站:</td>
									<td align="left">
										<select style="width: 150px;" name="stationId" id="_stationId"  <c:if test='${READ_ONLY_ONE eq "readonly=readonly" }'> onfocus="this.defaultIndex=this.selectedIndex;" onchange="this.selectedIndex=this.defaultIndex;" style="background-color: #C7C7C7"</c:if>>
											<c:forEach items="${stations }" var="s">
												<c:if test='${s.name!="北京服务站"}'>
													<option value="${s.id }" <c:if test='${s.id==t.stationId }'>selected="selected"</c:if> dir="${s.name }">${s.name }</option>
												</c:if>
											</c:forEach>
										</select>
										<input type="hidden" name="station" id="_station" value="${t.station }">
									</td>
									<td class="success" width="30%">联系电话:</td>
									<td align="left"><input name="tel" value="${t.tel}" class="input-control" id="_tel" ${READ_ONLY_ONE } <c:if test='${READ_ONLY_ONE eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if>></td>
								
								</tr>
								<tr>
									<td width="30%">机器型号:</td>
									<td align="left"><input name="machineModel" value="${t.machineModel}" class="input-control" id="_machineModel" ${READ_ONLY_ONE } <c:if test='${READ_ONLY_ONE eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if>></td>
									<td width="30%">主板型号:</td>
									<td align="left"><input name="board" value="${t.board}" class="input-control" id="_board" ${READ_ONLY_ONE } <c:if test='${READ_ONLY_ONE eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if>></td>
								</tr>
								<tr>
									<td class="success" width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>服务站发件时间:</td>
									<td align="left">
									<label><input value="${t.stataionSendDate}" ${READ_ONLY_ONE } <c:if test='${READ_ONLY_ONE eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if><c:if test='${READ_ONLY_ONE != "readonly=readonly"}'>onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"</c:if> id="_stataionSendDate" name="stataionSendDate"  ><span class="glyphicon glyphicon-calendar"></span></label>
									</td>
									<td class="success" width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>派单时间时间:</td>
									<td align="left">
									<label><input value="${t.sendDate}" ${READ_ONLY_ONE } <c:if test='${READ_ONLY_ONE eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if><c:if test='${READ_ONLY_ONE != "readonly=readonly"}'> onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"</c:if> id="_sendDate" name="sendDate"  ><span class="glyphicon glyphicon-calendar"></span></label>
									</td>
								</tr>
								<tr>
									<td>故障描述:</td>
									<td ></td>
									<td width="30%">费用:</td>
									<td align="left"><input name="cost" value="${t.cost}" class="input-control" id="_machineModel" ${READ_ONLY_ONE } <c:if test='${READ_ONLY_ONE eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if>></td>
								</tr>
								<tr>
									<td colspan="4" align="left"><textarea rows="3" cols="102" name="faultDes" ${READ_ONLY_ONE } <c:if test='${READ_ONLY_ONE eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if> id="_faultDes">${t.faultDes }</textarea></td>
								</tr>
								<tr>
									<td colspan="3" align="right">备注:</td>
									<td align="left">
									<label><input value="${t.faultRemark}" ${READ_ONLY_ONE } <c:if test='${READ_ONLY_ONE eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if> id="_faultRemark" name="faultRemark" ></label>
									</td>
								</tr>
								<tr ${FIRST_SHOW }>
									<td colspan="4" align="left">90天内重复维修单:</td>
								</tr>
								<tr ${FIRST_SHOW }>
									<td colspan="4">
										<table class="table  table-bordered table-condensed active">
											<tr>
												<td>维修单号</td>
												<td>PPID</td>
												<td>服务站签收日期</td>
											</tr>
											<tr id="repeats_date" class="hidden"></tr>
										</table>
									</td>
								</tr>
								<tr ${FIRST_HIDE }>
									<td class="success" width="30%">到达时间:</td>
									<td align="left">
									<label><input value="${t.arrivalTime}" ${READ_ONLY_TWO } <c:if test='${READ_ONLY_TWO eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if><c:if test='${READ_ONLY_TWO != "readonly=readonly"}'>onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"</c:if> id="_arrivalTime" name="arrivalTime"  ><span class="glyphicon glyphicon-calendar"></span></label>
									</td>
									<td class="success" width="30%">工程师:</td>
									<td align="left">
										<select name="engineerId" id="_engineerId" <c:if test='${READ_ONLY_TWO eq "readonly=readonly" }'> onfocus="this.defaultIndex=this.selectedIndex;" onchange="this.selectedIndex=this.defaultIndex;" style="background-color: #C7C7C7"</c:if>>
											<c:forEach items="${engineers }" var="e">
												<option value="${e.id }" <c:if test='${e.id==t.engineerId }'> selected="selected"</c:if> dir="${e.uName }">${e.userNo }_${e.uName }</option>
											</c:forEach>
										</select>
										<input type="hidden" name="engineer" id="_engineer" value="${t.engineer }">
									</td>
								</tr>
								<tr ${FIRST_HIDE }>
									<td>故障处理:</td>
									<td></td>
									<td class="success" width="30%">处理结果:</td>
									<td align="left">
									<label>
										<select id="_result" name="result" <c:if test='${READ_ONLY_THRESS eq "readonly=readonly" }'> onfocus="this.defaultIndex=this.selectedIndex;" onchange="this.selectedIndex=this.defaultIndex;" style="background-color: #C7C7C7"</c:if> >
											<option></option>
											<c:forEach items="${RESULT }" var="e">
												<option value="${e.key }" <c:if test='${e.key==t.result }'> selected="selected"</c:if> dir="${e.value }">${e.value }</option>
											</c:forEach>
										</select>	
									</label>
									</td>
								</tr>
								<tr ${FIRST_HIDE }>
									<td class="success" width="30%">更换材料:</td>
									<td align="left">
									<label><input value="${t.replacementMaterial}" ${READ_ONLY_THRESS } <c:if test='${READ_ONLY_THRESS eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if> id="_replacementMaterial" name="replacementMaterial" class="input-control" ></label>
									</td>
									<td class="success" width="30%">故障原因:</td>
									<td align="left">
									<label><input value="${t.faultReason}" ${READ_ONLY_THRESS } <c:if test='${READ_ONLY_THRESS eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if> id="_faultReason" name="faultReason" class="input-control" ></label>
									</td>
								</tr>
								<tr ${FIRST_HIDE }>
									<td width="30%">检测人:</td>
									<td align="left">
									<label><input value="<c:if test='${t.surveyor==""}'>${USER.userNo}_${USER.uName }</c:if><c:if test='${t.surveyor!=""}'>${t.surveyor}</c:if>" ${READ_ONLY_THRESS } <c:if test='${READ_ONLY_THRESS eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if> class="input-control"  name="surveyor"></label>
									</td>
									<td width="30%">检测日期:</td>
									<td align="left">
									<label><input value="${t.surveyorDate}" ${READ_ONLY_THRESS } <c:if test='${READ_ONLY_THRESS eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if> id="_surveyorDate" <c:if test='${READ_ONLY_THRESS != "readonly=readonly"}'>onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"</c:if>  name="surveyorDate"  ><span class="glyphicon glyphicon-calendar"></span></label>
									</td>
								</tr>
								<tr ${FIRST_HIDE }>
									<td class="success" width="30%">备注:</td>
									<td align="left">
									<label><input value="${t.remark}" ${READ_ONLY_FORE } <c:if test='${READ_ONLY_FORE eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if> id="_remark" class="input-control"  name="remark"></label>
									</td>
									<td class="success" width="30%"><!-- 取件快递: -->快递发出时间</td>
									<td align="left">
									<!-- <label><input value="${t.transportMinistry}" ${READ_ONLY_FORE } <c:if test='${READ_ONLY_FORE eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if> id="_transportMinistry" class="input-control"  name="transportMinistry" ></label> -->
										<label><input value="${t.expressSendTime}" ${READ_ONLY_FORE } <c:if test='${READ_ONLY_FORE eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if> id="_expressSendTime" class="input-control"  name="expressSendTime" <c:if test='${READ_ONLY_FORE != "readonly=readonly"}'>onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"</c:if>><span class="glyphicon glyphicon-calendar"></span></label>
									</td>
								</tr>
								<tr ${FIRST_HIDE }>
									<td width="30%">快递单号:</td>
									<td align="left">
									<label><input value="${t.expressNo}" ${READ_ONLY_FORE } <c:if test='${READ_ONLY_FORE eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if> class="input-control"  id="_expressNo" name="expressNo" ></label>
									</td>
									<td width="30%">快递到达时间:</td>
									<td align="left">
									<label><input value="${t.expressArrivalTime}" ${READ_ONLY_FORE } <c:if test='${READ_ONLY_FORE eq "readonly=readonly" }'> style="background-color: #C7C7C7" </c:if> <c:if test='${READ_ONLY_FORE != "readonly=readonly"}'>onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"</c:if>  id="_expressArrivalTime" name="expressArrivalTime"  ><span class="glyphicon glyphicon-calendar"></span></label>
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
				<!-- <button type="button" class="btn btn-default" id="saveBtn" >保存</button> -->
				<button type="button" class="btn btn-default" id="finishBtn" >保存<!-- 完成 --></button>
				
				<button type="button" class="btn btn-default" id="printBtn">打 印</button>
			</div>
		</div>
	</div>
</div>
