<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table style="width: 100%;" frame="below" bordercolorlight="#f5f5f5" class="panel-heading">
		<tr bgcolor="#f5f5f5" height="35px">
			<td width="92%" style="padding-left: 10px">备件出库查询
			</td>
		</tr>
</table>
<table id="diagnosisTable" class="table  table-striped table-bordered table-hover table-condensed active">
	<tr>
		<td>
			<div>
				<div class="table-responsive nutrition-div content_scroll">
					<form id="diagnosisForm">
						<table class="table table-condensed table-nutrition">
							<thead>
								<tr>
									<td>选择</td>
									<td>服务站编号</td>
									<td>服务站名称</td>
									<td>申请单数量</td>
									<td>维修类型</td>
								</tr>
							</thead>
							<tbody>
								<tr id="station_start" class="hidden"></tr>
								<tr id="station_end" class="hidden"></tr>
								<c:if test="${stations!=null && stations.size()>0}">
									<c:forEach items="${stations}" var="t">
										<tr>
											<td><input type="radio" value="${t.stationId }" name="stations"></td>
											<td>${t.stationNo }</td>
											<td>${t.station }</td>
											<td>${t.amounts }</td>
											<td>${status[t.type]}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</td>
	</tr>
</table>