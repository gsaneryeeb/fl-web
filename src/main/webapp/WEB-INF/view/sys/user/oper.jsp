<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="modal fade" id="_operModal">
	<div class="modal-dialog"
		style="width: 900px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">用户${_fuc }</h4>
			</div>
			<div class="modal-body">
				<div class="control-group panel panel-info">
					<div class="panel-heading" style="text-align: left;">用户基本信息</div>
					<form id="_operForm" action="${pageContext.request.contextPath}/sys/user" method="${_method }">
						<input type="hidden" value="${t.id}" name="id">
						<input type="hidden" name="ids" id="ids">
						<input type="hidden" name="roleIdFk" id="roleIds">
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<td class="success" width="20%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>员工编号:</td>
									<td align="left"><input name="userNo" value="${t.userNo}" class="input-control" size="40" id="_userNo"></td>
									<td class="success" width="20%">姓名:</td>
									<td align="left"><input name="uName" value="${t.uName}" class="input-control" size="40" id="_uName"></td>
								</tr>
								<tr>
									<td class="success" width="20%">上保险时间:</td>
									<td align="left"><input name="insuranceOnTime" value="${t.insuranceOnTime}" class="input-control" size="20" id="_insuranceOnTime" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" ><span class="glyphicon glyphicon-calendar"></span></td>
									<td class="success" width="20%">QQ:</td>
									<td align="left"><input name="qq" value="${t.qq}" class="input-control" size="40" id="_qq" ></td>
								</tr>
								<tr>
									<td class="success" width="20%">电话:</td>
									<td align="left"><input name="tel" value="${t.tel}"
										class="input-control" size="40" id="_tel" ></td>
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
								<tr>
									<td class="success" width="20%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>登录账户:</td>
									<td align="left"><input name="userName" value="${t.userName}"
										class="input-control" size="40" id="_userName" ></td>
									<td class="success" width="20%"><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>登录密码:</td>
									<td align="left"><input name="uPass" value="${t.uPass}" type="password" class="input-control" size="40" id="_uPass" ></td>
								</tr>
								<tr>
									<td class="success" width="20%">身份证号:</td>
									<td align="left"><input name="identityCard" value="${t.identityCard}"
										class="input-control" size="40" id="_identityCard" ></td>
									<td class="success" width="20%">家庭住址:</td>
									<td align="left"><input name="homeAdress" value="${t.homeAdress}" class="input-control" size="40" id="_homeAdress" ></td>
								</tr>
								<tr>
									<td class="success" width="20%">入职日期:</td>
									<td align="left"><input name="entryDate" value="${t.entryDate}"
										class="input-control" size="20" id="_entryDate"onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" ><span class="glyphicon glyphicon-calendar"></span></td>
									<td class="success" width="20%">试用期:</td>
									<td align="left" width="40%">
									<input name="periodProbationStart" value="${t.periodProbationStart}" class="input-control" size="18" id="_periodProbationStart" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" ><span class="glyphicon glyphicon-calendar"></span>
									-
									<input name="periodProbationEnd" value="${t.periodProbationEnd}" class="input-control" size="18" id="_periodProbationEnd" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" ><span class="glyphicon glyphicon-calendar"></span>
									</td>
								</tr>
								<tr>
									<td class="success" width="20%">签订合同日期:</td>
									<td align="left"><input name="signingContract" value="${t.signingContract}"
										class="input-control" size="20" id="_signingContract" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" ><span class="glyphicon glyphicon-calendar"></span></td>
									<td class="success" width="20%">合同日期:</td>
									<td align="left">
										<input name="contractDateStart" value="${t.contractDateStart}" class="input-control" size="18" id="_contractDateStart" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" ><span class="glyphicon glyphicon-calendar"></span>
										-
										<input name="contractDateEnd" value="${t.contractDateEnd}" class="input-control" size="18" id="_contractDateEnd" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" ><span class="glyphicon glyphicon-calendar"></span>
									</td>
								</tr>
								<tr>
									<td class="success" width="20%">离职日期:</td>
									<td align="left"><input name="departureDate" value="${t.departureDate}"
										class="input-control" size="20" id="_departureDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" ><span class="glyphicon glyphicon-calendar"></span></td>
									<td class="success" width="20%">户口性质:</td>
									<td align="left">
										<select name="accountNature">
											<option value=""></option>
											<option value="RURAL" <c:if test="${t.accountNature=='RURAL'}">selected="selected"</c:if>>农村</option>
											<option value="TOWN"  <c:if test="${t.accountNature=='TOWN'}">selected="selected"</c:if>>城镇</option>
										</select>
									</td>
								</tr>
								
								<tr height="280"> 		
						    		<td  width="50%" colspan="2">所有项目列表<br/>
						    			<div class="zTreeDemoBackground left" style="height: 200px;overflow-y:scroll; ">
											<ul id="tree" class="ztree"></ul>
										</div>
						    		</td>
						    		<td  width="50%" colspan="2">所有角色列表<br/>
						    			<div class="zTreeDemoBackground left" style="height: 200px;overflow-y:scroll; ">
											<ul id="tree_role" class="ztree"></ul>
										</div>
						    		</td>
						    	</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="saveBtn" >保存</button>
				
			</div>
		</div>
	</div>
</div>
