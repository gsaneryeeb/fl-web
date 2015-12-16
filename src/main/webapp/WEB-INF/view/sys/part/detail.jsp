<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 弹出页面 -->
<div class="modal fade" id="_detailModal">
	<div class="modal-dialog" style="width: 780px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">备件信息明细</h4>
			</div>
			<div class="modal-body">
				<div class="control-group panel panel-info">
					<div class="panel-heading" style="text-align: left;">备件基本信息</div>
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<td class="success" width="30%">备件FRU:</td>
									<td align="left">${t.no}</td>
								</tr>
								<tr>
									<td class="success" width="30%">机器型号:</td>
									<td align="left">${t.model}</td>
								</tr>
								<tr>
									<td class="success" width="30%">备件名称:</td>
									<td align="left">${t.name}</td>
								</tr>
								<tr>
									<td class="success" width="30%">备件描述:</td>
									<td align="left">${t.partDes}</td>
								</tr>
								<tr>
									<td class="success" width="30%">替代FRU:</td>
									<td align="left">${t.partFru}</td>
								</tr>
								<tr>
									<td class="success" width="30%">货架:</td>
									<td align="left">${t.rack}</td>
								</tr>
								<tr>
								<td class="success">是否可用:</td>
								<td align="left">
								<input disabled="disabled" type="radio" value="1" name="flag" <c:if test="${t.flag==1}">checked="checked"</c:if> /> 启用<input name="flag" disabled="disabled" type="radio" value="0" <c:if test="${t.flag==0}">checked="checked"</c:if>/>停用
								</td>
								</tr>

							</tbody>
						</table>
				</div>							
			</div>

			<div class="modal-footer">				
				
			</div>
		</div>
	</div>
</div>