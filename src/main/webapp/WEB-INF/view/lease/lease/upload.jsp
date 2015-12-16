<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript">
$(function(){
});
</script>
<div class="modal fade" id="_operModal">
	<div class="modal-dialog"
		style="width: 600px; text-align: center; margin-left: auto; margin-right: auto;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body PrintArea">
				<div class="control-group panel panel-info">
				<div class="panel-heading" style="text-align: left;">附件管理</div>
					<form id="_operForm" action="${pageContext.request.contextPath}/lease/lease/upload" method="POST" enctype="multipart/form-data" target="picIframe">
						<table>
							<tr>
								<td align="left">
									<input type="hidden" name="id" value="${t.id }">
            						<label title="选择文件:"><input type="file" name="file" id="file"></label>
								</td>
							</tr>
						</table>
					</form>
					<iframe name="picIframe" style="display:none;"></iframe>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="uploadBtn">上传</button>
			</div>
		</div>
	</div>
</div>
