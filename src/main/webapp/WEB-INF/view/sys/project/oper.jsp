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
				<h4 class="modal-title">项目${_fuc }</h4>
			</div>
			<div class="modal-body">
				<div class="control-group panel panel-info">
					<div class="panel-heading" style="text-align: left;">项目基本信息</div>
					<form id="_operForm" action="${pageContext.request.contextPath}/sys/project" method="${_method }">
						<input type="hidden" value="${t.id}" name="id">
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<td class="success" width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>项目中文名:</td>
									<td align="left"><input name="cname" value="${t.cname}" class="input-control" size="40" id="_cname"></td>
								</tr>
								<tr>
									<td class="success" width="30%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>项目ID:</td>
									<td align="left"><input name="no" value="${t.no}" class="input-control" size="40" id="_no"></td>
								</tr>
								<tr>
									<td class="success" width="30%">项目类型:</td>
									<td align="left">
										<select id="_typeId" name="typeId" onchange="changeType()">
											<c:forEach items="${pTypes}" var="types" begin="0" varStatus="status">
												<c:if test="${status.index==0 }">
												<script>
													$("#_type").val('${types.value}');
												</script>
												</c:if>
												<option value="${types.key}" <c:if test='${t.typeId==types.key}'>selected="selected"</c:if>>${types.key}_${types.value}</option>
											</c:forEach>
										</select>
										<input name="type" id="_type" type="hidden" value="${t.type }">
									</td>
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
