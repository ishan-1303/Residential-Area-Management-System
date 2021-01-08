<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<h1>XYZ City Data</h1>
<h2>Login</h2>
<form action="login_action.jsp" method = "POST">
  <div class="form-group">
    <label for="email">Email address:</label>
    <input type="email" class="form-control" placeholder="Enter email" id="email" name="email">
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="pwd">
  </div>
  <div class="form-group">
  <label for="sel1">Select Area:</label>
	  <select class="form-control" id="sel1" name="area">
	    <option>Central</option>
	    <option>Downtown</option>
	    <option>East</option>
	    <option>West</option>
	    <option>North</option>
	    <option>South</option>
	  </select>
	</div>
  <% %>

  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</body>
</html>