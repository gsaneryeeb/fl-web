<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript">
	$(function(){
		$("#printBtn").click(function(){
			$(".PrintArea").printArea();
			location.reload();
		});
	});
	
</script>
<div class="modal fade" id="_detailModal">
	<div class="modal-dialog"
		style="width: 800px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h6 class="modal-title">&nbsp;</h6>
			</div>
			<div class="modal-body PrintArea">
				<div class="control-group panel panel-info" style="width: 700px;">
					<div class="panel-heading" style="text-align: center;">
						<H5>返件信息<font id="printId" style="float: right;"></font></H5>
					</div>
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<td class="success"  width="20%">CallNo:</td>
									<td align="left" width="30%">${vo.callno}</td>
									<td class="success" width="20%">出库单号:</td>
									<td align="left">${vo.outOrder}</td>
								</tr>
								<tr>
									<td >备件号:</td>
									<td align="left" >${vo.parts} ${vo.partsName }</td>
									<td ><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>实际返件号:</td>
									<td align="left" id="_relPartsTd">
										${vo.relParts}
									</td>
								</tr>
								<tr>
									<td>备件名称:</td>
									<td colspan="3" id="_partDes" align="left">
										${p.name }
									</td>
								</tr>
								<tr>
									<td class="success" >
										<input type="checkbox" name="scrap" value="1" <c:if test='${vo.scrap==1}'>checked="checked"</c:if> disabled="disabled">是报废
										<input type="checkbox" name="scrap" value="0" <c:if test='${vo.scrap==0}'>checked="checked"</c:if> disabled="disabled">否报废
									</td>
									<td align="left"></td>
									<td class="success" >返件状态:</td>
									<td align="left">
										<select name="returnStatus" class="input-control" id="_returnStatus" disabled="disabled">
											<option value="-1"></option>
											<c:forEach items="${returnPartStatus}" var="s">
										 		<option value="${s.key }" <c:if test='${vo.returnStatus==s.key }'>selected="selected"</c:if>>${s.value }</option>
											</c:forEach>
										</select>
									</td>
								
								</tr>
								<tr>
									<td >分配:</td>
									<td align="left">
										<select name="distribution" id="_distribution" class="input-control" disabled="disabled">
											<option value="-1"></option>
											<option value="initial_check_engineer" <c:if test='${vo.distribution=="initial_check_engineer" }'>selected="selected"</c:if>>初检工程师</option>
											<option value="level_two_repair_engineer" <c:if test='${vo.distribution=="level_two_repair_engineer" }'>selected="selected"</c:if>>二级维修</option>
										</select>
									</td>
									<td >职责分类:</td>
									<td align="left">
										
										<c:if test='${vo.distribution=="initial_check_engineer" }'>
										A壳，B壳，C壳，D壳，风扇，U型盖板，屏轴，喇叭，硬盘盖，LED扫描灯连线，防滚架，小黄头，键盘，U架，掌托，鼠标，无线网卡，电源适配器，PCI卡槽，扩展坞，转接线，连接线，屏滚架
										</c:if>
										<c:if test='${vo.distribution=="level_two_repair_engineer" }'>
										主板，显卡，内存，音频接口，电池，LCD屏线，屏，IO卡，HDD，高压卡，蓝牙，光驱，电源，网卡接口板，摄像头，控制板，台机 光驱，网卡接板，bios电池
										</c:if>
										
									</td>
								</tr>
								<tr>
									<td class="success" >分配时间:</td>
									<td align="left" id="_distributionDateTd">
									<label>${vo.distributionDate}</label>
									</td>
									<td class="success" >返回时间:</td>
									<td align="left" id="_returnDateTd">
									<label>${vo.returnDate}</label>
									</td>
								</tr>
							</tbody>
						</table>
				</div>
			</div>
			<div class="modal-footer" style="padding-right: 50px;">
				<button type="button" class="btn btn-default" id="printBtn" >打 印</button>
			</div>
		</div>
	</div>
</div>
