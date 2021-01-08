<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
//String area = session.getAttribute("area");
//session.setAttribute("area", area);
%>
	<div class="row" style="height: 250px">
	<h1 style="text-align: center;"><%=session.getAttribute("area") %> Area</h1>
	<button style="position: absolute; top:1%; left:90%"><a href="index.jsp">LOG OUT</a></button>
	</div>
	<div class="row"style="height: 33.3%">
	<div class="col-sm-4"></div>
	<div class="col-sm-4">
	<div class="list-group">
	  <a href="fill.jsp" class="list-group-item">Add Person Details</a>
	  <a href="view.jsp" class="list-group-item">People Database - City</a>
	  <a href="view-area.jsp" class="list-group-item">People Database - Area</a>
	  <a href="area-ratio.jsp" class="list-group-item">View Gender-Ratio of Area</a>
	   <a href="city-ratio.jsp" class="list-group-item">View Gender-Ratio of City</a>
	   <a href="search.jsp" class="list-group-item">Search a Person</a>
	   <a href="delete.jsp" class="list-group-item">Delete a Person</a>
	</div>
	</div>
	<div class="col-sm-4"></div>
	</div>
	<div class="row" style="height: 33.3%">
	</div>
	
</body>
</html>