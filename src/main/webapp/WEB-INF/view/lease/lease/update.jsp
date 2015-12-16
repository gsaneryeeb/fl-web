<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript">
var count=${_t.leaseDetails==null?0:_t.leaseDetails.size()};
$(function(){
	$(".complete").hide();
	$("#printBtn").click(function(){
		$(".PrintArea").printArea();
	});
	$("input[name='leasePro']").click(function(){
		if($(this).val()=="PERSON"){
			$(".complete").hide();
			$(".peason").show();
		}
		if($(this).val()=="COMPLETE"){
			$(".peason").hide();
			$(".complete").show();
		}
	});
	$("#diaAddBtn2").click(function(){
	    count++;
		$.post("${pageContext.request.contextPath}/lease/lease/addParts",
		function(data, status, xhr) {
			if (status == "success") {
				$("#add_table #segment_start").after(data);
				$("input[name='leasingAmounts']").hide();
				$("input[name='amountFeess']").hide();
				$("input[name='chargePrices']").hide();
				$(".title_mount").hide();
			}
			$("#counts").text(count);
		});
	});
	
	//修改初始化
	$("input[name='ifCharges']").click(function(){
		var count=$(this).attr("count");
		var is=false;
		if($(this).is(":checked")){
			is=true;
		}
		if($(this).val()=="NO"){
			$("#mountC"+count).hide();
			$("#mountC"+count).val("");
			$("#title_mountC"+count).hide();
		}
		$(".ifCharge"+count).attr('checked',false);
		if(is==true){
			$(this).prop('checked',true);
		}else{
			$(this).prop('checked',false);
		}
	});
	$("input[name='extendedCharges']").click(function(){
		var is=false;
		var count=$(this).attr("count");
		if($(this).is(":checked")){
			is=true;
		}
		if($(this).val()=="NO"){
			$("#mountB"+count).hide();
			$("#mountB"+count).val("");
			$("#title_mountB"+count).hide();
		}
		$(".extendedCharge"+count).attr('checked',false);
		if(is==true){
			$(this).prop('checked',true);
		}else{
			$(this).prop('checked',false);
		}
	});
	
	$("input[name='isDeposits']").click(function(){
		var is=false;
		var count=$(this).attr("count");
		if($(this).is(":checked")){
			is=true;
		}
		if($(this).val()=="NO"){
			$("#mountA"+count).hide();
			$("#mountA"+count).val("");
			$("#title_mountA"+count).hide();
		}
		$(".isDeposit"+count).attr('checked',false);
		if(is==true){
			$(this).prop('checked',true);
		}else{
			$(this).prop('checked',false);
		}
	});
});

function deposit(count){
	$(".isDeposit"+count).click(function(){
		var is=false;
		if($(this).is(":checked")){
			is=true;
		}
		if($(this).val()=="NO"){
			$("#mountA"+count).hide();
			$("#mountA"+count).val("");
			$("#title_mountA"+count).hide();
		}
		$(".isDeposit"+count).attr('checked',false);
		if(is==true){
			$(this).prop('checked',true);
		}else{
			$(this).prop('checked',false);
		}
	});
	if(typeof($(".isDeposit"+count+":checked").val())=="undefined"){
		$("#mountA"+count).hide();
		$("#mountA"+count).val("");
		$("#title_mountA"+count).hide();
	}else{
		if($(".isDeposit"+count+":checked").val()=="YES"){
			$("#mountA"+count).show();
			$("#title_mountA"+count).show();
		}else{
			$("#title_mountA"+count).hide();
			$("#mountA"+count).hide();
			$("#mountA"+count).val("");
		}
	}
}

