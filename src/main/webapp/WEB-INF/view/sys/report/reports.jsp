<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div data-options="region:'center',border:false" style="padding: 0px;height: 500px;border: 0px;">
	<iframe src="${pageContext.request.requestURL.substring(0,pageContext.request.requestURL.indexOf(pageContext.request.contextPath))}${REL_REPORT}"  frameborder="1" style="width: 100%; height: 100%; text-align: center;border: 0px;" scrolling="no"></iframe>
</div>