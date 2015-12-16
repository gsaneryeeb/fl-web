<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<tr class="new">
	<td>
		<a href="#" onclick="javascript:showParts(this);return false;">
			<input name="partses" class="input-control" id="_parts" readonly="readonly">
			<input type="hidden" name="partIds" id="_partIds">
			<input type="hidden" name="types" id="_types">
			<input type="hidden" name="counts" id="_counts">
			<span class="glyphicon glyphicon-new-window "></span>
		</a>
	</td>
	<td><input name="partNames" readonly="readonly" size="10"></td>
	<td><input name="numbers" size="5"></td>
	<td><input name="wacs" size="5" readonly="readonly"></td>
	<td><input name="totals" readonly="readonly" size="5"></td>
	<td><input name="applyReasons" size="30"></td>
	<td><input name="approvalRemarks" size="30" id="_approvalRemarks" readonly="readonly"></td>
	<td>
	<a href="#" onclick="javascript:deleteTr(this);return false;">删除</a>
	</td>
</tr>
