<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 弹出页面 -->
<script type="text/javascript">
	$(function(){
		$("#printBtn").click(function(){
			$(".PrintArea").printArea();
			location.reload();
		});
		$(".close").click(function(){
			location.reload();
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
					<div class="panel-heading" style="text-align: center;">入库单信息</div>
						<table class="table	table-bordered table-condensed">
							<c:forEach items="${list }" var="t">
								<tr>
									<td colspan="6">
										<div style="float: left" align="left">入库单号:${t.inOrder }</div>
									</td>
								</tr>
								<tr>
									<td>备件FRU</td>
									<td>备件名称</td>
									<td>备件描述</td>
									<td>数量</td>
									<td>工程师</td>
								</tr>
								
								<tr>
									<td>${t.p.no }</td>
									<td>${t.part }</td>
									<td>${t.p.partDes }</td>
									<td>${t.number }</td>
									<td>${t.engineerName }</td>
								</tr>
								
								<tr>
									<td colspan="6">
										<div style="float: left" align="left">库管确认签字:</div>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<div align="left">入库日期:${t.operDate }</div>
									</td>
								</tr>
								</c:forEach>
						</table>
				</div>							
			</div>

			<div class="modal-footer">				
				<button type="button" class="btn btn-primary" id="printBtn">打 印</button>
				
			</div>
		</div>
	</div>
</div>