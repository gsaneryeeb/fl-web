<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>

<!--头部内容开始-->
	<div id="page_top">
		<div id="top" class="hide"><img src="${pageContext.request.contextPath}/static/images/top_logo.png" />		     
		</div>
		<div id="menu">
			 <ul class="nav nav-pills" id="menu_ul">
				 <shiro:hasRole name="服务管理"><li <c:if test="${menu.superior eq 'SERVICE' }">class="active"</c:if>><a href="${pageContext.request.contextPath}/sys/left?model=SERVICE">服务管理</a></li></shiro:hasRole>
				 <shiro:hasRole name="备件管理"><li <c:if test="${menu.superior eq 'PART' }">class="active"</c:if>><a href="${pageContext.request.contextPath}/sys/left?model=PART">备件管理</a></li></shiro:hasRole>
				 <shiro:hasRole name="采购管理"><li <c:if test="${menu.superior eq 'PURCHASE' }">class="active"</c:if>><a href="${pageContext.request.contextPath}/sys/left?model=PURCHASE">采购管理</a></li></shiro:hasRole>
				 <shiro:hasRole name="运输管理"><li <c:if test="${menu.superior eq 'TRANSPORT' }">class="active"</c:if>><a href="${pageContext.request.contextPath}/sys/left?model=TRANSPORT">运输管理</a></li></shiro:hasRole>
				 <shiro:hasRole name="返件管理"><li <c:if test="${menu.superior eq 'RETURN' }">class="active"</c:if>><a href="${pageContext.request.contextPath}/sys/left?model=RETURN">返件管理</a></li></shiro:hasRole>
				 <shiro:hasRole name="订购测试"><li <c:if test="${menu.superior eq 'TESTING' }">class="active"</c:if>><a href="${pageContext.request.contextPath}/sys/left?model=TESTING">订购测试</a></li></shiro:hasRole>
				 <shiro:hasRole name="系统盘点"><li <c:if test="${menu.superior eq 'INVENTORY' }">class="active"</c:if>><a href="${pageContext.request.contextPath}/sys/left?model=INVENTORY">系统盘点</a></li></shiro:hasRole>
				 <shiro:hasRole name="统计查询"><li <c:if test="${menu.superior eq 'STATISTICS' }">class="active"</c:if>><a href="${pageContext.request.contextPath}/sys/left?model=STATISTICS">统计查询</a></li></shiro:hasRole>
				 <shiro:hasRole name="系统管理"><li <c:if test="${menu.superior eq 'SYSTEM' }">class="active"</c:if>><a href="${pageContext.request.contextPath}/sys/left?model=SYSTEM">系统管理</a></li></shiro:hasRole>
			 </ul>
		</div>		
	</div>