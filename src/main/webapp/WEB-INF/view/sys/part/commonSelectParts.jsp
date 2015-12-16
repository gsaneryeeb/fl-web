<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 弹出页面 -->
<div class="modal fade" id="_detailModal">
	<div class="modal-dialog" style="width: 900px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove"></span></button>
				<h4 class="modal-title">备件信息列表</h4>
			</div>
			<div class="panel-heading">
					<table style="width: 100%;" id="searchTable">
						<tr>
							<td style="width: 50%;" align="left">备件号: <input name="parts"
								id="s_parts" value="${search_parts }" class="input-control"></td>
							<td align="right">
								<button class="btn btn-primary btn-sm" onclick="search()">
									<span class="glyphicon glyphicon-search"></span>查询
								</button>
							</td>
						</tr>
					</table>
				</div>
			<div class="modal-body content_scroll" id="content" >
										
			</div>

			<div class="modal-footer">				
				<button type="button" class="btn btn-default" id="select">选择</button>
				
			</div>
		</div>
	</div>
</div>
