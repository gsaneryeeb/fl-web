<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript">
	$(function(){
		$(".th_engineer").hide();
		$("#_source").change(function(){
			if($(this).val()=="T"){
				$(".th_supiro").hide();
				$(".th_engineer").show();
			}else{
				$(".th_supiro").show();
				$(".th_engineer").hide();
			}
		});
		
		$("#tdAddBtn").click(function(){
			$.post("${pageContext.request.contextPath}/part/purchase/add",
				function(data, status, xhr) {
						if (status == "success") {
							$("#operTable tbody #segment_start").after(data);
							if($("#_source").val()=="T"){
								$(".th_supiro").hide();
								$(".th_engineer").show();
							}else{
								$(".th_supiro").show();
								$(".th_engineer").hide();
							}
						}
						$("input[name='numbers']").unbind('blur').click(function(){});
						$("input[name='numbers']").blur(function(){
							var num=$(this).val();
							var price=$(this).parent("td").next().children(":input[name='prices']").val();
							$(this).parent("td").next().next().next().children(":input[name='totals']").val(num*price);
						});
						$("input[name='prices']").unbind('blur').click(function(){});
						$("input[name='prices']").blur(function(){
							var price=$(this).val();
							var num=$(this).parent("td").prev().children(":input[name='numbers']").val();
							$(this).parent("td").next().next().children(":input[name='totals']").val(num*price);
						});
						///$("input[name='engineers']").unbind('change').click(function(){});
						//$("input[name='engineers']").change(function(){
						//	alert(0);
							//$(this).next().val($("input[name='engineers'] option:selected").attr("dir"));
						//});
						
						//$("input[name='supiros']").unbind('change').click(function(){});
						//$("input[name='supiros']").change(function(){
						//	alert(1);
							//$(this).next().val($("input[name='supiros'] option:selected").attr("dir"));
						//});
				});
		});
		
		$("#saveBtn").click(function(){
			var bl=false;
			$("input[name='partses']").each(function(){
				if($(this).val()==""){
					bl=true;
				}
			});
			
			$("input[name='numbers']").each(function(){
				if($(this).val()==""){
					bl=true;
				}
			});
			
			$("input[name='prices']").each(function(){
				if($(this).val()==""){
					bl=true;
				}
			});
			$("input[name='ordersDates']").each(function(){
				if($(this).val()==""){
					bl=true;
				}
			});
			
			$("input[name='inOrders']").each(function(){
				if($(this).val()==""){
					bl=true;
				}
			});
			if(bl){
				alert("请确定全部都填完!");
			}else{
				$("#_source2").val($("#_source").val());
				$.ajax({
					type : "POST",
					url : $("#operAddForm").attr("action"),
					data : $("#operAddForm").serialize(),
					dataType : "json",
					beforeSend : function() {
						$("#loading").show();
						$("#_operModal").modal("hide");
					},
					success : function(msg) {
						if(msg.result=="success"){
							$("#globalSuccessDiv > strong").html("操作成功");
							$("#globalSuccessDiv").slideDown();
							setTimeout(function () {
								location.reload();
							},2000);
						}else{
							$("#globalErrorDiv > strong").html("错误="+msg.ex);
							$("#globalErrorDiv").slideDown();
							setTimeout(function () {
								$("#globalErrorDiv").hide();
							},5000);
						}
					}
				});
			}
		});
	});
	function showParts(obj){
		$("#_partsDiv").load("${pageContext.request.contextPath}/sys/part/toSelectPartPage",function(){
			$("#_detailModal").modal("show");
			$("#content").load("${pageContext.request.contextPath}/sys/part/getParts?parts=",function(){
				$(".returnHiden").hide();
			});
			$("#select").click(function(){
				var id=$("input[name='selectPartId']:checked").val();
				var no=$("#"+id).attr("no");
				var rack=$("#"+id).attr("rack");
				var des=$("#"+id).attr("des");
				var name=$("#"+id).attr("partName");
				$(obj).children(":input[name='partses']").val(no);
				$(obj).children(":input[name='partIds']").val(id);
				$(obj).parent("td").next().children(":input[name='partRemark']").val(des);
				$(obj).parent("td").next().children(":input[name='partNames']").val(name);
				$("#_detailModal").modal("hide");
			});
		});
	}
	
	function search(){
		$("#content").load("${pageContext.request.contextPath}/sys/part/getParts?parts="+$("#s_parts").val(),function(){
			$(".returnHiden").hide();
		});
	}
	
	
	
	function deleteTr(obj){
		$(obj).parent("td").parent("tr").remove();	
	}
