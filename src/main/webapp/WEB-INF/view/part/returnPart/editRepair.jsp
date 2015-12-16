<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript">
	$(function(){
		$("#_printBtn").click(function(){
			$(".PrintArea").printArea();
		});
		var faults = <%=request.getAttribute("faults")%>;
		$("#_initFailureTest").typeahead({source:faults,items: 8,matcher:function(item){
			if($("#_initFailureTest").val().trim()==""){
				return item;
			}else{
				return ~item.toLowerCase().indexOf(this.query.toLowerCase());
			}
		}});
		$("input[name='scrap']").click(function(){
			var is=false;
			if($(this).is(":checked")){
				is=true;
			}
			$("input[name='scrap']").attr('checked',false);
			if(is==true){
				$(this).prop('checked',true);
			}else{
				$(this).prop('checked',false);
			}
		});
	});
	
	
</script>
<div class="modal fade" id="_operModal">
	<div class="modal-dialog"
		style="width: 800px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h6 class="modal-title">&nbsp;</h6>
			</div>
			<form id="_operForm" action="${pageContext.request.contextPath}/part/returnPart/addSaveRepair" method="${_method }">
			<div class="modal-body PrintArea">
				<div class="control-group panel panel-info" style="width: 700px;">
					<div class="panel-heading" style="text-align: center;"><H5>返件信息</H5></div>
						<input type="hidden" value="${t.id}" name="id">
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<td class="success"  width="20%">CallNo:</td>
									<td align="left">${t.callno}</td>
									<td class="success" width="20%">出库单号:</td>
									<td align="left">${t.outOrder}</td>
								</tr>
								<tr>
									<td >备件号:</td>
									<td align="left" >${t.parts }   ${t.partsName }
									</td>
									<td >实际返件号:</td>
									<td align="left">${t.relParts }</td>
								</tr>
								<tr>
									<td class="success" >
										<input type="checkbox" name="scrap" <c:if test='${t.scrap==1}'>checked="checked"</c:if> value="1">是报废
										<input type="checkbox" name="scrap" <c:if test='${t.scrap==0}'>checked="checked"</c:if> value="0">否报废
									</td>
									<td align="left"></td>
									<td class="success" >返件状态:</td>
									<td align="left">
										<select class="input-control" disabled="disabled">
											<c:forEach items="${returnPartStatus}" var="s">
										 		<option value="${s.key }" <c:if test='${t.returnStatus==s.key }'>selected="selected"</c:if>>${s.value }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td >分配:</td>
									<td align="left">
										<select name="distribution" id="_distribution" class="input-control" disabled="disabled">
											<option value="-1"></option>
											<option value="initial_check_engineer" <c:if test='${t.distribution=="initial_check_engineer" }'>selected="selected"</c:if>>初检工程师</option>
											<option value="level_two_repair_engineer" <c:if test='${t.distribution=="level_two_repair_engineer" }'>selected="selected"</c:if>>二级维修</option>
										</select>
									</td>
									<td ></td>
									<td align="left">
									</td>
								</tr>
								<tr>
									<td class="success" >分配时间:</td>
									<td align="left">${t.distributionDate}</td>
									<td class="success" >返回时间:</td>
									<td align="left" >${t.returnDate}</td>
								</tr>
								<tr>
									<td width="30%" colspan="4" align="left">再生信息:</td>
								</tr>
								<tr>
									<td class="success" >检验初始故障:</td>
									<td align="left">
										<input name="initFailureTest" id="_initFailureTest" value="${t.initFailureTest }" data-provide="typeahead">
									</td>
									<td class="success" >维修结果:</td>
									<td align="left">
										<input type="radio" name="repairResult" value="1" <c:if test='${t.repairResult==1}'> checked="checked" </c:if>>修复	<input type="radio" name="repairResult" value="0" <c:if test='${t.repairResult==0 }'> checked="checked" </c:if>>未修复
									</td>
								</tr>
								<tr>
									<td >备注:</td>
									<td align="left" colspan="3">
										<textarea name="remark" rows="3" cols="85" class="input-control" >${t.remark }</textarea>
									</td>
								</tr>
							</tbody>
						</table>
				</div>
			</div>
			</form>
			<div class="modal-footer" style="padding-right: 50px;">
				<button type="button" class="btn btn-default" id="saveBtn" >保存</button>
				<button type="button" class="btn btn-default" id="finishBtn" >完成</button>
				
				<button type="button" class="btn btn-default" id="_printBtn">打 印</button>
			</div>
		</div>
	</div>
</div>
