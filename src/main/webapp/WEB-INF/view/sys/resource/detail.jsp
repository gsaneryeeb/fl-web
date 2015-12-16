<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="modal fade" id="detailModal">
	<div class="modal-dialog"
		style="width: 600px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true"></button>
				<h4 class="modal-title">资源查看</h4>
			</div>
			<div class="modal-body">
				<div class="control-group panel panel-info">
					<div class="panel-heading" style="text-align: left;">基本信息</div>
					<form id="resourcesForm"
						action="${pageContext.request.contextPath}/sys/resource/save">
						<input type="hidden" value="${resources.id }" name="id">
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<td class="success" width="23%">资源名称:</td>
									<td align="left">${resources.name}</td>
								</tr>
								<tr>
								<tr>
									<td class="success">链接:</td>
									<td align="left">
									${resources.url}
									</td>
								</tr>
								<tr>
									<td class="success">备注:</td>
									<td align="left">
									${resources.des}
									</td>
								</tr>
								<tr>
								<td class="success">是否可用:</td>
								<td align="left">
										<c:if test="${resources.flag==1}">
											 启用 </c:if>
										<c:if test="${resources.flag==0}">停用 </c:if>
										</td>
								</tr>

							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				
			</div>
		</div>
	</div>
</div>