</script>
<div class="modal fade" id="_updateModal">
	<div class="modal-dialog"
		style="width: 1300px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h6 class="modal-title">&nbsp;</h6>
			</div>
			<div class="modal-body PrintArea">
				<table id="diagnosisTable" class="table table-condensed table-nutrition">
					<tr>
						<td>
							<div>
								<div class="table-responsive nutrition-div content_scroll">
									<form id="operEditForm" action="${pageContext.request.contextPath}/part/purchase/updateSave">
										<table id="operTable" class="table table-condensed table-nutrition">
												<tr>
													<th width="200">备件号</th>
													<th width="150">备件名称</th>
													<th width="70">订购数量</th>
													<th width="70">单价</th>
													<th width="90">订购日期</th>
													<th width="70">总价</th>
													<th width="175">订购来源</th>
													<th width="175">订单号</th>
													<th width="175">到货日期</th>
													<th width="175">分配工程师</th>
												</tr>
												<tr class="new">
													<td>
														<a href="#" onclick="javascript:showParts(this);return false;">
															<input name="partses" class="input-control" id="_parts" readonly="readonly" value="${t.part }">
															<input type="hidden" name="partIds" id="_partIds" value="${t.partId }">
															<input type="hidden" name="racks" id="_racks">
															<input type="hidden" name="ids" id="_ids" value="${t.id }">
															<span class="glyphicon glyphicon-new-window "></span>
														</a>
													</td>
													<td><input name="partNames" readonly="readonly" size="10" value="${t.partName }">
														<input type="hidden" name="partRemark" id="_partRemark" value="${t.partRemark }">
													</td>
													<td><input name="numbers" size="5" value="${t.number }" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>
													<td><input name="prices" size="5" value="${t.price }" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></td>
													<td><input name="ordersDates" value="${t.ordersDate }" readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" ></td>
													<td><input name="totals" value="${t.total }" readonly="readonly" size="5"></td>
													<td>
														<c:if test="${t.source=='RETURN' }">返件</c:if>
														<c:if test="${t.source=='PURCHASE' }">新采购</c:if>
														<c:if test="${t.source=='DOA' }">DOA</c:if>
													</td>
													<td><input name="inOrders" value="${t.inOrder }"></td>
													<!-- 
													<th width="90">
														<select name="speakForStatus">
															<option value="NOTARRIVE">未到货</option>
															<option value="ARRIVED">已到货</option>
														</select>
													</th> -->
													<td><input name="arrivalDates" value="${t.arrivalDate }" readonly="readonly" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" ></td>
													<td>
														<select name="allotEngineers">
															<option value=""></option>
															<option value="FIRST" <c:if test='${t.allotEngineer=="FIRST" }'>selected="selected"</c:if>>初检工程师</option>
															<option value="SECOND" <c:if test='${t.allotEngineer=="SECOND" }'>selected="selected"</c:if>>二级维修工程师</option>
														</select>
													</td>
												</tr>
										</table>
									</form>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer" style="padding-right: 50px;">
				<button type="button" class="btn btn-default" id="saveEditBtn" >保存</button>
			</div>
		</div>
	</div>
</div>
<div id="_partsDiv"></div>
