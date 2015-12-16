<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 弹出页面 -->
<div class="modal fade" id="_detailModal">
	<div class="modal-dialog" style="width: 780px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">角色明细</h4>
			</div>
			<div class="modal-body">
				<div class="control-group panel panel-info">
					<div class="panel-heading" style="text-align: left;">角色基本信息</div>
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<td class="success" width="30%">角色中文名:</td>
									<td align="left" width="70%">${t.cname}</td>
								</tr>
								<tr>
									<td class="success" width="30%">角色英文名:</td>
									<td align="left">${t.ename}</td>
								</tr>
								<tr>
								<td class="success">是否可用:</td>
								<td align="left">
								<input disabled="disabled" type="radio" value="1" name="availability" <c:if test="${t.availability==1}">checked="checked"</c:if> /> 启用<input name="availability" disabled="disabled" type="radio" value="0" <c:if test="${t.availability==0}">checked="checked"</c:if>/>停用
								</td>
								</tr>
								<tr height="280"> 		
						    		<td  width="40%" colspan="2">所有权限列表<br/>
						    			<div class="zTreeDemoBackground left" style="height: 300px;overflow-y:scroll; ">
											<ul id="tree" class="ztree"></ul>
										</div>
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