<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tr class="new">
	<td><input name="machineModels" size="15" class="input-control" value=""></td>
	<td><input name="machineSerials" size="15" class="input-control" value=""></td>
	<td><input name="boardNos" size="15" class="input-control" value=""></td>
	<td><input name="hardDisks" size="15" class="input-control" value=""></td>
	<td><input name="batteryNums" size="15" class="input-control" value=""></td>
	
	<!-- <td><input name="memoryNums" size="15" class="input-control" value=""></td> -->
	
	<td><input name="memoryNum1s" size="15" class="input-control" value=""></td>
	<td><input name="memoryNum2s" size="15" class="input-control" value=""></td>
	<td><input name="memoryNum3s" size="15" class="input-control" value=""></td>
	<td><input name="memoryNum4s" size="15" class="input-control" value=""></td>
	
	<td><input name="powerNums" size="15" class="input-control" value=""></td>
	<td><input name="cdNums" size="15" class="input-control" value=""></td>
	<td><input name="keyboardNums" size="15" class="input-control" value=""></td>
	
	<td><input name="cpus" size="15" class="input-control" value=""></td>
	<td><input name="memoryInfs" size="15" class="input-control" value=""></td>
	<td><input name="hardDiskInfs" size="15" class="input-control" value=""></td>
	<td><input name="appearances" size="15" class="input-control" value=""></td>
	<td><input name="prices" size="15" class="input-control" value=""></td>
	<td>
		<select name="chargePeriods">
			<option value=""></option>
			<option value="DAY">日</option>
			<option value="MONTH">月</option>
			<option value="T_MONTH">3月</option>
			<option value="S_MONTH">6月</option>
			<option value="YEAR">年</option>
		</select></td>
	<td>
		<select name="returnStatuss" class="returnStatus${COUNT }" onchange="returnStatus2('${COUNT }')">
			<option value=""></option>
			<option value="GOOD">良好</option>
			<option value="FAIL">故障</option>
		</select>
	</td>
	<td>
		<input type="checkbox" onclick="ifCharge2('${COUNT }')"  name="ifCharges" value="YES" class="ifCharge${COUNT }" >是<input onclick="ifCharge2('${COUNT }')"  class="ifCharge${COUNT }" type="checkbox" name="ifCharges" value="NO" >否<br><font class="title_mount" id="title_mountC${COUNT }">金额:</font><input name="chargePrices" id="mountC${COUNT }" size="5" class="input-control" value="">
	</td>
	
	
	<td><input name="hireTimes" size="15" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" ><span class="glyphicon glyphicon-calendar"></span></td>
	<td><input name="rentTimes" size="15" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" ><span class="glyphicon glyphicon-calendar"></span></td>
	<td><input type="checkbox" name="isDeposits" value="YES" class="isDeposit${COUNT }" onclick="deposit('${COUNT }')">是<input type="checkbox" name="isDeposits" value="NO" class="isDeposit${COUNT }" onclick="deposit('${COUNT }')" >否<br><font class="title_mount" id="title_mountA${COUNT }">金额:</font><input id="mountA${COUNT }" name="leasingAmounts" size="5" class="input-control" value=""></td>
	<td><input name="returnTimes" size="15" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" ><span class="glyphicon glyphicon-calendar"></span></td>
	<td><input type="checkbox" name="extendedCharges" value="YES" class="extendedCharge${COUNT }" onclick="extendedCharge2('${COUNT }')">是<input class="extendedCharge${COUNT }" type="checkbox" name="extendedCharges" value="NO" onclick="extendedCharge2('${COUNT }')">否<br><font class="title_mount" id="title_mountB${COUNT }">金额:</font><input name="amountFeess" id="mountB${COUNT }" size="5" class="input-control" value=""></td>
	<td><input name="remarks" value=""></td>
	<td>
	<a href="#" onclick="javascript:deleteTr(this);return false;">删除</a>
	</td>
</tr>
