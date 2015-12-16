<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tr class="new">
	<td class="th_supiro" >
		<select name="supiros">
			<c:forEach items="${supiros}" var="s">
				<option value="${s.id }" dir="${s.name }">${s.name }</option>
			</c:forEach>
		</select>
		<!-- <input name="supiroNames"/> -->
	</td>
	<td class="th_engineer" >
		<select name="engineers">
			<c:forEach items="${engineers}" var="s">
				<option value="${s.id }" dir="${s.uName }">${s.uName }</option>
			</c:forEach>
		</select>
		<!-- <input name="engineerNames"/> -->
	</td>
	<td>
		<a href="#" onclick="javascript:showParts(this);return false;">
			<input name="partses" class="input-control" id="_parts" readonly="readonly">
			<input type="hidden" name="partIds" id="_partIds">
			<span class="glyphicon glyphicon-new-window "></span>
		</a>
	</td>
	<td><input name="numbers" size="5" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>
	<td><input name="prices" size="5" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>
	<td><input name="shelfNos" readonly="readonly" size="10"></td>
	<td><input name="totals" readonly="readonly" size="5"></td>
	<td>
	<a href="#" onclick="javascript:deleteTr(this);return false;">删除</a>
	</td>
</tr>
