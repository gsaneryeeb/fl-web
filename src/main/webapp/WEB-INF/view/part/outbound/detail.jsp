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
					<div class="panel-heading" style="text-align: center;">出库单信息</div>
						<table class="table	table-bordered table-condensed">
								<tr>
									<td colspan="7">
										<div style="float: left" align="left">出库单号:${t.outOrder }</div>
										<div align="right">服务站:${t.station }</div>
									</td>
								</tr>
								<tr>
									<td>序号</td>
									<td>CallNo</td>
									<td>客户姓名</td>
									<td>备件号</td>
									<td>描述</td>
									<td>数量</td>
									<td>备注</td>
								</tr>
								<tr>
									<td>1</td>
									<td>${t.callno }</td>
									<td>${t.cusName }</td>
									<td>${t.actualUsePart }</td>
									<td>${t.partsDes }</td>
									<td>${t.useNumber }</td>
									<td>${t.remark }</td>
								</tr>
								<tr>
									<td colspan="7">
										<div style="float: left" align="left">出库人:${t.operUser }</div>
										<div align="right">出库日期:${t.sendTime }</div>
									</td>
								</tr>
						</table>
				</div>							
			</div>

			<div class="modal-footer">				
				<button type="button" class="btn btn-primary" id="printBtn">打 印</button>
				
			</div>
		</div>
	</div>
</div>