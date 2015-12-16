<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<div id="page_left">
	<div class="title_zn">${menu.cn }</div>
	<div class="title_en">${menu.en }</div>
	<% int i=0; %>
	<ul class="nav nav-pills nav-stacked">
		<c:forEach items="${leftMenuList}" var="l">
			<shiro:hasRole name="${l.name }">
				<li ><a href="${l.url}">${l.name }</a></li>
			</shiro:hasRole>
		</c:forEach>
	</ul>
	
	<div class="left_menu"><img src="${pageContext.request.contextPath}/static/images/left_menu.jpg" /></div>
	 
</div>
