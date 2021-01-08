<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete</title>
</head>
<body>
	<form action="delete_action.jsp" method = "POST">
	  <div class="form-group">
	    <label for="id">Enter ID:</label>
	    <input type="text" class="form-control" placeholder="Enter Aadhar ID" id="id" name="id">
  		<button type="submit" class="btn btn-primary">Delete</button>
  		
	  </div>
	 </form>
	 <a href="home.jsp"><button class="btn btn-success">Home Page</button></a>
</body>
</html>