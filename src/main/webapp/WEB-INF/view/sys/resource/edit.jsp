<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="modal fade" id="resourcesModal">
	<div class="modal-dialog"
		style="width: 400px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true"></button>
				<h4 class="modal-title">资源修改</h4>
			</div>
			<div class="modal-body">
				<div class="control-group panel panel-info">
					<div class="panel-heading" style="text-align: left;">资源基本信息</div>
					<form id="resourcesForm"
						action="${pageContext.request.contextPath}/sys/resource/save">
						<input type="hidden" value="${resources.id }" name="id">
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<td class="success" width="23%">资源名称:</td>
									<td align="left"><input name=name value="${resources.name}"
										class="input-control" size="40" id="_name"></td>
								</tr>
								<tr>
									<td class="success" width="23%">上级:</td>
									<td align="left">
										<select name="superior">
											<option value="0">=请选择=</option>
											<c:forEach items="${topList }" var="t">
												<option value="${t.id }" <c:if test="${resources.superior eq t.id}">selected='selected'</c:if>>${t.name }</option>
												<c:if test="${t.resourceses!=null && t.resourceses.size()>0 }">
													<c:forEach items="${t.resourceses }" var="two">
													<option value="${two.id }" <c:if test="${resources.superior eq two.id}">selected='selected'</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${two.name }</option>
															<c:if test="${two.resourceses!=null && two.resourceses.size()>0 }">
																<c:forEach items="${two.resourceses }" var="three">
																	<option value="${three.id }" <c:if test="${resources.superior eq three.id}">selected='selected'</c:if>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${three.name }</option>
																</c:forEach>
															</c:if>
													</c:forEach>
												</c:if>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td class="success">链接:</td>
									<td align="left">
									<input name=url value="${resources.url}"
										class="input-control" size="40" id="_url">
									</td>
								</tr>
								<tr>
									<td class="success">排序:</td>
									<td align="left">
										<input name=sort value="${resources.sort}" class="input-control" size="40" id="_url">
									</td>
								</tr>
								<tr>
									<td class="success">备注:</td>
									<td align="left">
									<input name=des value="${resources.des}"
										class="input-control" size="40" id="_des">
									</td>
								</tr>
								<tr>
								<td class="success">是否可用:</td>
								<td align="left"><c:choose>
										<c:when test="${resources.flag==1}">
											<input type="radio" value="1" name=flag checked="checked" /> 启用 <input
												name=flag type="radio" value="0" />停用
						</c:when>
										<c:when test="${resources.flag==0}">
											<input name=flag type="radio" value="1" />  启用 
												<input type="radio" value="0" name=flag checked="checked" /> 停用 
								
						</c:when>
										<c:when test="${resources.flag==null}">
											<input name=flag type="radio" value="1" checked="checked" /> 启用
												<input type="radio" value="0" name=flag /> 停用 
								
						</c:when>
									</c:choose></td>
								</tr>

							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="_saveBtn"
					checkFuc="checkresourcesSave">保存</button>
				
			</div>
		</div>
	</div>
</div>
