<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript">
	$(function(){
		$(".DOA").hide();
		$("#printBtn").click(function(){
			$(".PrintArea").printArea();
			location.reload();
		});
		//Edit by saneryee 2015-03-12
		// HDD -> 硬盘
		$("#_distribution").change(function(){
			if($(this).val()=="initial_check_engineer"){
				$("#_duty").val("A壳，B壳，C壳，D壳，风扇，U型盖板，屏轴，喇叭，硬盘盖，LED扫描灯连线，防滚架，小黄头，键盘，U架，掌托，鼠标，无线网卡，电源适配器，PCI卡槽，扩展坞，转接线，连接线，屏滚架");
				$("#_distributionDate").val(CurentTime());
			}else if($(this).val()=="level_two_repair_engineer"){
				$("#_duty").val("主板，显卡，内存，音频接口，电池，LCD屏线，屏，IO卡，HDD，高压卡，蓝牙，光驱，电源，网卡接口板，摄像头，控制板，台机 光驱，网卡接板，bios电池");
				$("#_distributionDate").val(CurentTime());
			}else{
				$("#_distributionDate").val("");
				$("#_duty").val("");
			}
		});
		$("input[name='_fstatus']").click(function(){
			var is=false;
			if($(this).is(":checked")){
				is=true;
				$("#status").val($(this).val());
			}else{
				$("#status").val(0);
			}
			$("input[name='_fstatus']").attr('checked',false);
			if(is==true){
				$(this).prop('checked',true);
			}else{
				$(this).prop('checked',false);
			}
		});
		
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
		$("#_returnStatus").change(function(){
			if($(this).val()=="4"){
				$(".NODOA").hide();
				$(".DOA").show();
			}else{
				$(".DOA").hide();
				$(".NODOA").show();
			}
		});
	});
	function showParts(obj){
		var parts="";
		if($("#_relParts").val()==""){
			parts=$("#_parts").val();
		}else{
			parts=$("#_relParts").val();
		}
		$("#_partsDiv").load("${pageContext.request.contextPath}/sys/part/toSelectPartPage",function(){
			$("#_detailModal").modal("show");
			$("#content").load("${pageContext.request.contextPath}/sys/part/getParts?parts="+parts,function(){
				$(".returnHiden").hide();
			});
			$("#select").click(function(){
				var id=$("input[name='selectPartId']:checked").val();
				var no=$("#"+id).attr("no");
				var name=$("#"+id).attr("partName");
				$("#_relParts").val(no);
				$("#_checkPartName").val(name);
				$("#_relPartsId").val(id);
				$("#_detailModal").modal("hide");
				oper(no);
			});
		});
	}
	
	function search(){
		var parts="";
		if($("#s_parts").val()==""){
			parts=$("#_parts").val();
		}else{
			parts=$("#s_parts").val();
		}
		$("#content").load("${pageContext.request.contextPath}/sys/part/getParts?parts="+parts,function(){
			$(".returnHiden").hide();
		});
	}
	
	function CurentTime()
    { 
        var now = new Date();
       
        var year = now.getFullYear();       //年
        var month = now.getMonth() + 1;     //月
        var day = now.getDate();            //日
       
        var hh = now.getHours();            //时
        var mm = now.getMinutes();          //分
       
        var clock = year + "-";
       
        if(month < 10)
            clock += "0";
       
        clock += month + "-";
       
        if(day < 10)
            clock += "0";
           
        clock += day + " ";
       
        if(hh < 10)
            clock += "0";
           
        clock += hh + ":";
        if (mm < 10) clock += '0'; 
        clock += mm; 
        return(clock+":00"); 
    } 
	function oper(vl){
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/sys/part/getPart?no="+vl,
			beforeSend : function() {
				$("#loading").show();
			},
			success : function(msg) {
				$("#loading").hide();
				if(msg.result=="success"){
					$("#_partDes").text(msg.ex);
				}else{
					$("#_partDes").text("");
				}
			}
		});
	}
