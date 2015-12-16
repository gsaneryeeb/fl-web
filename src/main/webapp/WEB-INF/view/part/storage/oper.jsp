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
			$.post("${pageContext.request.contextPath}/part/storage/add",
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
					error: function(XMLHttpRequest, textStatus, errorThrown) {
	                        alert(XMLHttpRequest.status);
	                        alert(XMLHttpRequest.readyState);
	                        alert(textStatus);
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
				$(obj).children(":input[name='partses']").val(no);
				$(obj).children(":input[name='partIds']").val(id);
				$(obj).parent("td").next().next().next().children(":input[name='shelfNos']").val(rack);
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
<div class="modal fade" id="_operModal">
	<div class="modal-dialog"
		style="width: 1100px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h6 class="modal-title">&nbsp;</h6>
			</div>
			<div class="modal-body PrintArea">
				<table id="diagnosisTable" class="table table-condensed table-nutrition">
					<tr>
						<td class="sub_title" align="left">
							类型：
							<select id="_source">
								<option value="C">采购</option>
								<!-- <option value="T">测试</option> -->
							</select>
							<button id="tdAddBtn" type="button" style="float: right;" class="btn btn-primary btn-sm "><span class="glyphicon glyphicon-plus"></span>添加</button>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<div class="table-responsive nutrition-div content_scroll">
									<form id="operAddForm" action="${pageContext.request.contextPath}/part/storage/bachSave">
										<input name="source" id="_source2" type="hidden" value="C">
										<table id="operTable" class="table table-condensed table-nutrition">
											<thead>
												<tr>
													<th class="th_supiro" width="175">供应商</th>
													<th class="th_engineer" width="175">工程师</th>
													<th width="150">备件号</th>
													<th width="90">数量</th>
													<th width="90">单价</th>
													<th width="90">货位号</th>
													<th width="90">总价</th>
													<th width="80">操作</th>
												</tr>
											</thead>
											<tbody>
												<tr id="segment_start" class="hidden"></tr>
												<tr id="segment_end" class="hidden"></tr>
											</tbody>
										</table>
									</form>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer" style="padding-right: 50px;">
				<button type="button" class="btn btn-default" id="saveBtn" >保存</button>
				
				<button type="button" class="btn btn-default" id="printBtn">打 印</button>
			</div>
		</div>
	</div>
</div>
<div id="_partsDiv"></div>
