<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="modal fade" id="_operModal">
	<div class="modal-dialog"
		style="width: 500px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">供应商${_fuc }</h4>
			</div>
			<div class="modal-body">
				<div class="control-group panel panel-info">
					<div class="panel-heading" style="text-align: left;">供应商基本信息</div>
					<form id="_operForm" action="${pageContext.request.contextPath}/sys/supiro" method="${_method }">
						<input type="hidden" value="${t.id}" name="id">
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<td class="success" width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>供应商名称:</td>
									<td align="left"><input name="name" value="${t.name}" class="input-control" size="40" id="_name"></td>
								</tr>
								<tr>
									<td class="success" width="30%">供应商地址:</td>
									<td align="left"><input name="address" value="${t.address}" class="input-control" size="40" id="_address"></td>
								</tr>
								<tr>
									<td class="success" width="30%">联系人:</td>
									<td align="left"><input name="contacts" value="${t.contacts}"
										class="input-control" size="40" id="_contacts" >
										</td>
								</tr>
								<tr>
									<td class="success" width="30%">联系人电话:</td>
									<td align="left"><input name="tel" value="${t.tel}"
										class="input-control" size="40" id="_tel" ></td>
								</tr>
								<tr>
								<td class="success">是否可用:</td>
								<td align="left">
								<c:choose>
										<c:when test="${t.flag==1}">
											<input type="radio" value="1" name="flag" checked="checked" /> 启用 <input
												name="flag" type="radio" value="0" />停用
										</c:when>
										<c:when test="${t.flag==0}">
											<input name="flag" type="radio" value="1" />  启用 
												<input type="radio" value="0" name="flag" checked="checked" /> 停用 
								
										</c:when>
										<c:when test="${t.flag==null}">
											<input name="flag" type="radio" value="1" checked="checked" /> 启用
												<input type="radio" value="0" name="flag" /> 停用 
								
										</c:when>
								</c:choose>
								</td>
								</tr>

							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="_saveBtn"
					checkFuc="checkSave">保存</button>
				
			</div>
		</div>
	</div>
</div>
