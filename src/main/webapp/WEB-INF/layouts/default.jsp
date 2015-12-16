<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<jsp:include page="../view/common/meta.jsp"/>
<head>
 <jsp:include page="../view/common/taglibs.jsp"/>
</head>
<body>
    <jsp:include page="top.jsp"/>
	<div class="center_rim">
	    <jsp:include page="left.jsp"/>
			<div id="page_right" style="background: url('${pageContext.request.contextPath}/static/images/main2.png') no-repeat;">
			     <div id="login">${USER.uName}  [<a href="${pageContext.request.contextPath}/sys/logout" id="exit">退出</a>]</div>
			     <div class="right_title"><span class="title_line01">${pagename}</span></div>
				 <div class="title_line02"></div>
				 <div class="right_content" >
				 	<sitemesh:body />
				 </div>			
			</div>
	</div>
	<jsp:include page="footer.jsp"/>
	<div id="todo_rim">
	    
	</div>
	
	<jsp:include page="../view/common/bottom.jsp"/>
</body>
</html>