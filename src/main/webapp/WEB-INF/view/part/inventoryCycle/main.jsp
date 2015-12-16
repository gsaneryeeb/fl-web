<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/css/screen_index.css" />
<script>
	$(function(){
		$("._year").hide();
		$("._quarter").hide();
		$("#_type").change(function(){
			if($(this).val()=="M"){
				$("._month").show();
				$("._year").hide();
				$("._quarter").hide();
			}else if($(this).val()=="Q"){
				$("._month").hide();
				$("._year").hide();
				$("._quarter").show();
			}else if($(this).val()=="Y"){
				$("._month").hide();
				$("._year").show();
				$("._quarter").hide();
			}
		});
		$("#saveCycle").click(function(){
			var ul="${pageContext.request.contextPath}/part/inventoryCycle/check?type="+$("#_type").val()+"&month="+$("#_month").val()+"&year="+$("#_year").val()+"&quarter="+$("#_quarter").val();
			if($("#_type").val()=="Q"){
				if($("#_quarter").val()==""){
					alert("请选择季度!");
					return ;
				}
			}else if($("#_type").val()=="Y"){
				if($("#_year").val()==""){
					alert("请选择年份!");
					return ;
				}
			}else if($("#_type").val()=="M"){
				if($("#_month").val()==""){
					alert("请选择月份!");
					return ;
				}
			}
			$.ajax({
				type : "GET",
				url : ul,
				beforeSend : function() {
					$("#loading").show();
				},
				success : function(msg) {
					if(msg.result=="success"){
						window.location.href="${pageContext.request.contextPath}/part/inventoryCycle/twoPage";
					}else{
						$("#globalErrorDiv > strong").html("错误="+msg.ex);
						$("#globalErrorDiv").slideDown();
						setTimeout(function () {
							$("#globalErrorDiv").hide();
						},5000);
					}
				}
			});
		});
	});

</script>
<div class="panel panel-default div_screen" style="width: 50%;text-align: center;margin-left: auto;margin-right: auto;">
	<div class="panel-heading">
		<table style="width: 100%;" id="searchTable">
			<tr>
				<td align="center">类型:
					<select name="type" id="_type">
						<option value="M">月</option>
						<option value="Q">季度</option>
						<option value="Y">年</option>
					</select>
					<input id="_month" name="month" class="Wdate _month" onClick="WdatePicker({dateFmt:'yyyy-MM',maxDate:'%y-%M-%d'})" readonly="readonly">
				<input id="_year" name="year" class="Wdate _year" onClick="WdatePicker({dateFmt:'yyyy',maxDate:'%y-%M-%d'})" readonly="readonly">
					<input id="_quarter" name="quarter"  onclick="WdatePicker({dateFmt:'yyyy-M',maxDate:'%y-%M-%d', isQuarter:true, isShowOK:false,disabledDates:['....-0[5-9]-..','....-1[0-2]-..'], startDate:'%y-01-01' })" class="Wdate _quarter" readonly="readonly" />  
					<button class="btn btn-primary btn-sm" id="saveCycle">
						保存
					</button>
				</td>
			</tr>
		</table>
	</div>
</div>


<div id="_curdDiv"></div>

<jsp:include page="../../common/bottom.jsp" />
