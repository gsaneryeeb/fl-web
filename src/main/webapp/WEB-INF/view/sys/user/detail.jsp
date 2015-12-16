<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 弹出页面 -->
<div class="modal fade" id="_detailModal">
	<div class="modal-dialog" style="width: 900px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">用户明细</h4>
			</div>
			<div class="modal-body">
				<div class="control-group panel panel-info">
					<div class="panel-heading" style="text-align: left;">用户基本信息</div>
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<td class="success" width="20%">员工编号:</td>
									<td align="left" width="30%">${t.userNo}</td>
									<td class="success" width="20%">姓名:</td>
									<td align="left" width="30%">${t.uName}</td>
								</tr>
								<tr>
									<td class="success" width="20%">角色:</td>
									<td align="left">${t.role.cname}</td>
									<td class="success" width="20%">QQ:</td>
									<td align="left">${t.qq}</td>
								</tr>
								<tr>
									<td class="success" width="20%">电话:</td>
									<td align="left">${t.tel}</td>
									<td class="success" width="20%">是否可用:</td>
									<td align="left">
									<input disabled="disabled" type="radio" value="1" name="flag" <c:if test="${t.flag==1}">checked="checked"</c:if> /> 启用<input name="flag" disabled="disabled" type="radio" value="0" <c:if test="${t.flag==0}">checked="checked"</c:if>/>停用
									</td>
								</tr>
								<tr>
									<td class="success" width="20%">登录账户:</td>
									<td align="left">${t.userName}</td>
									<td class="success" width="20%">登录密码:</td>
									<td align="left">${t.uPass}</td>
								</tr>
								<tr>
									<td class="success" width="20%">身份证号:</td>
									<td align="left">${t.identityCard}</td>
									<td class="success" width="20%">家庭住址:</td>
									<td align="left">${t.homeAdress}</td>
								</tr>
								<tr>
									<td class="success" width="20%">入职日期:</td>
									<td align="left">${t.entryDate}</td>
									<td class="success" width="20%">试用期:</td>
									<td align="left" width="40%">
									${t.periodProbationStart}
									-
									${t.periodProbationEnd}
									</td>
								</tr>
								<tr>
									<td class="success" width="20%">签订合同日期:</td>
									<td align="left">${t.signingContract}</td>
									<td class="success" width="20%">合同日期:</td>
									<td align="left">
										${t.contractDateStart}
										-
										${t.contractDateEnd}
									</td>
								</tr>
								<tr>
									<td class="success" width="20%">离职日期:</td>
									<td align="left">${t.departureDate}</td>
									<td class="success" width="20%">户口性质:</td>
									<td align="left">
										<select name="accountNature" disabled="disabled">
											<option value=""></option>
											<option value="RURAL" <c:if test="${t.accountNature=='RURAL'}">selected="selected"</c:if>>农村</option>
											<option value="TOWN"  <c:if test="${t.accountNature=='TOWN'}">selected="selected"</c:if>>城镇</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="success" width="20%">上保险时间:</td>
									<td align="left">${t.insuranceOnTime}</td>
									<td class="success" width="20%"></td>
									<td align="left"></td>
								</tr>
								<tr height="280"> 		
						    		<td  width="40%" colspan="4">所有项目列表<br/>
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