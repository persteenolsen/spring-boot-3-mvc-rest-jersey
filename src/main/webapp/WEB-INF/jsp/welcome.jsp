<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
	<title>A Java Spring Boot 3 JAX-RS Jersey REST JPA Web application!</title>
	
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
	<style>
		.header-text {Color: Green; font-family: Verdana, sans-serif; font-size: 14pt}
		.body-content{margin-left: 10pt; margin-right: 10pt; font-family: Verdana, sans-serif}
	</style>

</head>
<body>

	
	<jsp:include page="header_menu.jsp" />
	
	<div class="body-content">


	<div class="header-text" >${welcomemessage}</div>
	
	<br>

	<div class="body-text" >${memorymessage}</div>
	
	<br>
	
	<b>Note:</b> The Web applications 1 minute initial load time is because I am using
	a <br><i>Free App Service Plan at Microsoft Azure</i><br> 
	because the work is for demonstration and testing purposes only!
	
	<br>
	<br>
	This Java Spring Boot 3 JAX-RS Jersey REST JPA Web application was made by the following technology:
	<br><br>

	<ul>
    <li>Uptated: 08-02-2025</li>
	<li>Visual Studio Code with the Microsoft Java Extension Pack</li>
	<li>Java 17</li>
	<l>Spring Boot 3</l>	
	<li>Microsoft Azure App Service with a Free App Service Plan for web hosting</li>
	
    <li>JVM memory have been set to an alocation of 512 MB both initial and max because of the limited physial memory</li>
	<li>MySQL Database</li>
	</ul>

	<ul>
		<li>Datasource Default Hikari</li>
		<li>Jersey REST used for implementing JAX-RS API, MVC as well as a Service and a JPA Repository layer</li>	
		<li>Maven as build tool</li>	
		<li>JPA and Hibernate for initializing the Database</li>
		<li>Hibernate Validator and Apache Commons Validater for server side form validation</li>
		
	</ul>

	<ul>
		<li>ReactJS, AngularJS, jQuery REST API Clients in JSP files for the View part ( GUI )</li>
		<li>Bootstrap for the responsive design</li>
	</ul>

	<ul>
		<li>Java 17 at Azure</li>
		<li>Tomcat 10.1 at Azure</li>
	</ul>
	
</div>

</body>
</html>