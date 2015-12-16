<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
function goPageHis(size,page,accessPath,totalPage,filterItct){
	var reg=new RegExp("^[0-9]*$");
	if(!reg.test(page)){
		alert("请输入正确的数字");
		return ;
	}
	if(page-totalPage>0){
		page=totalPage;
	}
	var url="${pageContext.request.contextPath}/"+accessPath+"?page="+(page-1)+"&pageSize="+size+"&"+$("#searchTable :input").serialize();
	alert(filterItct);
	//$("${param.pageContainer}").load(url);
	$.post(
			url,
			$("${param.searchForm}").serialize(),
			function(data, status,xhr) {
				$("${param.pageContainer}").html(data);
			});
}
</script>


<c:set var="pageSize" value="${pageHis.size}"/>
<c:set value="${accessPath}" var="accessPath"></c:set>
<c:set var="displaySize" value="2"/>
<c:set var="current" value="${pageHis.number + 1}"/>
<c:set var="begin" value="${current - displaySize}"/>
<c:if test="${begin <= displaySize}">
    <c:set var="begin" value="${1}"/>
</c:if>
<c:set var="end" value="${current + displaySize}"/>
<c:if test="${end > pageHis.totalPages - displaySize}">
    <c:set var="end" value="${pageHis.totalPages - displaySize}"/>
</c:if>
<c:if test="${end < 0 or pageHis.totalPages < displaySize * 4}">
    <c:set var="end" value="${pageHis.totalPages}"/>
</c:if>


<div class="table-pagination row-fluid tool ui-toolbar">
	<c:if test="${pageHis.totalPages>0 }">
    <ul class="pagination" style="float: left; ">
        <c:choose>
            <c:when test="${pageHis.firstPage}">
                <li class="disabled"><a title="首页">首页</a></li>
                <li class="disabled"><a title="上一页">&lt;&lt;</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="javascript:goPageHis('${pageSize}', 1, '${accessPath}','${pageHis.totalPages }','${filterItct }');" title="首页">首页</a></li>
                <li><a href="javascript:goPageHis('${pageSize}', ${current - 1}, '${accessPath}','${pageHis.totalPages }','${filterItct }');" title="上一页">&lt;&lt;</a></li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="1" end="${begin == 1 ? 0 : 2}" var="i">
            <li <c:if test="${current == i}"> class="active"</c:if>>
                <a href="javascript:goPageHis('${pageSize}', ${i}, '${accessPath}','${pageHis.totalPages }','${filterItct }');" title="第${i}页">${i}</a>
            </li>
        </c:forEach>

        <c:if test="${begin > displaySize + 1}">
            <li><a>...</a></li>
        </c:if>

        <c:forEach begin="${begin}" end="${end}" var="i">
            <li <c:if test="${current == i}"> class="active"</c:if>>
                <a href="javascript:goPageHis('${pageSize}', ${i}, '${accessPath}','${pageHis.totalPages }','${filterItct }');" title="第${i}页">${i}</a>
            </li>
        </c:forEach>

        <c:if test="${end < pageHis.totalPages - displaySize}">
            <li><a>...</a></li>
        </c:if>

        <c:forEach begin="${end < pageHis.totalPages ? pageHis.totalPages - 1 : pageHis.totalPages + 1}" end="${pageHis.totalPages}" var="i">
            <li <c:if test="${current == i}"> class="active"</c:if>>
                <a href="javascript:goPageHis('${pageSize}', ${i}, '${accessPath}','${pageHis.totalPages }','${filterItct }');" title="第${i}页">${i}</a>
            </li>
        </c:forEach>

        <c:choose>
            <c:when test="${pageHis.lastPage}">
                <li class="disabled"><a title="下一页">&gt;&gt;</a></li>
                <li class="disabled"><a title="尾页">尾页</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="javascript:goPageHis('${pageSize}', ${current + 1}, '${accessPath}','${pageHis.totalPages }','${filterItct }');" title="下一页">&gt;&gt;</a></li>
                <li><a href="javascript:goPageHis('${pageSize}', ${pageHis.totalPages}, '${accessPath}','${pageHis.totalPages }','${filterItct }');" title="尾页">尾页</a></li>
            </c:otherwise>
        </c:choose>
        
    </ul>    
    
	    <ul class="pagination" style="float: left;">
	    	<li>
	        	<span style="height:31px;*height:17px;">第 <input size="1" style="height: 16px;border: 0px;" value="${current}" onblur="goPageHis('${pageSize}', $(this).val(), '${accessPath}','${pageHis.totalPages }');"/>页
		        &nbsp; <select style="height: 19px;"  onchange="goPageHis($(this).val(), ${current}, '${accessPath}','${pageHis.totalPages }','${filterItct }');">
		            <option value="10" <c:if test="${pageSize eq 10}">selected="selected" </c:if>>10</option>
		            <option value="20" <c:if test="${pageSize eq 20}">selected="selected" </c:if>>20</option>
		            <option value="30" <c:if test="${pageSize eq 30}">selected="selected" </c:if>>30</option>
		            <option value="50" <c:if test="${pageSize eq 50}">selected="selected" </c:if>>50</option>
		        </select> 
		        [共${pageHis.totalPages}页/${pageHis.totalElements}条]</span>
	        </li>
	    </ul>
	</c:if>
</div>
