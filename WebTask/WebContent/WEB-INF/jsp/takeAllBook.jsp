<%@ page language="java" contentType="text/html; charset=utf-8"
	import="by.htp.library.domain.Book" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ELibrary</title>
<link rel="stylesheet" type="text/css" 
	href="<c:url value="/resources/css/style2.css"/>"/>
</head>
<body>
	
	
	<fmt:setBundle basename="resources.pagecontent" scope="session" />
	
	
	<div id="main">
	
	<div id="wrapper">
		<div id="header">
			<img src="${pageContext.request. contextPath}/resources/images/books.jpg" width="100%" />
			<h1>
				<fmt:message key="label.electronicLibrary" />
			</h1>
		</div>	
	</div>
	<br />
	<br />
				
	<div id="language">
		<div id="languageRu">
			<form action="Controller" method="get">
				<input type="hidden" name="command" value="LOCALERU" /> 
				<input type="submit" value="Russian" />
			</form>
		</div>
		<div id="languageEn">
			<form action="Controller" method="get">
				<input type="hidden" name="command" value="LOCALEEN" />
			 	<input type="submit" value="English" />
			</form>
		</div>
	</div>
	
	<br />	
	<c:if test="${not empty  requestScope.errorMessage }">
		<c:out value="${  requestScope.errorMessage }" />
			<br />
	</c:if>
	<c:if test="${not empty  requestScope.messageInfo }">
		<c:out value="${  requestScope.messageInfo }" />
			<br />
	</c:if>
	
	
	Select 
	<br />
	<form action="Controller" method="get">
						
			<input type="hidden" name="command" value="searchBook" /> 
			<input type="text" name="nameBook" value="" /> 
			<input type="submit" value="Search of the book" />
	</form>		
	
	<div id="inline">
		<div id="content">
			<div id="available">
			<h1>
				<fmt:message key="label.availableBooks" />
			</h1>
			</div>
			
			<c:forEach items="${requestScope.List}" var="List">
			<div id="book">
				<div id="image">
					<c:if test="${not empty  List.image}">
						  <img src="${pageContext.request. contextPath}/ImageController?command=GetImage&index=${List.image}" width="70%"/>
					</c:if>
				</div>
					
				<div id="information">
				
				<strong>Name:</strong>
					<c:out value=" ${List.nameBook}" />
					<br />
					<strong>Writer:</strong>
					<c:out value=" ${List.writer}" />
					<br />
					<strong>Genre:</strong>
					<c:out value="${ List.genre}"/>
					<br />
					<strong>Published House:</strong>
					<c:out value="${ List.house}"/>
					<br />
					<strong>Year:</strong>
					<c:out value="${ List.year}"/>
					<br />
				
					<form action="Controller" method="get">
						<input type="hidden" name="command" value="viewBook" /> 
						<input type="hidden" name="id" value="${List.id}" /> 
						<input type="submit" value="View book" />
					</form>
		
					
					
				</div>
			</div>
			<br />
			
			</c:forEach>
		
		</div>

	<div id="enterReg">
		<form action="Controller" method="post">
			<input type="hidden" name="command" value="authorization" />
			<fmt:message key="label.login" />
			<br /> <input type="text" name="login" value="" /><br />
			<fmt:message key="label.password" />
			<br /> <input type="password" name="password" value="" /><br /> 
			<input type="submit" value="sign in" /> <br />
			
			<c:if test="${not empty  requestScope.message }">
				<c:out value="${  requestScope.message}" />
			</c:if>
		</form>
				
		<br />
		
		
		<form action="Controller" method="get">
			<input type="hidden" name="command" value="SHOWREGISTRATIONFORM" /> 
			<input type="submit" value="Registration" />
		</form>
	</div>
			<br />
			<br />
			
	<c:if test="${sessionScope.role=='admin' }">
		<form action="Controller" method="get">
						<input type="hidden" name="command" value="ShowAddNewBookForm" /> 
						<input type="submit" value="Add new book" />
					</form>
	</c:if>	
	
	<form action="Controller" method="get">
		<input type="hidden" name="command" value="exit" /> <br />
		<input type="submit" value="Exit" />
		</form>
		
	</div>
	
	<div id="footer"> All right reserved</div>
	
	</div>
</body>
</html>
