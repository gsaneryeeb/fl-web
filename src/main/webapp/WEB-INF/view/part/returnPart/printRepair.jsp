<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 弹出页面 -->
<script type="text/javascript">
	$(function(){
		$("#printBtn").click(function(){
			$(".PrintArea").printArea();
		});
		$("#close").click(function(){
			$("#_detailModal").modal("hide");
		});
	});
</script>
<div class="modal fade" id="_detailModal">
	<div class="modal-dialog" style="width: 900px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h6 class="modal-title">&nbsp;</h6>
			</div>
			<div class="modal-body PrintArea">
				<div class="control-group panel panel-info">
						<table class="table	table-bordered table-condensed">
							<tbody>
								<tr>
									<th class="table_screentitle">CallNo</th>
									<th class="table_screentitle">服务站名称</th>
									<th class="table_screentitle">申请备件号</th>
									<th class="table_screentitle">返回备件号</th>
									<th class="table_screentitle">返回时间</th>
								</tr>
							<c:forEach items="${list}" var="t">
								<tr align="center">
									<td>${t.callno}</td>
									<td>${t.station}</td>
									<td>${t.parts}</td>
									<td>${t.relParts}</td>
									<td>${t.returnDate}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
				</div>							
			</div>

			<div class="modal-footer">				
				<button type="button" class="btn btn-primary" id="printBtn">打 印</button>
				
			</div>
		</div>
	</div>
</div>