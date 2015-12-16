<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tr class="new">
	<td>
		<a href="#" onclick="javascript:showParts2(this);return false;">
			<input name="partses" class="input-control" id="_parts" readonly="readonly">
			<input type="hidden" name="partIds" id="_partIds">
			<span class="glyphicon glyphicon-new-window "></span>
		</a>
	</td>
	<td><input name="numbers" size="5" value="1" readonly="readonly" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>
	<td>
		<input name="remarks" type="hidden">
		<input name="partsName" readonly="readonly">
	</td>
	<td>
	<a href="#" onclick="javascript:deleteTr(this);return false;">删除</a>
	</td>
</tr>
