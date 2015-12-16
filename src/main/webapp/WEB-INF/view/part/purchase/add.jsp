<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tr class="new">
	<!-- 
	<td class="th_supiro" >
		<select name="supiros">
			<c:forEach items="${supiros}" var="s">
				<option value="${s.id }" dir="${s.name }">${s.name }</option>
			</c:forEach>
		</select>
		<1!-- <input name="supiroNames"/> --1>
	</td>
	<td class="th_engineer" >
		<select name="engineers">
			<c:forEach items="${engineers}" var="s">
				<option value="${s.id }" dir="${s.uName }">${s.uName }</option>
			</c:forEach>
		</select>
		<1!-- <input name="engineerNames"/> --1>
	</td> -->
	<td>
		<a href="#" onclick="javascript:showParts(this);return false;">
			<input name="partses" class="input-control" id="_parts" readonly="readonly" size="15">
			<input type="hidden" name="partIds" id="_partIds">
			<input type="hidden" name="racks" id="_racks">
			<span class="glyphicon glyphicon-new-window "></span>
		</a>
	</td>
	<td><input name="partNames" readonly="readonly" size="10">
		<input type="hidden" name="partRemark" id="_partRemark">
	</td>
	<td><input name="numbers" size="5" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>

	<!-- 去掉小数限制<td><input name="prices" size="5" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>-->
	<td><input name="prices" size="5" ></td>

	<td><input name="ordersDates" readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" size="18"></td>
	<td><input name="totals" readonly="readonly" size="5"></td>
	<td>
		<select name="sources">
			<option value="PURCHASE">新采购</option>
		</select>
	</td>
	<td>
		<select name="supplierIds" style="width: 80px;">
			<c:forEach items="${supiros}" var="s">
				<option value="${s.id }" dir="${s.name }">${s.name }</option>
			</c:forEach>
		</select>
	</td>
	<td><input name="inOrders"></td>
	<!-- 
	<th width="90">
		<select name="speakForStatus">
			<option value="NOTARRIVE">未到货</option>
			<option value="ARRIVED">已到货</option>
		</select>
	</th> -->
	<td><input name="arrivalDates" readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" size="18"></td>
	<td>
		<select name="allotEngineers">
			<option value=""></option>
			<option value="FIRST">初检工程师</option>
			<option value="SECOND">二级维修工程师</option>
		</select>
	</td>
	<td>
	<a href="#" onclick="javascript:deleteTr(this);return false;">删除</a>
	</td>
</tr>
