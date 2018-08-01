<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
<title>main</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" 
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
</head>

<body>
<h2>Hello <security:authentication property="principal.username"/></h2>
<p> Your roles : <security:authentication property="principal.authorities"/></p>
<hr>
<h5>Your responsibilities at this day:</h5>
<security:authorize access="hasRole('EMPLOYEE')">
	<ul>
		<li>work hard!</li>
		<li>work honestly</li>
	</ul>
</security:authorize>

<security:authorize access="hasRole('ADMIN')">
	<ul>
		<li>check servers!</li>
		<li>check sites safety</li>
		<li>... and don't boring</li>
	</ul>
<hr>
</security:authorize>

<security:authorize access="hasRole('MANAGER')">
	<ul>
		<li>...do something</li>
	</ul>
<hr>
</security:authorize>

<security:authorize access="hasRole('BOSS')">
	<ul>
		<li>Put Your legs on Your table and rest...</li>
	</ul>
<hr>
</security:authorize>

<security:authorize access="hasRole('ADMIN')">
<h5>Message for admins: </h5>
<a href="${pageContext.request.contextPath}/admin">Information about admins meeting</a>
<br><br>
</security:authorize>

<security:authorize access="hasRole('MANAGER')">
<h5>Message for managers: </h5>
<a href="${pageContext.request.contextPath}/manager">Information about managers meeting</a>
<br><br>
</security:authorize>

<security:authorize access="hasRole('BOSS')">
<h5>Message for boss: </h5>
<a href="${pageContext.request.contextPath}/boss">Message to Mr Boss</a>
<br><br>
</security:authorize>

<form:form action="${pageContext.request.contextPath}/logout" method="POST">
		<input type="submit" value="Logout"/>
</form:form>

<style>
	body{
	margin: 50px;}
</style>



</body>
</html>