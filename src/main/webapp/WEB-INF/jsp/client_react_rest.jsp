<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
	<title>A Java Spring Boot JAX-RS Jersey REST JPA Web application!</title>
	
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        
  
	<style>
		.header-text { Color: Green; font-family: Verdana, sans-serif; font-size: 14pt}
		.body-content { margin-left: 10pt; margin-right: 10pt; font-family: Verdana, sans-serif}


         #title {
                 text-align: center;
                 font-family: Verdana, sans-serif;
                }

         #persons {
                  text-align: center;
                  font-family: "Verdana, sans-serif";
                  font-size: 14pt;
                  border-collapse: collapse;
                  border: 3px solid #ddd;
                  width: 100%;
                  }

         #persons td, #persons th {
                   border: 1px solid #ddd;
                   padding: 8px;
                  }

        #persons tr:nth-child(even){background-color: #f2f2f2;}

        #persons tr:first-child {color: green; background-color:white }
        #persons tr:first-child:hover {color: green; background-color: white; cursor:default;}

        #persons tr:hover {background-color: #ddd; cursor: pointer;}

	</style>

</head>
<body>

	
	<jsp:include page="header_menu.jsp" />
    <div class="container">

	<div class="body-content">
     

	<div class="header-text" >${messageclientreactrest}</div>
    
    <br>
    Getting the Persons by a ReactJS client and the Jersey Rest Web API
    <br><br>
    

   <!--Here goes the API data-->
   <div id="rootapi"></div>


   <script src="https://cdnjs.cloudflare.com/ajax/libs/react/15.4.2/react.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/react/15.4.2/react-dom.js"></script>


   <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.21.1/babel.min.js"></script>


   <script type="text/babel" src="react/getpersonsreact.jsx" data-presets="es2015,react">
   </script>

    
</body>
</html>