function extendedCharge2(count){
	$(".extendedCharge"+count).click(function(){
		var is=false;
		if($(this).is(":checked")){
			is=true;
		}
		if($(this).val()=="NO"){
			$("#mountB"+count).hide();
			$("#mountB"+count).val("");
			$("#title_mountB"+count).hide();
		}
		$(".extendedCharge"+count).attr('checked',false);
		if(is==true){
			$(this).prop('checked',true);
		}else{
			$(this).prop('checked',false);
		}
	});
	if(typeof($(".extendedCharge"+count+":checked").val())=="undefined"){
		$("#mountB"+count).hide();
		$("#mountB"+count).val("");
		$("#title_mountB"+count).hide();
	}else{
		if($(".extendedCharge"+count+":checked").val()=="YES"){
			$("#mountB"+count).show();
			$("#title_mountB"+count).show();
		}else{
			$("#title_mountB"+count).hide();
			$("#mountB"+count).hide();
			$("#mountB"+count).val("");
		}
	}
}
function ifCharge2(count){
	$(".ifCharge"+count).click(function(){
		var is=false;
		if($(this).is(":checked")){
			is=true;
		}
		if($(this).val()=="NO"){
			$("#mountC"+count).hide();
			$("#mountC"+count).val("");
			$("#title_mountC"+count).hide();
		}
		$(".ifCharge"+count).attr('checked',false);
		if(is==true){
			$(this).prop('checked',true);
		}else{
			$(this).prop('checked',false);
		}
	});
	if(typeof($(".ifCharge"+count+":checked").val())=="undefined"){
		$("#mountC"+count).hide();
		$("#mountC"+count).val("");
		$("#title_mountC"+count).hide();
	}else{
		if($(".ifCharge"+count+":checked").val()=="YES"){
			$("#mountC"+count).show();
			$("#title_mountC"+count).show();
		}else{
			$("#title_mountC"+count).hide();
			$("#mountC"+count).hide();
			$("#mountC"+count).val("");
		}
	}
}

function returnStatus2(count){
	if($(".returnStatus"+count).val()=="FAIL"){
		$(".ifCharge"+count).attr("onclick","ifCharge2('"+count+"')");
	}else{
		$(".ifCharge"+count).attr("onclick","return false");
		$(".ifCharge"+count).prop('checked',false);
		$("#title_mountC"+count).hide();
		$("#mountC"+count).hide();
		$("#mountC"+count).val("");
	}
}

