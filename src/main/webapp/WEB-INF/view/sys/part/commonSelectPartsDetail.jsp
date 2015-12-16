<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 弹出页面 -->
<div class="control-group panel panel-info">
	<table class="table	table-bordered table-condensed">
		<thead>
			<tr>
				<th class="table_screentitle" width="80">备件FRU</th>
				<th class="table_screentitle" width="80">备件名称</th>
				<th class="table_screentitle" width="200">备件描述</th>
				<th class="table_screentitle">替代FRU</th>
				<th class="table_screentitle" width="40">货架</th>
				<th class="table_screentitle returnHiden">库存数量</th>
				<!-- <th class="table_screentitle returnHiden">旧件数量</th> -->
			</tr>
		</thead>
		<c:if test="${parts!=null }">
			<c:forEach items="${parts}" var="t" varStatus="s">
				<tr align="center">
					<td><input type="radio" name="selectPartId" value="${t.id }" <c:if test="${s.index==0 }">checked='checked'</c:if>>${t.no}</td>
					<td>${t.name}</td>
					<td>${t.partDes}</td>
					<td>${t.partFru}</td>
					<td>${t.rack}</td>
					<td class="returnHiden"><input type="radio" name="newOld${t.id }" value="new" checked="checked" style="display: none;">${t.number }</td>
					<input type="radio" name="newOld${t.id }" value="old" style="display: none;"><input type="hidden" id="${t.id}" partName="${t.name }" newNumber="${t.newNumber }" oldNumber="${t.oldNumber }" des="${t.partDes }" partId="${t.id }" no="${t.no }" price='${t.price }' stock="${t.number }" rack="${t.rack }" wac="${t.wac }">
				</tr>
			</c:forEach>
		</c:if>
	</table>
</div>
