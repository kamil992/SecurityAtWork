<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>

<html>

<head>
<title>log in</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" 
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
</head>

<body>
<h1 style="text-align: center">LOGIN HERE</h1>
<div id="form">
<form:form action="${pageContext.request.contextPath}/authenticateUser" method="POST">

<input type="hidden"
		   name="${_csrf.parameterName}"
		   value="${_csrf.token}"
		/>
		
	<c:if test="${param.error != null}">
		<div class="alert alert-danger" role="alert">
  			You entered invalid username or password!
		</div>
	</c:if>
	
	<c:if test="${param.logout != null}">
		<div class="alert alert-success" role="alert">
  			You have been logged out succesfull.
		</div>
	</c:if>
	
	<div  class="form-group">
    <label for="username">Username: </label>
    <input type="text" class="form-control" id="username"  placeholder="Enter Your username" name="username">
  </div>
  <div class="form-group">
    <label for="password">Password: </label>
    <input type="password" class="form-control" id="password" placeholder="Password" name ="password">
  </div>
  <button type="submit" class="btn btn-primary">Login</button>

</form:form>
</div>


<style>
	form{
	margin-top : 30px;
	margin-left : 320px;
	margin-right : 320px;}
	
	
	body{
	margin: 50px;}
	
	
</style>

</body>

</html>