</script>
<div class="modal fade" id="_operModal">
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
					<form id="_operForm" action="${pageContext.request.contextPath}/part/returnPart/addSave" method="${_method }">
						<input type="hidden" value="${vo.rqId}" name="rqId">
						<input type="hidden" value="${vo.id}" name="id">
						<input type="hidden" value="${vo.rqType}" name="rqType">
						<input type="hidden" value="${vo.station}" name="station">
						<input type="hidden" value="${vo.number }" name="number">
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<td class="success"  width="20%">CallNo:</td>
									<td align="left"><input name="callno" value="${vo.callNo}" class="input-control" id="_callno" readonly="readonly"></td>
									<td class="success" width="20%">出库单号:</td>
									<td align="left"><input name="outOrder" value="${vo.outOrder}" class="input-control" id="_outOrder" readonly="readonly"></td>
								</tr>
								<tr>
									<td >备件号:</td>
									<td align="left" ><input name="parts" value="${vo.applyParts}" class="input-control" id="_parts" readonly="readonly" size="6">
										<input name="partsName" value="${vo.applyPartsName}" id="_partsName"  class="input-control" readonly="readonly" size="6">
									</td>
									<td ><span class="glyphicon glyphicon-asterisk" style="color: RGB(194,31,8)"></span>实际返件号:</td>
									<td align="left" id="_relPartsTd">
									<a href="#" >
										<input name="relParts" value="${vo.returnParts}" onchange="oper(this.value)" class="input-control" id="_relParts" onblur="this.value=this.value.toUpperCase()">
										<input type="hidden" name="relPartsId" value="${vo.returnPartsId}" id="_relPartsId">
										<input type="hidden" name="checkPartName"  id="_checkPartName">
										<span class="glyphicon glyphicon-new-window " onclick="javascript:showParts(this);return false;"></span>
									</a>
									</td>
								</tr>
								<tr>
									<td>备件名称:</td>
									<td id="_partDes" align="left"></td>
								</tr>
								<tr>
									<td class="success" >
										<input type="checkbox" name="scrap" value="1" <c:if test='${(vo.scrap==null || "".equals(vo.scrap))}'>disabled="disabled" </c:if><c:if test='${(vo.scrap!=null && vo.scrap!="null") && vo.scrap==1}'>checked="checked"</c:if>>是报废
										<input type="checkbox" name="scrap" value="0" <c:if test='${(vo.scrap==null || "".equals(vo.scrap))}'>disabled="disabled" </c:if><c:if test='${(vo.scrap!=null && vo.scrap!="null") && vo.scrap==0}'>checked="checked"</c:if>>否报废
									</td>
									<td align="left"></td>
									<td class="success" >返件状态:</td>
									<td align="left">
										<select name="returnStatus" class="input-control" id="_returnStatus">
											<option value="-1"></option>
											<c:forEach items="${returnPartStatus}" var="s">
										 		<option value="${s.key }" <c:if test='${vo.returnStatus==s.key }'>selected="selected"</c:if>>${s.value }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr class="DOA">
									<td>供应商:</td>
									<td align="left" colspan="3">
										<select name="supiroId" id="_supiroId">
											<option value=""></option>
											<c:forEach items="${supiros }" var="sp">
												<option value="${sp.id }">${sp.name }</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr class="NODOA">
									<td >分配:</td>
									<td align="left">
										<select name="distribution" id="_distribution" class="input-control" >
											<option value="-1"></option>
											<option value="initial_check_engineer">初检工程师</option>
											<option value="level_two_repair_engineer">二级维修</option>
										</select>
									</td>
									<td >职责分类:</td>
									<td align="left">
										<textarea rows="4" cols="50" id="_duty" name="duty" readonly="readonly" class="input-control" ></textarea>
									</td>
								</tr>
								<tr class="NODOA">
									<td class="success" >分配时间:</td>
									<td align="left" id="_distributionDateTd">
									<label><input class="input-control" value="${vo.distributionDate}"  id="_distributionDate" name="distributionDate" readonly="readonly" ></label>
									</td>
									<td class="success" >返回时间:</td>
									<td align="left" id="_returnDateTd">
									<label><input class="input-control" value="${vo.returnDate}"  id="_returnDate" name="returnDate" readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" ><span class="glyphicon glyphicon-calendar"></span></label>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
			<div class="modal-footer" style="padding-right: 50px;">
				<button type="button" class="btn btn-default" id="saveBtn" >保存</button>
				
				<button type="button" class="btn btn-default" id="printBtn" disabled="disabled">打 印</button>
			</div>
		</div>
	</div>
</div>