function deleteTr(obj){
    count--;
	$(obj).parent("td").parent("tr").remove();	
	$("#counts").text(count);
};
</script>
<div class="modal fade" id="_operModal">
	<div class="modal-dialog"
		style="width: 1200px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body PrintArea">
				<div class="control-group panel panel-info">
				<div class="panel-heading" style="text-align: center;">北京利华永文商贸有限责任公司<br>租赁机器信息</div>
					<form id="_operForm" action="${pageContext.request.contextPath}/lease/lease/updateSave" method="POST">
						<input name="id" value="${_t.id }" type="hidden">
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<td class="success" >地址:</td>
									<td align="left">北京市昌平区回龙观镇同城街41-11<input name="adress" value="北京市昌平区回龙观镇同城街41-11" type="hidden"></td>
									<td class="success" >联系电话:</td>
									<td align="left">010-81725838 18910560811<input type="hidden" name="tel" value="010-81725838 18910560811" class="input-control"></td>
									<td class="success" >编号:</td>
									<td align="left"><input name="no" value="${_t.no}" class="input-control" id="_no" readonly="readonly"></td>
								</tr>
								<tr>
									<td>租赁性质:</td>
									<td align="left">
										<input type="radio" name="leasePro" value="PERSON" <c:if test="${_t.leasePro=='PERSON'}">checked="checked" </c:if><c:if test="${_t.leasePro==null}">checked="checked" </c:if>> 个人 <input type="radio" name="leasePro" value="COMPLETE"  <c:if test="${_t.leasePro=='COMPLETE'}">checked="checked" </c:if>> 企业
									</td>
									<td>合同号:</td>
									<td align="left"><input type="text" name="contractNo" value="${_t.contractNo}" class="input-control"></td>
									<td >收费方式:</td>
									<td align="left">
										<select name="charge">
											<option value=""></option>
											<option value="PRE" <c:if test="${_t.charge=='PRE'}">selected="selected"</c:if>>预付费</option>
											<option value="AFTER" <c:if test="${_t.charge=='AFTER'}">selected="selected"</c:if>>后付费</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="success" >客户名称:</td>
									<td align="left"><input name="cusName" value="${_t.cusName}"  id="_cusName" class="input-control"></td>
									<td class="success" ><span class="peason">身份证:</span><span class="complete">营业执照注册号:</span></td>
									<td align="left"><span class="peason"><input name="cusId" value="${_t.cusId}" class="input-control"></span>
									<span class="complete"><input name="licenseNum" value="${_t.licenseNum}" class="input-control"></span>
									</td>
									<td class="success" >收费金额</td>
									<td align="left">
										<input id="_chargePrice" name="chargePrice" value="${_t.chargePrice}" class="input-control">
									</td>
								</tr>
								<tr>
									<td >客户地址:</td>
									<td align="left"><input name="cusAdress" value="${_t.cusAdress}"  class="input-control"></td>
									<td >联系电话:</td>
									<td align="left"><input name="cusTel" value="${_t.cusTel}" class="input-control"></td>
									<td ></td>
									<td align="left">
										
									</td>
								</tr>
								<tr class="complete">
									<td class="success" >组织机构代码:</td>
									<td align="left"><input name="organizationCode" value="${_t.organizationCode}"></td>
									<td class="success" >税务登记证:</td>
									<td align="left"><input name="taxReg" value="${_t.taxReg}" class="input-control"></td>
									<td class="success" ></td>
									<td align="left"></td>
								</tr>
								<tr>
									<td colspan="5" align="left">机器基本信息:</td>
									<td align="right">
										<button style="text-align: right;" id="diaAddBtn2" type="button" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-plus"></span>添加备件</button>
									</td>
								</tr>
								<tr>
									<td colspan="6" align="left">
										<div style="overflow-x:auto;overflow-y:auto;width:1140px;">
											<table id="add_table" class="table table-condensed table-nutrition" style="overflow-x:auto;width:3200px;overflow-y:hidden;">
												<tr>
													<td width="117">机器型号</td>
													<td width="117">机器序列号</td>
													<td width="117">主板编号</td>
													<td width="117">硬盘编号</td>
													<td width="117">电池编号</td>
													<!-- <td width="117">内存编号</td> -->
													
													<td width="117">内存编号1</td>
													<td width="117">内存编号2</td>
													<td width="117">内存编号3</td>
													<td width="117">内存编号4</td>
													
													
													<td width="117">电源编号</td>
													<td width="117">光驱编号</td>
													<td width="117">键盘编号</td>
													
													<td width="117">CPU信息</td>
													<td width="117">内存信息</td>
													<td width="117">硬盘信息</td>
													<td width="117">外观</td>
													<td width="117">租赁价格</td>
													<td width="117">收费周期</td>
													<td width="140">返回状态</td>
													<td width="140">是否收费</td>
													
													<td width="140">起租时间</td>
													<td width="140">到租时间</td>
													<td width="130">是否有押金</td>
													<td width="140">机器返回时间</td>
													<td width="130">超期是否收费</td>
													<td width="117">备注</td>
													<td width="117">操作</td>
												</tr>
												<c:forEach items="${_d}" var="details">
												<tr class="new">
													<td><input name="machineModels" size="15" class="input-control" value="${details.machineModel}"></td>
													<td><input name="machineSerials" size="15" class="input-control" value="${details.machineSerial}"></td>
													<td><input name="boardNos" size="15" class="input-control" value="${details.boardNo}"></td>
													<td><input name="hardDisks" size="15" class="input-control" value="${details.hardDisk}"></td>
													<td><input name="batteryNums" size="15" class="input-control" value="${details.batteryNum}"></td>
													
													<!-- <td><input name="memoryNums" size="15" class="input-control" value="${details.memoryNum}"></td> -->
													
													<td><input name="memoryNum1s" size="15" class="input-control" value="${details.memoryNum1}"></td>
													<td><input name="memoryNum2s" size="15" class="input-control" value="${details.memoryNum2}"></td>
													<td><input name="memoryNum3s" size="15" class="input-control" value="${details.memoryNum3}"></td>
													<td><input name="memoryNum4s" size="15" class="input-control" value="${details.memoryNum4}"></td>
													
													<td><input name="powerNums" size="15" class="input-control" value="${details.powerNum}"></td>
													<td><input name="cdNums" size="15" class="input-control" value="${details.cdNum}"></td>
													<td><input name="keyboardNums" size="15" class="input-control" value="${details.keyboardNum}"></td>
													
													<td><input name="cpus" size="15" class="input-control" value="${details.cpu}"></td>
													<td><input name="memoryInfs" size="15" class="input-control" value="${details.memoryInf}"></td>
													<td><input name="hardDiskInfs" size="15" class="input-control" value="${details.hardDiskInf}"></td>
													<td><input name="appearances" size="15" class="input-control" value="${details.appearance}"></td>
													<td><input name="prices" size="15" class="input-control" value="${details.price}"></td>
													<td>
														<select name="chargePeriods">
															<option value=""></option>
															<option value="DAY" <c:if test="${details.chargePeriod=='DAY' }"> selected="selected"  </c:if>>日</option>
															<option value="MONTH" <c:if test="${details.chargePeriod=='MONTH' }"> selected="selected"  </c:if>>月</option>
															<option value="T_MONTH" <c:if test="${details.chargePeriod=='T_MONTH' }"> selected="selected"  </c:if>>3月</option>
															<option value="S_MONTH" <c:if test="${details.chargePeriod=='S_MONTH' }"> selected="selected"  </c:if>>6月</option>
															<option value="YEAR" <c:if test="${details.chargePeriod=='YEAR' }"> selected="selected"  </c:if>>年</option>
														</select>
													</td>
													<td>
														<select name="returnStatuss" class="returnStatus${COUNT }" onchange="returnStatus2('${COUNT }')">
															<option value="" ></option>
															<option value="GOOD" <c:if test="${details.returnStatus=='GOOD' }"> selected="selected"  </c:if>>良好</option>
															<option value="FAIL" <c:if test="${details.returnStatus=='FAIL' }"> selected="selected"  </c:if>>故障</option>
														</select>
													</td>
													<td>
														<input type="checkbox" onclick="ifCharge2('${COUNT }')"  <c:if test="${details.ifCharge=='YES' }"> checked="checked"</c:if> name="ifCharges" value="YES" class="ifCharge${COUNT }" count="${COUNT }">是<input onclick="ifCharge2('${COUNT }')"  class="ifCharge${COUNT }" type="checkbox" name="ifCharges" value="NO" <c:if test="${details.ifCharge=='NO' }"> checked="checked"</c:if> count="${COUNT }">否<br>
														<font class="title_mount" id="title_mountC${COUNT }" style="display: <c:if test="${details.ifCharge=='NO' }">none;</c:if><c:if test="${details.ifCharge=='YES' }">block;</c:if>">金额:</font><input name="chargePrices" id="mountC${COUNT }" size="5" class="input-control" value="${details.chargePrice}" style="display: <c:if test="${details.ifCharge=='NO' }">none;</c:if><c:if test="${details.ifCharge=='YES' }">block;</c:if>">
													</td>
													
													<td><input name="hireTimes" value="${details.hireTime }" size="15" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'%y-%M-%d'})" ><span class="glyphicon glyphicon-calendar"></span></td>
													<td><input name="rentTimes" value="${details.rentTime }" size="15" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'%y-%M-%d'})" ><span class="glyphicon glyphicon-calendar"></span></td>
													<td>
														<input type="checkbox" name="isDeposits" count="${COUNT }" <c:if test="${details.isDeposit=='YES' }"> checked="checked" </c:if> value="YES" class="isDeposit${COUNT }" onclick="deposit('${COUNT }')">是<input type="checkbox" count="${COUNT }" <c:if test="${details.isDeposit=='NO' }"> checked="checked" </c:if> name="isDeposits" value="NO" class="isDeposit${COUNT }" onclick="deposit('${COUNT }')" >否
														<br><font class="title_mount" id="title_mountA${COUNT }" style="display: <c:if test="${details.isDeposit=='NO' }">none;</c:if><c:if test="${details.isDeposit=='YES' }">block;</c:if>">金额:</font><input id="mountA${COUNT }" name="leasingAmounts" size="5" class="input-control" value="${details.leasingAmount}" style="display: <c:if test="${details.isDeposit=='NO' }">none;</c:if><c:if test="${details.isDeposit=='YES' }">block;</c:if>">
													</td>
													<td><input name="returnTimes" value="${details.returnTime }" size="15" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d'})" ><span class="glyphicon glyphicon-calendar"></span></td>
													<td><input type="checkbox" count="${COUNT }" name="extendedCharges" value="YES" <c:if test="${details.extendedCharge=='YES' }"> checked="checked"</c:if> class="extendedCharge${COUNT }" onclick="extendedCharge2('${COUNT }')">是<input count="${COUNT }" class="extendedCharge${COUNT }" type="checkbox" name="extendedCharges" <c:if test="${details.extendedCharge=='NO' }"> checked="checked"</c:if> value="NO" onclick="extendedCharge2('${COUNT }')">否<br>
														<font class="title_mount" id="title_mountB${COUNT }" style="display: <c:if test="${details.extendedCharge=='NO' }">none;</c:if><c:if test="${details.extendedCharge=='YES' }">block;</c:if>">金额:</font><input name="amountFeess" id="mountB${COUNT }" size="5" class="input-control" value="${details.amountFees}" style="display: <c:if test="${details.extendedCharge=='NO' }">none;</c:if><c:if test="${details.extendedCharge=='YES' }">block;</c:if>">
													</td>
													<td><input name="remarks" value="${details.remark}"></td>
													<td>
													<a href="#" onclick="javascript:deleteTr(this);return false;">删除</a>
													</td>
												</tr>
												</c:forEach>
												<tr id="segment_start" class="hidden"></tr>
	    										<tr id="segment_end" class="hidden"></tr>
											</table>
										</div>
									</td>
								</tr>
								<tr>
									<td>合计:</td>
									<td colspan="5" id="counts" align="left" style="font-size: 10;font-weight: bold;">
										${_d==null?0:_d.size()}
									</td>
								</tr>
								<!-- 
								<tr>
									<td colspan="6" align="left">备件配置信息及运行状态:</td>
								</tr>
												
								<tr>
									<td class="success" >CPU信息:</td>
									<td align="left"><input name="cpu" value="${t.cpu}"  class="input-control"></td>
									<td class="success" >内存信息:</td>
									<td align="left"><input name="memoryInf" value="${t.memoryInf}" class="input-control"></td>
									<td class="success" >硬盘信息:</td>
									<td align="left"><input name="hardDiskInf" value="${t.hardDiskInf}" class="input-control"></td>
								</tr>
								<tr>
									<td >运行状况:</td>
									<td align="left"><input name="operationStatus" value="${t.operationStatus}"  class="input-control"></td>
									<td >外观:</td>
									<td align="left"><input name="appearance" value="${t.appearance}" class="input-control"></td>
									<td >备注:</td>
									<td align="left"><input name="operationNote" value="${t.operationNote}"  class="input-control"></td>
								</tr>
								
								<tr>
									<td colspan="6" align="left" >确认签字:<input name="confirm" value="${t.confirm}"  class="input-control"></td>
								</tr>
								<tr>
									<td >验机人:</td>
									<td colspan="2" align="left"><input name="acceptance" value="${t.acceptance}"  class="input-control"></td>
									<td >日期:</td>
									<td colspan="2" align="left"><input name="acceptanceTime" value="${t.acceptanceTime}" class="input-control" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" ><span class="glyphicon glyphicon-calendar"></span></td>
								</tr>
								<tr>
									<td >客户签名:</td>
									<td colspan="2" align="left"><input name="signature" value="${t.signature}"  class="input-control"></td>
									<td >日期:</td>
									<td colspan="2" align="left"><input name="signatureTime" value="${t.signatureTime}" class="input-control" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" ><span class="glyphicon glyphicon-calendar"></span></td>
								</tr>
								<tr>
									<td >经办人签字:</td>
									<td colspan="2" align="left"><input name="attnSignature" value="${t.attnSignature}"  class="input-control"></td>
									<td >日期:</td>
									<td colspan="2" align="left"><input name="attnSignatureTime" value="${t.attnSignatureTime}" class="input-control" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" ><span class="glyphicon glyphicon-calendar"></span></td>
								</tr>
								<tr>
									<td colspan="6" align="left">
										备注：请认真核对主机码及机器插拔的电池，光驱，AC的条形码是否与验机报告中的条形码一致，请勿擅自拆钉谢谢合作。
									</td>
								</tr>-->
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="_saveBtn" checkFuc="checkSave">保存</button>
			</div>
		</div>
	</div>
</div>
