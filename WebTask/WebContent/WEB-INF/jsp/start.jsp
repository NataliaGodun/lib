<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<fmt:setLocale value="en" />
			<c:if test="${ not empty  requestScope.locale}">
				<c:set var="language" value="${requestScope.locale}" scope="session" />
				<fmt:setLocale value="${language}" />
			</c:if>
	<fmt:setBundle basename="resources.pagecontent" scope="session" />

	<fmt:message key="label.welcome" />

	
	<form action="Controller" method="post">
		<input type="hidden" name="command" value="authorization" />
		<fmt:message key="label.login" />
		<br /> <input type="text" name="login" value="" /><br />
		<fmt:message key="label.password" />
		<br /> <input type="password" name="password" value="" /><br /> <input
			type="submit" value="sign in" /> <br />
		<c:if test="${not empty  requestScope.errorMessage }">
			<c:out value="${  requestScope.errorMessage }" />
		</c:if>
		
	</form>

</body>
</html>
